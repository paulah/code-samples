/**
 * Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * Section 0302
 * I pledge on my honor that I have not given or received
 * any unauthorized assistance on this assignment.
 **/

/* This class creates a linked list. Each element in the linked list is a node
 * which contains two properties, some object "data" and Node "next" which
 * refers to the next node in the list. If a node is the last node in the list,
 * "next" will be null. Elements are added to the end of the list.
 */

package list;

import java.util.Comparator;
import java.lang.Iterable;
import java.util.Iterator;
import java.lang.IndexOutOfBoundsException;
import java.util.NoSuchElementException;

public class List<T> implements Iterable<T>, Comparable<List<T>> {
  
  // you may not change this inner class!
  protected class Node<D> {
    D data;
    Node<D> next;
  }
  
  protected Comparator<T> myComparator;
  protected Node<T> head;
  
  public List(Comparator<T> comparator) {
      myComparator = comparator;
  }
  
  //copy constructor
  //attempts to create a deep copy, but does not because it cannot be done
  //with the generic type, thus the Node data will not be deep copied
  public List(List<T> otherList) {
    myComparator = otherList.myComparator;
    for(Node<T> curr = otherList.head; curr != null; curr = curr.next)
      add(curr.data);
  }

  //add new element to end of a list
  public List<T> add(T newElt) {
    Node<T> curr = head;
    Node<T> newNode = new Node<T>();
    newNode.data = newElt;
    if(curr == null) //if list is empty
      head = newNode;
    else {
      while(curr.next != null)
        curr = curr.next;
      curr.next = newNode;
    }
    return this;
  }

  //get the object at a particular index. Index values start at 0.
  public T get(int index) throws IndexOutOfBoundsException {
    int counter = 0;
    for(Node<T> curr = head; curr != null; curr = curr.next) {
      if(counter == index)
        return curr.data;
      counter++;
    }
    throw new IndexOutOfBoundsException();
  }
  

  
  //returns an object that matches the parameter, allows you to change the
  //properties of these objects if desired
  public T lookup(T element) {
    for(Node<T> curr = head; curr != null; curr = curr.next)
      if(myComparator.compare(curr.data, element) == 0)
        return curr.data;
    return null;
  }
  
  //returns the size of the linked list, if it is empty size will be 0
  public int size() {
    if(head == null)
      return 0;
    int counter = 0;
    for(Node<T> curr = head; curr != null; curr = curr.next)
      counter++;
    return counter;
  }
  
  //returns true if the list is empty
  public boolean isEmpty() {
    return(head == null);
  }
  
  //delete an element from the list by modifying the next pointers
  public List<T> delete(T element) throws NoSuchElementException {
    if(myComparator.compare(head.data, element) == 0) {
      head = head.next;
      return this;
    }
    else {
      for(Node<T> curr = head; curr.next != null; curr = curr.next)
        if(myComparator.compare(curr.next.data, element) == 0) {
          curr.next = curr.next.next;
          return this;
        }
    }
    throw new NoSuchElementException();
  }

  public void replace(T oldElt, T newElt) throws NoSuchElementException {
    for(Node<T> curr = head; curr != null; curr = curr.next)
      if(curr.data.equals(oldElt)) {
        curr.data = newElt;
        return;
      }
    throw new NoSuchElementException();
  }

  //return the largest object based on the List's comparator
  public T getLargest() throws NoSuchElementException {
    Node<T> largest = head;
    if(head == null) //for empty list
      throw new NoSuchElementException();
    for(Node<T> curr = head; curr != null; curr = curr.next)
      if(myComparator.compare(curr.data, largest.data) > 0)
        largest = curr;
    return largest.data;
  }
  
  //return the largest object based on the List's comparator
  public T getSmallest() throws NoSuchElementException {
    Node<T> smallest = head;
    if(head == null) //for empty list
      throw new NoSuchElementException();
    for(Node<T> curr = head; curr != null; curr = curr.next)
      if(myComparator.compare(curr.data, smallest.data) < 0)
        smallest = curr;
    return smallest.data;
  }

  //uses the object's toString method, putting a space between the elements
  //no space after the last element
  public String toString() {
    String str = "";
    if(head == null)
      return str;
    for(Node<T> curr = head; curr != null; curr = curr.next)
      if(curr.next == null) //no space after the last element!
        str += curr.data.toString();
      else
        str = str + curr.data.toString() + " ";
    return str;
  }

  public void clear() {
    head = null;
  }
  
  //if the lists are identical, compareTo returns 0
  //if the lists are not, it returns the value of the comparator of the first
  //  two non-matching elements
  //if the lists have the same elements but are not the same list,
  //  returns negative if the parameter is longer and positive otherwise
  public int compareTo(List<T> otherList) {
    Node<T> curr = head;
    Node<T> curr2 = otherList.head;
    
    while(curr != null && curr2 != null) {
      if(myComparator.compare(curr.data, curr2.data) < 0)
        return -1;
      else if(myComparator.compare(curr.data, curr2.data) > 0)
        return 1;
      if(curr.next == null && curr2.next != null)
        return -2;
      else if(curr.next != null && curr2.next == null)
        return 2;
      curr = curr.next;
      curr2 = curr2.next;
    }
    return 0;
  }

  public ListIterator<T> iterator() {
    return new ListIterator<T>(this);
  }

  public class ListIterator<E> implements Iterator<E> {
    private List<E> list;
    private int counter = 0;
    
    public ListIterator(List<E> myList) {
      list = myList;
    }
    
    public boolean hasNext() {
      if(list.size() == 0 || counter>list.size()-1) {
        return false;
      }
      return true;
    }

    public E next() throws NoSuchElementException {
      if(!hasNext())
        throw new NoSuchElementException();
      else {
        E newE = list.get(counter);
        counter++;
        return newE;
      }
    }

    public void remove() {
      throw new UnsupportedOperationException("You do NOT need to write " +
                                              "this method (but you can if " +
                                              "you want a challenge).");
    }
  }
}
