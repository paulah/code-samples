package tests;

import tree.Tree;
import tree.EmptyTree;
import tree.EmptyTreeException;
import org.junit.*;
import static org.junit.Assert.*;

public class PublicTests {

  // tests calling size() on different-sized trees
  @Test public void testPublic1() {
    Tree<Integer, String> emptyTree= EmptyTree.getInstance();
    Tree<Integer, String> oneElementTree= tree1();
    Tree<Character, Integer> nonemptyTree= tree3();

    assertEquals(0, emptyTree.size());
    assertEquals(1, oneElementTree.size());
    assertEquals(14, nonemptyTree.size());
  }

  // tests calling lookup() on an empty tree, and on an element that's not
  // present in a nonempty tree
  @Test public void testPublic2() {
    Tree<Integer, String> emptyTree= EmptyTree.getInstance();
    Tree<Integer, String> nonemptyTree= tree2();

    assertNull(emptyTree.lookup(100));
    assertNull(nonemptyTree.lookup(100));
  }

  // tests calling lookup() on various elements of a nonempty tree
  @Test public void testPublic3() {
    Tree<Character, Integer> nonemptyTree= tree3();

    assertEquals((Integer) 1, nonemptyTree.lookup('c'));
    assertEquals((Integer) 4, nonemptyTree.lookup('p'));
    assertEquals((Integer) 14, nonemptyTree.lookup('y'));
  }

  // tests creating a tree with no elements and one with one element,
  // calling toString() on them
  @Test public void testPublic4() {
    Tree<Integer, String> emptyTree= EmptyTree.getInstance();
    Tree<Integer, String> smallTree= EmptyTree.getInstance();

    smallTree= smallTree.add(10, "ten");

    assertEquals("", emptyTree.toString());
    assertEquals("10=>ten", smallTree.toString());
  }

  // tests creating a tree with several elements, calling toString() on it
  @Test public void testPublic5() {
    Tree<Integer, String> nonemptyTree= tree2();

    assertEquals("7=>seven " +
                 "10=>ten " +
                 "12=>twelve " +
                 "15=>fifteen " +
                 "16=>sixteen " +
                 "17=>seventeen " +
                 "20=>twenty " +
                 "30=>thirty", nonemptyTree.toString());
  }

  // tests calling max() on a tree with several elements
  @Test public void testPublic6() {
    Tree<Character, Integer> nonemptyTree= tree3();

    try {
      assertEquals((Character) 'z', nonemptyTree.max());
    } catch (EmptyTreeException ete) {
      // if an exception is thrown the test will fail
    }
  }

  // tests calling min() on a tree with several elements
  @Test public void testPublic7() {
    Tree<Character, Integer> nonemptyTree= tree3();

    try {
      assertEquals((Character) 'a', nonemptyTree.min());
    } catch (EmptyTreeException ete) {
      // if an exception is thrown the test will fail
    }
  }

  // tests calling delete() on an empty tree and on an element that's not
  // present in a nonempty tree
  @Test public void testPublic8() {
    Tree<Integer, String> emptyTree= EmptyTree.getInstance();
    Tree<Integer, String> nonemptyTree= tree2();

    emptyTree= emptyTree.delete(100);
    assertEquals("", emptyTree.toString());

    assertEquals("7=>seven " +
                 "10=>ten " +
                 "12=>twelve " +
                 "15=>fifteen " +
                 "16=>sixteen " +
                 "17=>seventeen " +
                 "20=>twenty " +
                 "30=>thirty",
                 nonemptyTree.toString());
  }

  // tests calling delete() on various elements of a nonempty tree
  @Test public void testPublic9() {
    Tree<Integer, String> nonemptyTree= tree2();

    nonemptyTree= nonemptyTree.delete(15);
    assertEquals("7=>seven " +
                 "10=>ten " +
                 "12=>twelve " +
                 "16=>sixteen " +
                 "17=>seventeen " +
                 "20=>twenty " +
                 "30=>thirty",
                 nonemptyTree.toString());

    nonemptyTree= nonemptyTree.delete(16);
    assertEquals("7=>seven " +
                 "10=>ten " +
                 "12=>twelve " +
                 "17=>seventeen " +
                 "20=>twenty " +
                 "30=>thirty",
                 nonemptyTree.toString());

    nonemptyTree= nonemptyTree.delete(17);
    assertEquals("7=>seven " +
                 "10=>ten " +
                 "12=>twelve " +
                 "20=>twenty " +
                 "30=>thirty",
                 nonemptyTree.toString());
  }

  // tests calling removeSubTree() on various elements of a nonempty tree
  @Test public void testPublic10() {
    Tree<Integer, String> nonemptyTree= tree2();

    nonemptyTree= nonemptyTree.removeSubTree(17);
    assertEquals("7=>seven " +
                 "10=>ten " +
                 "12=>twelve " +
                 "15=>fifteen " +
                 "16=>sixteen " +
                 "20=>twenty " +
                 "30=>thirty",
                 nonemptyTree.toString());

    nonemptyTree= nonemptyTree.removeSubTree(16);
    assertEquals("7=>seven " +
                 "10=>ten " +
                 "12=>twelve " +
                 "15=>fifteen " +
                 "20=>twenty " +
                 "30=>thirty",
                 nonemptyTree.toString());
  }

  // private utility methods ////////////////////////////////////////////

  // returns a tree with one element, with Integer keys and String values
  private static Tree<Integer, String> tree1() {
    Tree<Integer, String> tree= EmptyTree.getInstance();

    tree= tree.add(15, "fifteen");

    return tree;
  }

  // returns a tree with several elements, with Integer keys and String values
  private static Tree<Integer, String> tree2() {
    Tree<Integer, String> tree= EmptyTree.getInstance();

    tree= tree.add(15, "fifteen").add(10, "ten").add(20, "twenty");
    tree= tree.add(7, "seven").add(12, "twelve").add(16, "sixteen");
    tree= tree.add(30, "thirty").add(17, "seventeen");

    return tree;
  }

  // returns a tree with several elements, with Character keys and Integer
  // values
  private static Tree<Character, Integer> tree3() {
    Tree<Character, Integer> tree= EmptyTree.getInstance();

    tree= tree.add('c', 1);
    tree= tree.add('o', 2);
    tree= tree.add('m', 3);
    tree= tree.add('p', 4);
    tree= tree.add('u', 5);
    tree= tree.add('t', 6);
    tree= tree.add('e', 7);
    tree= tree.add('r', 8);
    tree= tree.add('i', 9);
    tree= tree.add('z', 10);
    tree= tree.add('a', 11);
    tree= tree.add('b', 12);
    tree= tree.add('l', 13);
    tree= tree.add('y', 14);

    return tree;
  }

}
