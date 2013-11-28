/**
 * Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * Section 0302
 * I pledge on my honor that I have not given or received
 * any unauthorized assistance on this assignment.
 **/

/* The Names class sends a request to the Social Security website that contains
 * data for the most common baby names by year for both boys and girls.
 * The request is sent through the getNames method which takes parameters
 * startYear, endYear, and rank, which specifies the range of years (inclusive)
 * and the number of rankings to be retrieved. For example,
 * getNames(2001, 2003, 3) will return the top 3 boys' names and the top 3
 * girls' names for 2001, 2002, and 2003.
 * Data for each year is retrieved by a different thread concurrently.
 */

package names;

import java.net.*;
import java.io.*;
import java.util.*;
import java.util.Map.Entry;

public class Names implements Runnable {
  
  private HashMap<Integer, HashMap<Integer, LinkedList<String>>> data =
      new HashMap<Integer, HashMap<Integer, LinkedList<String>>>();
  /* data HashMap stores Integer year and corresponding HashMap of rank and
     LinkedList with two elements, boyName and girlName (in that order) */
  private LinkedList<Thread> threads = new LinkedList<Thread>();
  // keep LinkedList of threads so that they can be joined before getNames exits
  private Integer year; /* communicates which year the thread is retrieving data
    for between getNames and run() */ 
  private int numNames;
  // communicates the number of rankings to retrieve between getNames and run()
  
  public void run() { //retrieves the data for one year, adds entries to "data"
    int myYear;
    // ensure "year" is stored locally before incremented
    synchronized(year) { 
      myYear = year;
      year++;
    }
    String str = "";
    try {
      URLConnection c = new URL(
          "http://www.ssa.gov/cgi-bin/popularnames.cgi").openConnection();
      c.setDoOutput(true);
      PrintWriter out = new PrintWriter(new OutputStreamWriter(
                                                c.getOutputStream()));
      out.write("year=" + myYear + "&top=" + numNames);
      out.flush();
      out.close();
      // read the html file returned
      BufferedReader in = new BufferedReader(new InputStreamReader(
                                    c.getInputStream()));
      String s; // store each line of the html file returned
      while((s = in.readLine()) != null)
        str += s + "\n";
    } catch(Exception e) {
      e.printStackTrace();
    }
    // Interpreting the file using String methods
    // Data is sandwiched between <td> and </td> HTML tags
    int startIndex = str.indexOf("Popularity in " + myYear);
      // "Popularity in " + myYear is the first meaningful line in the file
    int start, end, rank;
    for(int i = 0; i < numNames; i++) {
      start = str.indexOf("<td>", startIndex) + 4;
        //4 is the number of characters in <td>
      end = str.indexOf("</td>", startIndex);
      rank = i + 1;
    
      startIndex = end + 4;
      start = str.indexOf("<td>", startIndex) + 4;
      end = str.indexOf("</td>", startIndex);
      String boyName = str.substring(start, end);
    
      startIndex = end + 4;
      start = str.indexOf("<td>", startIndex) + 4;
      
      end = str.indexOf("</td>", startIndex);
      String girlName = str.substring(start, end);
      
      startIndex = end + 4;
      addToData(myYear, rank, boyName, girlName);
    }
  }
  
  /* getNames retrieves the data by creating a separate thread to retrieve
    the data for years between startYear and endYear, inclusive
    data is available starting from 1880, but is not accurate until 1937 when
    people got Social Security numbers. Data is added to the "data" field. This
    method should generally be called first after Names object is instantiated!
  */
  public void getNames(int startYear, int endYear, int numNames) {
    data.clear();
    threads.clear();
    this.numNames = numNames;
    year = startYear;
    int myYear = year;
    while(myYear <= endYear) {
      Thread t = new Thread(this);
      threads.add(t);
      t.start();
      myYear++;
    }
    for(Thread t: threads) {
      try {
        t.join();
      } catch (InterruptedException e) {
        e.printStackTrace();
      }
    } //wait until all threads are finished before exiting the method
  }
  
  /* addToData - helper method that adds a particular element to "data" given
     year, rank, boy name, and girl name */
  private void addToData(int year, int rank, String boy, String girl) {
    HashMap<Integer, LinkedList<String>> map =
        new HashMap<Integer, LinkedList<String>>();
      /* integer represents rank, LinkedList<String> contains two elements,
         first a boy's name, then a girl's name */
    LinkedList<String> names = new LinkedList<String>();
    names.add(boy);
    names.add(girl);
    map.put(rank, names);
    synchronized(this) { //prevent concurrent writing of data to "data"
      if(data.containsKey(year))
        data.get(year).put(rank, names);
      else
        data.put(year, map);
    }
  }
  
  /* getGirlName returns the girl name in "data" that corresponds to year and
     rank -- if "data" does not contain a corresponding element, the method
     returns null. */
  public String getGirlName(int year, int rank) {
    if(data.get(year) == null || data.get(year).get(rank) == null)
      return null;
    return data.get(year).get(rank).getLast();
      /* getLast() returns the last (second) element in LinkedList<String>,
         which corresponds with the girl's name */
  }
  
  /* getBoyName returns the boy name in "data" that corresponds to year and
  rank -- if "data" does not contain a corresponding element, the method
  returns null. */
  public String getBoyName(int year, int rank) {
    if(data.get(year) == null || data.get(year).get(rank) == null)
      return null;
    return data.get(year).get(rank).getFirst();
      /* getFirst() returns the first of the two elements in LinkedList<String>,
         which corresponds with the boy's name */
  }
  
  /* getGirlRank returns the ranking of a specified girl name for a particular
     year by looking in "data". If the name is not in "data" return -1 */ 
  public int getGirlRank(int year, String name) {
    HashMap<Integer, LinkedList<String>> map = data.get(year);
    if(map != null) // if the year exists in data
      for(Entry<Integer, LinkedList<String>> fe: map.entrySet())
        if(fe.getValue().getLast().equals(name))
          //getLast() corresponds to girl's name
          return fe.getKey();
    return -1;
  }

  /* getBoyRank returns the ranking of a specified boy name for a particular
  year by looking in "data". If the name is not in "data" return -1 */ 
  public int getBoyRank(int year, String name) {
    HashMap<Integer, LinkedList<String>> map = data.get(year);
    if(map != null) // if the year exists in data
      for(Entry<Integer, LinkedList<String>> fe: map.entrySet())
        if(fe.getValue().getFirst().equals(name))
          //getFirst() corresponds to boy's name
          return fe.getKey();
    return -1;
  }
}
