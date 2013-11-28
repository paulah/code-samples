/**
 * Paula Huang
 * DirectoryID: phuang
 * UID: 112419189
 * Section 0302
 * I pledge on my honor that I have not given or received
 * any unauthorized assistance on this assignment.
 **/

package tests;

//import junit.framework.TestCase;
import org.junit.*;
import static org.junit.Assert.*;
import index.*;

public class StudentTests {
  @Test  
  public void testLongestWord() throws InvalidParameterException {
    assertEquals("hello", ind1().longestWord());
  }
  
  //tests toString, also confirms that duplicate pages are removed
  public void testToString() throws InvalidParameterException {
    assertEquals("hi: 1 2 3\nhello: 3\n", ind1().toString());
  }
  
  //tests that duplicate words are ignored
  public void testDuplicate() throws InvalidParameterException {
    assertEquals((new Index()).addWord("hi", new int[]{1}),ind2());
  }
  
  //tests the number of unique words
  public void testNumUnique() throws InvalidParameterException {
    assertEquals(2,ind1());
  }
  
  //tests the number of word occurrences
  public void testWordOccurrences() throws InvalidParameterException {
    assertEquals(4, ind1().numWordOccurrences());
  }
  
  //tests alphabetizing
  public void testAlphabetizing() throws InvalidParameterException {
    assertEquals(false, ind1().isAlphabetized());
  }
  
  //tests alphabetizing
  public void testAlpha2() throws InvalidParameterException {
    assertEquals(true, ind2().isAlphabetized());
  }
  
  //tests remove word
  public void testRemove() throws InvalidParameterException {
    ind1().removeWord("hi");
    assertEquals(new Index().addWord("hello", new int[]{3}), ind1());
  }
  
  private Index ind1() throws InvalidParameterException {
    Index test = new Index();
    test.addWord("hi", new int[]{1,1,2,3});
    test.addWord("hello", new int[]{3});
    return test;
  }

  private Index ind2() throws InvalidParameterException {
    Index test = new Index();
    test.addWord("hi", new int[]{1});
    test.addWord("hi", new int[]{2});
    return test;
  }
}
