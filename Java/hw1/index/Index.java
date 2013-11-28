/**
 * Paula Huang
 * DirectoryID: phuang
 * UID: 112419189
 * Section 0302
 * I pledge on my honor that I have not given or received
 * any unauthorized assistance on this assignment.
 **/

package index;

import java.util.ArrayList;

public class Index {

  private ArrayList<WordEntry> wordList= new ArrayList<WordEntry>();

  public Index addWord(String word, int[] pages)
              throws InvalidParameterException {
    if(word.equals("") || word==null || pages==null || pages==(new int[]{}))
      throw new InvalidParameterException();
    else {
      boolean alreadyExists = false;
      
      //checks if "word" is already in the array
      for(int i=0; i<this.wordList.size(); i++)
         if(this.wordList.get(i).word.equals(word))
           alreadyExists = true;
             
      //delete duplicate entries from "pages"
      int counter = 1;
      int[] temp = new int[pages.length];
      temp[0] = pages[0];
      for(int i=1; i<pages.length; i++) {
        if(pages[i] != pages[i-1]) {
          temp[counter] = pages[i];
          counter++;
        }
      }
      int[] noDuplicate = new int[counter];
      for(int i=0; i<noDuplicate.length; i++) //shorten array to proper size
        noDuplicate[i] = temp[i];
      
      if(!alreadyExists)
        this.wordList.add(new WordEntry(word, noDuplicate));
      return this;
    }
  }

  public String longestWord() {
    int index = 0;
    if(this.wordList.size()==0)
      return "";
    if(this.wordList.size()==1)
      return this.wordList.get(0).word;
    
    ArrayList<WordEntry> list = this.wordList;
    for(int i=1; i<this.wordList.size(); i++)
      if(list.get(i).word.length() > list.get(i-1).word.length())
        index = i;
    return list.get(index).word;
  }

  public int numUniqueWords() {
    return this.wordList.size();
  }

  public int numWordOccurrences() {
    int counter = 0;
    for(int i=0; i<this.wordList.size(); i++)
      counter += this.wordList.get(i).pages.length;
    return counter;
  }

  public boolean isAlphabetized() {
    if(this.wordList.size()==0)
      return true;
    for(int i=1; i<this.wordList.size(); i++) {
      String current = this.wordList.get(i).toString();
      String previous = this.wordList.get(i-1).toString();
      if(current.compareToIgnoreCase(previous)<=0)
        return false;
    }
    return true;
  }

  public void removeWord(String word) throws InvalidParameterException {
    if(word.equals("") || word==null)
      throw new InvalidParameterException();
    else {
      for(int i=0; i<this.wordList.size(); i++)
        if(this.wordList.get(i).word.equals(word))
          this.wordList.remove(i);
    }
  }
  
  public String toString() {
    String str = "";
    for(int i=0; i<this.wordList.size(); i++) {
      str = str.concat(this.wordList.get(i).toString() + "\n");
    }
    return str;
  }
  
  public boolean equals(Object o) {
    if(o==this)
      return true;
    else if(!(o instanceof Index))
      return false;
    else {
      Index i = (Index)o;
      return i.wordList.equals(o);
    }
  }
}
