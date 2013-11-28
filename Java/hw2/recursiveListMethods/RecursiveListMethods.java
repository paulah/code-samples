/**
 * Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * Section 0302
 * I pledge on my honor that I have not given or received
 * any unauthorized assistance on this assignment.
 **/

package recursiveListMethods;

import java.util.*;

public class RecursiveListMethods {

  public static <T> void duplicateFirst(List<T> list) {
    if(list == null)
      throw new NullPointerException();
    if(list.size() > 1) {
      list.set(list.size()-1, list.get(0));
      duplicateFirst(list.subList(0, list.size()-1));
    }
  }

  public static <T> void duplicateLast(List<T> list) {
    if(list == null)
      throw new NullPointerException();
    if(list.size() > 1) {
      list.set(0, list.get(list.size()-1));
      duplicateLast(list.subList(1, list.size()));
    }
  }
  
  public static <T> boolean anyDuplicates(List<T> list) {
    if(list == null)
      throw new NullPointerException();
    if(list.size() < 2)
      return false;
    else if(checkLast(list))
      return true;
    else
      return checkLast(list.subList(0, list.size()-1));
      
  }
  
  private static <T> boolean checkLast(List<T> list) {
    if(list == null)
      throw new NullPointerException();
    if(list.size() < 2)
      return false;
    else if(list.get(0).equals(list.get(list.size()-1)))
      return true;
    else
      return checkLast(list.subList(1, list.size()));
  }
  
  public static <T extends Comparable<T>> T findLargest(List<T> list) {
    if(list == null)
      throw new NullPointerException();
    else if(list.size() == 0)
      throw new NoSuchElementException();
    return findLargest(list, 0, list.get(0));
  }
  
  private static <T extends Comparable<T>> T findLargest(List<T> list,
                    int index, T largest) {
    if(index == list.size()-1)
      return largest;
    else {
      if(list.get(index).compareTo(largest) >= 0)
        return findLargest(list, index+1, list.get(index));
      else
        return findLargest(list, index+1, largest);
    }
  }
}
