/**
 * Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * Section 0302
 * I pledge on my honor that I have not given or received
 * any unauthorized assistance on this assignment.
 **/

package tests;

import names.Names;

import org.junit.*;
import static org.junit.Assert.*;

public class StudentTests {

  @Test public void testReturnNullOrNegativeOne() {
    Names n = new Names();
    assertEquals(null, n.getBoyName(2000, 1));
    assertEquals(-1, n.getBoyRank(2000, "Bob"));
    assertEquals(null, n.getGirlName(2000, 1));
    assertEquals(-1, n.getGirlRank(2000, "Susan"));
    
    n.getNames(2003, 2004, 10);
    assertEquals(null, n.getBoyName(2003, 11));
    assertEquals(null, n.getBoyName(2005, 1));
    assertEquals(null, n.getBoyName(2003, 0));
    
    n.getNames(2004, 2005, 5);
    assertEquals(-1, n.getGirlRank(2004, "AGirl"));
  }
  
  @Test public void testGetNamesOneYear() {
    Names n = new Names();
    n.getNames(1999, 1999, 10);
    assertEquals(1, n.getBoyRank(1999, "Jacob"));
    assertEquals(10, n.getGirlRank(1999, "Elizabeth"));
    assertEquals("Tyler", n.getBoyName(1999, 9));
  }
  
  @Test public void testTwoYears() {
    Names n = new Names();
    n.getNames(2001, 2002, 10);
    assertEquals("Andrew", n.getBoyName(2001, 7));
    assertEquals("Alexis", n.getGirlName(2002, 5));
  }
  
  @Test public void testThreeYears() {
    Names n = new Names();
    n.getNames(2003, 2005, 4);
    assertEquals("Olivia", n.getGirlName(2004, 4));
    assertEquals(4, n.getGirlRank(2005, "Abigail"));
  }
}
