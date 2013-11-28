package tests;

import list.List;
import list.SortedList;
import list.IntegerComparator;

import org.junit.*;
import static org.junit.Assert.*;

public class PublicTests {

  // creates lists of different lengths, and checks their lengths
  @Test public void testPublic1() {
    List<Integer> emptyList= new List<Integer>(new IntegerComparator());
    List<Integer> oneEltList= new List<Integer>(new IntegerComparator());
    List<Integer> multEltList= new List<Integer>(new IntegerComparator());

    assertEquals(0, emptyList.size());

    oneEltList.add(132);

    assertEquals(1, oneEltList.size());

    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(9);
    multEltList.add(3);
    multEltList.add(7);

    assertEquals(5,  multEltList.size());
  }

  // creates lists of different lengths, and checks their values using
  // toString()
  @Test public void testPublic2() {
    List<Integer> emptyList= new List<Integer>(new IntegerComparator());
    List<Integer> oneEltList= new List<Integer>(new IntegerComparator());
    List<Integer> multEltList= new List<Integer>(new IntegerComparator());

    assertEquals("", emptyList.toString());

    oneEltList.add(132);

    assertEquals("132", oneEltList.toString());

    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(9);
    multEltList.add(3);
    multEltList.add(7);

    assertEquals("6 2 9 3 7", multEltList.toString());
  }

  // tests calling get() on various positions of different lists
  @Test public void testPublic3() {
    List<Integer> oneEltList= new List<Integer>(new IntegerComparator());
    List<Integer> multEltList= new List<Integer>(new IntegerComparator());

    oneEltList.add(132);

    assertEquals("132", oneEltList.get(0).toString());

    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(9);
    multEltList.add(3);
    multEltList.add(7);

    assertEquals((Integer) 3, multEltList.get(3));
    assertEquals((Integer) 6, multEltList.get(0));
    assertEquals((Integer) 2, multEltList.get(1));
    assertEquals((Integer) 7, multEltList.get(4));
    assertEquals((Integer) 9, multEltList.get(2));
  }

  // tests calling lookup() on various elements of different lists
  @Test public void testPublic4() {
    List<Integer> oneEltList= new List<Integer>(new IntegerComparator());
    List<Integer> multEltList= new List<Integer>(new IntegerComparator());

    oneEltList.add(132);

    assertNotNull(oneEltList.lookup(132));

    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(9);
    multEltList.add(3);
    multEltList.add(7);

    assertNotNull(multEltList.lookup(3));
    assertNotNull(multEltList.lookup(6));
    assertNotNull(multEltList.lookup(2));
    assertNotNull(multEltList.lookup(7));
    assertNotNull(multEltList.lookup(9));
  }

  // tests calling delete() on various elements of different lists
  @Test public void testPublic5() {
    List<Integer> multEltList= new List<Integer>(new IntegerComparator());

    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(9);
    multEltList.add(3);
    multEltList.add(7);

    multEltList.delete(9);
    assertEquals("6 2 3 7", multEltList.toString());

    multEltList.delete(3);
    assertEquals("6 2 7", multEltList.toString());

    multEltList.delete(2);
    assertEquals("6 7", multEltList.toString());
  }

  // tests calling getLargest() on lists with different elements
  @Test public void testPublic6() {
    List<Integer> oneEltList= new List<Integer>(new IntegerComparator());
    List<Integer> multEltList= new List<Integer>(new IntegerComparator());

    oneEltList.add(132);
    assertEquals((Integer) 132, oneEltList.getLargest());

    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(9);
    multEltList.add(3);
    multEltList.add(7);

    assertEquals((Integer) 9, multEltList.getLargest());

    // create a new list of elements
    multEltList= new List<Integer>(new IntegerComparator());
    multEltList.add(9);
    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(3);
    multEltList.add(7);

    assertEquals((Integer) 9, multEltList.getLargest());

    // create a new list of elements
    multEltList= new List<Integer>(new IntegerComparator());
    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(3);
    multEltList.add(7);
    multEltList.add(9);

    assertEquals((Integer) 9, multEltList.getLargest());
  }

  // tests calling getSmallest() on lists with different elements
  @Test public void testPublic7() {
    List<Integer> oneEltList= new List<Integer>(new IntegerComparator());
    List<Integer> multEltList= new List<Integer>(new IntegerComparator());

    oneEltList.add(132);

    assertEquals((Integer) 132, oneEltList.getSmallest());

    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(9);
    multEltList.add(3);
    multEltList.add(7);

    assertEquals((Integer) 2, multEltList.getSmallest());

    // create a new list of elements
    multEltList= new List<Integer>(new IntegerComparator());
    multEltList.add(2);
    multEltList.add(9);
    multEltList.add(6);
    multEltList.add(3);
    multEltList.add(7);

    assertEquals((Integer) 2, multEltList.getSmallest());

    // create a new list of elements
    multEltList= new List<Integer>(new IntegerComparator());
    multEltList.add(6);
    multEltList.add(3);
    multEltList.add(7);
    multEltList.add(9);
    multEltList.add(2);

    assertEquals((Integer) 2, multEltList.getSmallest());
  }

  // creates sorted lists of different lengths, and checks their
  // values using toString().  Note that we can have a List reference
  // referring to a SortedList.
  @Test public void testPublic8() {
    List<Integer> emptyList= new SortedList<Integer>(new IntegerComparator());
    List<Integer> oneEltList= new SortedList<Integer>(new IntegerComparator());
    List<Integer> multEltList=
                  new SortedList<Integer>(new IntegerComparator());

    assertEquals("", emptyList.toString());

    oneEltList.add(132);

    assertEquals("132", oneEltList.toString());

    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(9);
    multEltList.add(3);
    multEltList.add(7);

    assertEquals("2 3 6 7 9", multEltList.toString());
  }

  // creates SortedLists of different lengths, and checks their lengths
  @Test public void testPublic9() {
    List<Integer> emptyList= new SortedList<Integer>(new IntegerComparator());
    List<Integer> oneEltList= new SortedList<Integer>(new IntegerComparator());
    List<Integer> multEltList=
                  new SortedList<Integer>(new IntegerComparator());

    assertEquals(0, emptyList.size());

    oneEltList.add(132);

    assertEquals(1, oneEltList.size());

    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(9);
    multEltList.add(3);
    multEltList.add(7);

    assertEquals(5,  multEltList.size());
  }

  // tests calling get() on various positions of different lists
  @Test public void testPublic10() {
    List<Integer> oneEltList= new SortedList<Integer>(new IntegerComparator());
    List<Integer> multEltList=
                  new SortedList<Integer>(new IntegerComparator());

    oneEltList.add(132);

    assertEquals((Integer) 132, oneEltList.get(0));

    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(9);
    multEltList.add(3);
    multEltList.add(7);

    assertEquals((Integer) 7, multEltList.get(3));
    assertEquals((Integer) 2, multEltList.get(0));
    assertEquals((Integer) 3, multEltList.get(1));
    assertEquals((Integer) 9, multEltList.get(4));
    assertEquals((Integer) 6, multEltList.get(2));
  }

  // tests calling lookup() on various elements of different lists
  @Test public void testPublic11() {
    List<Integer> oneEltList= new SortedList<Integer>(new IntegerComparator());
    List<Integer> multEltList=
                  new SortedList<Integer>(new IntegerComparator());

    oneEltList.add(132);

    assertNotNull(oneEltList.lookup(132));

    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(9);
    multEltList.add(3);
    multEltList.add(7);

    assertNotNull(multEltList.lookup(3));
    assertNotNull(multEltList.lookup(6));
    assertNotNull(multEltList.lookup(2));
    assertNotNull(multEltList.lookup(7));
    assertNotNull(multEltList.lookup(9));
  }

  // tests calling delete() on various elements of different SortedLists
  @Test public void testPublic12() {
    List<Integer> oneEltList= new SortedList<Integer>(new IntegerComparator());
    List<Integer> multEltList=
                  new SortedList<Integer>(new IntegerComparator());

    oneEltList.add(132);
    oneEltList.delete(132);

    assertEquals("", oneEltList.toString());

    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(9);
    multEltList.add(3);
    multEltList.add(7);

    multEltList.delete(6);
    assertEquals("2 3 7 9", multEltList.toString());

    multEltList.delete(3);
    assertEquals("2 7 9", multEltList.toString());

    multEltList.delete(7);
    assertEquals("2 9", multEltList.toString());
  }

  // tests calling getLargest() on lists with different elements
  @Test public void testPublic13() {
    List<Integer> oneEltList= new SortedList<Integer>(new IntegerComparator());
    List<Integer> multEltList=
                  new SortedList<Integer>(new IntegerComparator());

    oneEltList.add(132);

    assertEquals((Integer) 132, oneEltList.getLargest());

    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(9);
    multEltList.add(3);
    multEltList.add(7);

    assertEquals((Integer) 9, multEltList.getLargest());

    // create a new list of elements
    multEltList= new SortedList<Integer>(new IntegerComparator());
    multEltList.add(9);
    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(3);
    multEltList.add(7);

    assertEquals((Integer) 9, multEltList.getLargest());

    // create a new list of elements
    multEltList= new SortedList<Integer>(new IntegerComparator());
    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(3);
    multEltList.add(7);
    multEltList.add(9);

    assertEquals((Integer) 9, multEltList.getLargest());
  }

  // tests calling getSmallest() on lists with different elements
  @Test public void testPublic14() {
    List<Integer> oneEltList= new SortedList<Integer>(new IntegerComparator());
    List<Integer> multEltList=
                  new SortedList<Integer>(new IntegerComparator());

    oneEltList.add(132);

    assertEquals((Integer) 132, oneEltList.getSmallest());

    multEltList.add(6);
    multEltList.add(2);
    multEltList.add(9);
    multEltList.add(3);
    multEltList.add(7);

    assertEquals((Integer) 2, multEltList.getSmallest());

    // create a new list of elements
    multEltList= new SortedList<Integer>(new IntegerComparator());
    multEltList.add(2);
    multEltList.add(9);
    multEltList.add(6);
    multEltList.add(3);
    multEltList.add(7);

    assertEquals((Integer) 2, multEltList.getSmallest());

    // create a new list of elements
    multEltList= new SortedList<Integer>(new IntegerComparator());
    multEltList.add(6);
    multEltList.add(3);
    multEltList.add(7);
    multEltList.add(9);
    multEltList.add(2);

    assertEquals((Integer) 2, multEltList.getSmallest());
  }

}
