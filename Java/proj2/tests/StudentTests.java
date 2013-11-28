/**
 * Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * Section 0302
 * I pledge on my honor that I have not given or received
 * any unauthorized assistance on this assignment.
 **/

package tests;

import org.junit.*;
import static org.junit.Assert.*;
import list.*;

public class StudentTests {
  @Test public void testSize() {
    List<Integer> list1 = new List<Integer>(new IntegerComparator());
    assertEquals(0, list1.size());
    
    list1.add(3);
    assertEquals(1, list1.size());
    
    list1.add(4);
    assertEquals(2, list1.size());
  }
  
  @Test public void testCopy() {
    List<Integer> list1 = new List<Integer>(new IntegerComparator());
    list1.add(5);
    
    List<Integer> list2 = new List<Integer>(list1);
    assertEquals(5, (int)list1.get(0));
  }
  
  //test getting a particular index
  @Test public void testGet() {
    List<Integer> list1 = new List<Integer>(new IntegerComparator());
    list1.add(5);
    list1.add(3);
    assertEquals(3, (int)list1.get(1));
  }
  
  @Test public void testLookup() {
    List<Integer> list1 = new List<Integer>(new IntegerComparator());
    list1.add(5);
    list1.add(3);
    assertEquals(3, (int)list1.lookup(3));
  }
  
  @Test public void testIsEmpty() {
    List<Integer> list1 = new List<Integer>(new IntegerComparator());
    assertTrue(list1.isEmpty());
  }
  
  @Test public void testDelete() {
    List<Integer> list1 = new List<Integer>(new IntegerComparator());
    list1.add(5);
    list1.add(3);
    list1.delete(3);
    assertEquals("5", list1.toString());
    
    list1.delete(5);
    assertEquals("", list1.toString());
    
    list1.add(4);
    list1.add(7);
    list1.delete(7);
    assertEquals("4", list1.toString());
  }
  
  @Test public void testReplace() {
    List<Integer> list1 = new List<Integer>(new IntegerComparator());
    list1.add(5);
    list1.add(3);
    list1.replace(3, 4);
    assertEquals("5 4", list1.toString());
  }
  
  @Test public void testGetLargest() {
    List<Integer> list1 = new List<Integer>(new IntegerComparator());
    list1.add(5);
    list1.add(3);
    assertEquals(5, (int)list1.getLargest());
    
    list1.add(7);
    assertEquals(7, (int)list1.getLargest());
    
    list1.add(6);
    assertEquals(7, (int)list1.getLargest());
  }
  
  @Test public void testGetSmallest() {
    List<Integer> list1 = new List<Integer>(new IntegerComparator());
    list1.add(5);
    assertEquals(5, (int)list1.getSmallest());
    
    list1.add(3);
    assertEquals(3, (int)list1.getSmallest());
    
    list1.add(4);
    assertEquals(3, (int)list1.getSmallest());
    
    list1.add(-1);
    assertEquals(-1, (int)list1.getSmallest());
  }
  
  @Test public void testClear() {
    List<Integer> list1 = new List<Integer>(new IntegerComparator());
    list1.add(5);
    list1.clear();
    assertEquals(0, list1.size());
  }
  
  @Test public void testSortedList() {
    SortedList<Integer> list1 = new SortedList<Integer>(new IntegerComparator());
    list1.add(5);
    list1.add(3);
    list1.add(7);
    list1.add(2);
    assertEquals("2 3 5 7", list1.toString());
    
    assertEquals(7, (int)list1.lookup(7));
    
    list1.replace(7, 3);
    assertEquals("2 3 3 5", list1.toString());
  }
  
  @Test public void testCompareTo() {
    SortedList<Integer> list1 = new SortedList<Integer>(new IntegerComparator());
    list1.add(5);
    SortedList<Integer> list2 = new SortedList<Integer>(new IntegerComparator());
    list2.add(5);
    
    assertEquals(0, list1.compareTo(list2));
    
    list1.add(7);
    assertEquals(2, list1.compareTo(list2));
    
    list2.add(2);
    assertEquals(1, list1.compareTo(list2));
  }
}
