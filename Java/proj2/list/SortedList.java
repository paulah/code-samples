/**
 * Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * Section 0302
 * I pledge on my honor that I have not given or received
 * any unauthorized assistance on this assignment.
 **/

/* The SortedList class is a subclass of List, and only overrides certain
 * methods. The add() method adds elements in increasing order based on
 * the List's comparator. The lookup() method is more efficient because
 * it will stop searching after the list values surpass the desired value.
 * Likewise, getLargest() is more efficient--it simply returns the last value
 * in the list. getSmallest() returns the head of the list.
 * The replace() method is modified to keep the list in order.
 */
package list;

import java.util.Comparator;
import java.lang.IndexOutOfBoundsException;
import java.util.NoSuchElementException;

import list.List.Node;

public class SortedList<T> extends List<T> {
  public SortedList(Comparator<T> comparator) {
    super(comparator);
  }
  
  //add new element in order
  public SortedList<T> add(T newElt) {
    Node<T> n = new Node<T>();
    n.data = newElt;
    if(head == null) //empty list
      super.add(newElt);
    else if(head.next == null) { //one element
      if(myComparator.compare(head.data, newElt) >= 0) {
        n.next = head;
        head = n;
      }
      else
        super.add(newElt); //add element to the end of the list
    }
    else {
      if(myComparator.compare(head.data, newElt) >= 0) {
        //checks if element should be added to very beginning of the list
        n.next = head;
        head = n;
      }
      else {
        Node<T> curr = head;
        while(curr.next != null &&
                  myComparator.compare(curr.next.data, newElt) < 0) {
          //loop until current node is the node right before where element
          //will be inserted
          curr = curr.next;
        }
        n.next = curr.next;
        curr.next = n;
      }
    }
    return this;
  }
  
  //stop looking up element after current value is larger than the desired value
  public T lookup(T element) {
    for(Node<T> curr = head; curr != null &&
            myComparator.compare(curr.data, element) <= 0; curr = curr.next)
      if(myComparator.compare(curr.data, element) == 0)
        return curr.data;
    return null;
  }
  
  //ensure list stays in order when replacing
  public void replace(T oldElt, T newElt) throws NoSuchElementException {
    this.delete(oldElt);
    this.add(newElt);
  }
  
  //return the largest value, which is the data in the last node
  public T getLargest() throws NoSuchElementException {
    Node<T> largest = head;
    if(head == null) //for empty list
      throw new NoSuchElementException();
    for(Node<T> curr = head; curr != null; curr = curr.next)
      largest = curr;
    return largest.data;
  }
  
  //return the smallest value, which is the data in the first node (head)
  public T getSmallest() throws NoSuchElementException {
    if(head == null) //for empty list
      throw new NoSuchElementException();
    else
      return head.data;
  }
}
