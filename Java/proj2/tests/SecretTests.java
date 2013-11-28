package tests;

import list.List;
import list.SortedList;
import list.IntegerComparator;
import java.util.NoSuchElementException;
import java.util.Iterator;
import java.util.Comparator;
import org.junit.*;
import static org.junit.Assert.*;

/*
 * Some of the tests use lists of other types; the comparators for these
 * tests should be added in the tests package.  Note that three of the tests
 * use an IntegerEfficiencyComparator, that allows us to test whether some
 * of the SortedList methods are more efficient than the corresponding List
 * methods.  An IntegerEfficiencyComparator has a counter that is
 * incremented every time its compare() method is called.  Another method
 * returns the value of the counter, which allows the same operation to be
 * performed with both a List and a SortedList, and the number of
 * comparisons performed to be inspected afterwards.  These tests will pass
 * not only if the results of the operations were correct, but if the
 * SortedList version of the operation used fewer comparions in doing the
 * operation.
 *
 * Note that some helper methods that are at the end of this class below
 * create and return lists that are used in several tests.
 */

public class SecretTests {

  // tests get() with List using a too-large index
  @Test(expected= IndexOutOfBoundsException.class) public void testSecret1() {
    List<Integer> list= new List<Integer>(new IntegerComparator());
    Integer item;

    list.add(6);
    list.add(2);
    list.add(9);
    list.add(3);
    list.add(7);

    item= list.get(6);
  }

  // tests lookup() with List with elements that aren't present
  @Test public void testSecret2() {
    List<Integer> list= new List<Integer>(new IntegerComparator());

    list.add(6);
    list.add(2);
    list.add(9);
    list.add(3);
    list.add(7);

    assertNull(list.lookup(1));
    assertNull(list.lookup(4));
    assertNull(list.lookup(5));
    assertNull(list.lookup(8));
  }

  // tests delete() on a SortedList with with elements that are not present
  @Test(expected= NoSuchElementException.class) public void testSecret3() {
    List<Integer> sortedList= new SortedList<Integer>(new IntegerComparator());

    sortedList.add(6);
    sortedList.add(2);
    sortedList.add(9);
    sortedList.add(3);
    sortedList.add(7);

    sortedList.delete(1);

    assertEquals("2 3 6 7 9", sortedList.toString());
  }

  // tests lookup() with a SortedList with elements that aren't present
  @Test public void testSecret4() {
    List<Integer> list= new SortedList<Integer>(new IntegerComparator());

    list.add(6);
    list.add(2);
    list.add(9);
    list.add(3);
    list.add(7);

    assertNull(list.lookup(1));
    assertNull(list.lookup(4));
    assertNull(list.lookup(5));
    assertNull(list.lookup(8));
  }

  // tests calling getLargest on an empty SortedList
  @Test(expected= NoSuchElementException.class) public void testSecret5() {
    SortedList<Integer> emptyList= 
                        new SortedList<Integer>(new IntegerComparator());
    Integer item;

    item= emptyList.getLargest();
  }

  // tests that delete() can be called on elements in List until the list is
  // empty, and that new elements then can be added to the empty list
  @Test public void testSecret6() {
    List<Integer> list= new List<Integer>(new IntegerComparator());

    list.add(6);
    list.add(3);
    list.add(4);
    list.add(7);
    list.add(2);

    list.delete(6);
    list.delete(3);
    list.delete(4);
    list.delete(2);
    list.delete(7);

    assertEquals("", list.toString());

    list.add(9);
    list.add(8);
    list.add(12);
    list.add(1);

    assertEquals("9 8 12 1", list.toString());
  }

  // tests if getSmallest() is more efficient in the SortedList class than
  // in the List class
  @Test public void testSecret7() {
    // keep references to comparators to access their count
    IntegerEfficiencyComparator compList= new IntegerEfficiencyComparator();
    IntegerEfficiencyComparator compSortedList=
                                new IntegerEfficiencyComparator();
    List<Integer> list= testList2(compList);
    SortedList<Integer> sortedList= testSortedList2(compSortedList);

    // reset the count to ensure only getSmallest() is tested
    compList.reset();
    assertEquals((Integer) 1, list.getSmallest());

    // reset the count to ensure only getSmallest() is tested
    compSortedList.reset();
    assertEquals((Integer) 1, sortedList.getSmallest());

    assertTrue(compSortedList.compareCount < compList.compareCount);
  }

  // tests if getLargest() is more efficient in the SortedList class than in
  // the List class
  @Test public void testSecret8() {
    // keep references to comparators to access their count
    IntegerEfficiencyComparator compList= new IntegerEfficiencyComparator();
    IntegerEfficiencyComparator compSortedList=
                                new IntegerEfficiencyComparator();
    List<Integer> list= testList2(compList);
    SortedList<Integer> sortedList= testSortedList2(compSortedList);

    // reset the count to ensure only getLargest() is tested
    compList.reset();
    assertEquals((Integer) 24, list.getLargest());

    // reset the count to ensure only getLargest() is tested
    compSortedList.reset();
    assertEquals((Integer) 24, sortedList.getLargest());

    assertTrue(compSortedList.compareCount < compList.compareCount);
  }

  // tests if lookup() is more efficient in SortedList than in List
  @Test public void testSecret9() {
    // keep references to comparators to access their count
    IntegerEfficiencyComparator compList= new IntegerEfficiencyComparator();
    IntegerEfficiencyComparator compSortedList=
                                new IntegerEfficiencyComparator();

    List<Integer> list= testList2(compList);
    SortedList<Integer> sortedList= testSortedList2(compSortedList);

    list.add(7);
    sortedList.add(7);

    // reset the count to ensure only lookup() is tested
    compList.reset();
    assertNotNull(list.lookup(7));

    // reset the count to ensure only lookup() is tested
    compSortedList.reset();
    assertNotNull(sortedList.lookup(7));

    assertTrue(compSortedList.compareCount < compList.compareCount);
  }

  // tests inserting duplicate elements in a List and a SortedList
  @Test public void testSecret10() {
    List<Integer> list= testList1(new IntegerComparator());
    List<Integer> sortedList= testSortedList1(new IntegerComparator());

    assertEquals("3 1 4 1 5 9 2 6 5 3 5 8 9 7 9", list.toString());
    assertEquals("1 1 2 3 3 4 5 5 5 6 7 8 9 9 9", sortedList.toString());
  }

  // tests calling delete() when multiple copies of the element to be deleted
  // are present in a SortedList
  @Test public void testSecret11() {
    List<Integer> list= testSortedList1(new IntegerComparator());

    list.delete(1);
    list.delete(1);
    list.delete(3);
    list.delete(3);
    list.delete(5);
    list.delete(9);
    list.delete(9);
    list.delete(9);

    assertEquals("2 4 5 5 6 7 8", list.toString());
  }

  // tests compareTo() with Lists of different lengths; also tests that
  // add() properly returns a reference to its current object
  @Test public void testSecret12() {
    List<Character> list1= new List<Character>(new CharacterComparator());
    List<Character> list2= new List<Character>(new CharacterComparator());
    List<Character> list3= new List<Character>(new CharacterComparator());
    List<Character> list4= new List<Character>(new CharacterComparator());

    list1.add('c').add('a').add('t');

    list2.add('m').add('o').add('o').add('s').add('e');

    list3.add('c');
    list3.add('a');
    list3.add('u');
    list3.add('l');
    list3.add('i');
    list3.add('f');
    list3.add('l');
    list3.add('o');
    list3.add('w');
    list3.add('e');
    list3.add('r');

    list4.add('c').add('a').add('t').add('t').add('l').add('e');

    assertTrue(list1.compareTo(list1) == 0);

    assertTrue(list1.compareTo(list2) < 0);
    assertTrue(list1.compareTo(list3) < 0);
    assertTrue(list1.compareTo(list4) < 0);

    assertTrue(list2.compareTo(list1) > 0);
    assertTrue(list3.compareTo(list1) > 0);
    assertTrue(list4.compareTo(list1) > 0);
  }

  // tests calling replace() when multiple copies of the element to be
  // replaced are present in a List
  @Test public void testSecret13() {
    List<Integer> list= testList1(new IntegerComparator());

    list.replace(1, 4);
    list.replace(1, 7);
    list.replace(3, 2);
    list.replace(3, 10);
    list.replace(5, 6);
    list.replace(9, 7);
    list.replace(9, 8);
    list.replace(9, 4);

    assertEquals("2 4 4 7 6 7 2 6 5 10 5 8 8 7 4", list.toString());
  }

  // tests the copy constructor with Lists of different lengths
  @Test public void testSecret14() {
    List<Character> list1= new List<Character>(new CharacterComparator());
    List<Character> list2= new List<Character>(new CharacterComparator());
    List<Character> list3= new List<Character>(new CharacterComparator());
    List<Character> list1Copy;
    List<Character> list2Copy;
    List<Character> list3Copy;

    list2.add('c');
    list2.add('a');
    list2.add('t');

    list3.add('m');
    list3.add('o');
    list3.add('o');
    list3.add('s');
    list3.add('e');

    list1Copy= new List<Character>(list1);
    assertEquals("", list1Copy.toString());

    list2Copy= new List<Character>(list2);
    assertEquals("c a t", list2Copy.toString());

    list3Copy= new List<Character>(list3);
    assertEquals("m o o s e", list3Copy.toString());
  }

  // tests that replace() in the SortedList class preserves the list's order
  @Test public void testSecret15() {
    SortedList<Character> list=
                          new SortedList<Character>(new CharacterComparator());

    list.add('m');
    list.add('z');
    list.add('h');
    list.add('b');
    list.add('e');

    list.replace('z', 'p');
    list.replace('b', 'c');
    list.replace('e', 'i');

    assertEquals(new String("c h i m p"), list.toString());
  }

  // tests the iterator for the List class returned by the iterator() method
  @Test public void testSecret16() {
    List<Character> list= new List<Character>(new CharacterComparator());
    String s= "";
    Iterator<Character> iter;

    list.add('c').add('a').add('t');

    iter= list.iterator();

    while (iter.hasNext())
      s += iter.next();

    assertEquals("cat", s);
  }

  // test that Lists and SortedLists returned by the copy constructors are
  // independent of the original list.  Note that a SortedList created by
  // the SortedList copy constructor should still be sorted, and that is is
  // necessary to override the copy constructor in the SortedList class- the
  // List copy constructor will not work.
  @Test public void testSecret17() {
    List<Character> list= new List<Character>(new CharacterComparator());
    SortedList<Character> sortedList=
      new SortedList<Character>(new CharacterComparator());
    List<Character> listCopy;
    SortedList<Character> sortedListCopy;

    list.add('c');
    list.add('o');
    list.add('m');
    list.add('p');
    list.add('u');
    list.add('t');
    list.add('e');

    listCopy= new List<Character>(list);
    list.add('r');
    listCopy.add('d');

    assertEquals("c o m p u t e r", list.toString());
    assertEquals("c o m p u t e d", listCopy.toString());

    sortedList.add('h');
    sortedList.add('i');
    sortedList.add('c');

    sortedListCopy= new SortedList<Character>(sortedList);
    sortedList.add('p');
    sortedList.add('m');
    sortedListCopy.add('s');
    sortedListCopy.add('p');

    assertEquals("c h i m p", sortedList.toString());
    assertEquals("c h i p s", sortedListCopy.toString());
  }

  // private utility methods ////////////////////////////////////////////

  // returns a list with various elements for tests
  @SuppressWarnings("unchecked")
  private static List<Integer> testList1(Comparator comparator) {
    List<Integer> list= new List<Integer>(comparator);

    list.add(3);
    list.add(1);
    list.add(4);
    list.add(1);
    list.add(5);
    list.add(9);
    list.add(2);
    list.add(6);
    list.add(5);
    list.add(3);
    list.add(5);
    list.add(8);
    list.add(9);
    list.add(7);
    list.add(9);

    return list;
  }

  // returns a sorted list with various elements for tests
  @SuppressWarnings("unchecked")
  private static SortedList<Integer> testSortedList1(Comparator comparator) {
    SortedList<Integer> sortedList= new SortedList<Integer>(comparator);

    sortedList.add(3);
    sortedList.add(1);
    sortedList.add(4);
    sortedList.add(1);
    sortedList.add(5);
    sortedList.add(9);
    sortedList.add(2);
    sortedList.add(6);
    sortedList.add(5);
    sortedList.add(3);
    sortedList.add(5);
    sortedList.add(8);
    sortedList.add(9);
    sortedList.add(7);
    sortedList.add(9);

    return sortedList;
  }

  // returns a list with various elements for tests
  @SuppressWarnings("unchecked")
  private static List<Integer> testList2(Comparator comparator) {
    List<Integer> list= new List<Integer>(comparator);

    list.add(3);
    list.add(4);
    list.add(12);
    list.add(5);
    list.add(1);
    list.add(9);
    list.add(2);
    list.add(6);
    list.add(11);
    list.add(14);
    list.add(16);
    list.add(8);
    list.add(13);
    list.add(24);
    list.add(20);
    list.add(9);

    return list;
  }

  // returns a sorted list with various elements for tests
  @SuppressWarnings("unchecked")
  private static SortedList<Integer> testSortedList2(Comparator comparator) {
    SortedList<Integer> sortedList= new SortedList<Integer>(comparator);

    sortedList.add(3);
    sortedList.add(4);
    sortedList.add(12);
    sortedList.add(5);
    sortedList.add(1);
    sortedList.add(9);
    sortedList.add(2);
    sortedList.add(6);
    sortedList.add(11);
    sortedList.add(14);
    sortedList.add(16);
    sortedList.add(8);
    sortedList.add(13);
    sortedList.add(24);
    sortedList.add(20);
    sortedList.add(9);

    return sortedList;
  }

}
