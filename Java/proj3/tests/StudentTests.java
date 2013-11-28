package tests;

import java.util.ArrayList;

import tree.*;
import org.junit.*;
import static org.junit.Assert.*;

public class StudentTests {
  @Test public void testPathToRoot() {
    ArrayList<Integer> a = new ArrayList<Integer>();
    a.add(100);
    ArrayList<Integer> b = new ArrayList<Integer>();
    b.add(2);
    b.add(3);
    b.add(5);
    
    tree1().pathToRoot(2, a);
    assertEquals(a, b);
  }
  
  @Test public void testPathFromRoot() {
    ArrayList<Integer> a = new ArrayList<Integer>();
    a.add(100);
    ArrayList<Integer> b = new ArrayList<Integer>();
    b.add(5);
    b.add(3);
    b.add(2);
    
    tree1().pathFromRoot(2, a);
    assertEquals(a, b);
  }

  @Test public void testMin() throws EmptyTreeException {
    assertEquals(2, (int)tree1().min());
  }
  
  @Test public void testMax() throws EmptyTreeException {
    assertEquals(10, (int)tree1().max());
  }
  
  @Test public void testClone() {
    Tree<Integer, Integer> t = tree1().clone();
    assertTrue(t.haveSameKeys(tree1()));
    t.delete(3);
    assertEquals(6, tree1().size());
    assertEquals(5, t.size());
  }
  
  @Test public void testLookup() {
    assertEquals(4, (int)tree1().lookup(4));
  }
  
  @Test public void testHaveSameKeys() {
    Tree<Integer, Integer> e = EmptyTree.getInstance();
    assertFalse(e.haveSameKeys(tree1()));
    Tree<Integer, Integer> t1 = tree1();
    t1.removeSubTree(7);
    t1.removeSubTree(3);
    Tree<Integer, Integer> t2 = new NonEmptyTree<Integer, Integer>(5, 5);
    assertTrue(t1.haveSameKeys(t2));
  }
  
  private Tree<Integer, Integer> tree1() {
    Tree<Integer, Integer> t = new NonEmptyTree<Integer, Integer>(5, 5);
    t.add(3, 3);
    t.add(4, 4);
    t.add(2, 2);
    t.add(7, 7);
    t.add(10, 10);
    return t;
  }
}
