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
import java.util.*;

import recursiveListMethods.*;

public class StudentTests extends RecursiveListMethods {

  @Test public void testNoElementCase() {
    List<Integer> l = new ArrayList<Integer>();
    duplicateFirst(l);
    assertEquals(new ArrayList<Integer>(), l);
    
    duplicateLast(l);
    assertEquals(new ArrayList<Integer>(), l);
    
    assertFalse(anyDuplicates(l));
  }
  
  @Test public void testOneElement() {
    List<Integer> l = new ArrayList<Integer>();
    l.add(4);
    
    List<Integer> l2 = new ArrayList<Integer>();
    l2.add(4);
    
    duplicateFirst(l);
    
    assertEquals(l, l2);
    
    duplicateLast(l);
    
    assertEquals(l, l2);
    
    assertEquals(4, (int)findLargest(l));
    
    assertFalse(anyDuplicates(l));
  }
  
  @Test public void testTwoElements() {
    List<Integer> l = new ArrayList<Integer>();
    l.add(4);
    l.add(2);
    
    List<Integer> l2 = new ArrayList<Integer>();
    l2.add(4);
    l2.add(4);
    
    assertEquals(4, (int)findLargest(l));
    
    duplicateFirst(l);
    assertEquals(l, l2);
  }
  
  @Test public void testManyElements() {
    List<Integer> a = new ArrayList<Integer>();
    a.add(8);
    a.add(6);
    a.add(8);
    a.add(7);
    
    assertEquals(8, (int)findLargest(a));
    
    assertTrue(anyDuplicates(a));
    a.remove(0);
    assertFalse(anyDuplicates(a));
  }

}
