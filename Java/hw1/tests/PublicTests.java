package tests;

import index.Index;
import index.InvalidParameterException;
import org.junit.*;
import static org.junit.Assert.*;

// the private utility methods document1() through document5() are defined
// below; they create and return different indices used in the various tests

public class PublicTests {

  // tests calling numUniqueWords() on an index that has only one word that
  // has only one occurrence
  @Test public void testPublic1() throws InvalidParameterException {
    assertEquals(1, document1().numUniqueWords());
  }

  // tests calling numUniqueWords() on an index that has two words, that
  // each have only one occurrence
  @Test public void testPublic2() throws InvalidParameterException {
    assertEquals(2, document2().numUniqueWords());
  }

  // tests calling numUniqueWords() on an index that has only one word,
  // which has several occurrences
  @Test public void testPublic3() throws InvalidParameterException {
    assertEquals(1, document3().numUniqueWords());
  }

  // tests calling numUniqueWords() on an index that has several words that
  // each have several occurrences
  @Test public void testPublic4() throws InvalidParameterException {
    assertEquals(4, document4().numUniqueWords());
  }

  // tests calling toString() on an index that has only one word that has
  // only one occurrence
  @Test public void testPublic5() throws InvalidParameterException {
    assertEquals("maryland: 1\n", document1().toString());
  }

  // tests calling toString() on an index that has two words, that each have
  // only one occurrence
  @Test public void testPublic6() throws InvalidParameterException {
    assertEquals("maryland: 100\nuniversity: 101\n", document2().toString());
  }

  // tests calling toString() on an index that has only one word, which has
  // several occurrences
  @Test public void testPublic7() throws InvalidParameterException {
    assertEquals("terps: 1 2 3 4\n", document3().toString());
  }

  // tests calling toString() on an index that has several words that each
  // have several occurrences, in which the words and their occurrences are
  // all in order
  @Test public void testPublic8() throws InvalidParameterException {
    assertEquals("college: 2 3\nmaryland: 1 2 3\npark: 2 4\n" +
                 "university: 1 4\n", document4().toString());
  }

  // tests calling toString() on an index that has several words that each
  // have several occurrences, in which some words and occurrences are not
  // in order
  @Test public void testPublic9() throws InvalidParameterException {
    assertEquals("university: 2 3\nof: 2 3 5\nmaryland: 1 4 8 9 10\n" +
                 "college: 5\npark: 1 4\n", document5().toString());
  }

  // tests calling longestWord() on documents with one word, two words, and
  // several words
  @Test public void testPublic10() throws InvalidParameterException {
    assertEquals("maryland", document1().longestWord());
    assertEquals("university", document2().longestWord());
    assertEquals("university", document4().longestWord());
  }

  // tests calling numWordOccurrences() on documents with different numbers
  // of words that have different numbers of occurrences, including one with
  // a duplicated or repeated occurrence
  @Test public void testPublic11() throws InvalidParameterException {
    Index index= new Index();

    assertEquals(1, document1().numWordOccurrences());
    assertEquals(2, document2().numWordOccurrences());
    assertEquals(4, document3().numWordOccurrences());
    assertEquals(9, document4().numWordOccurrences());

    index.addWord("terps", new int[]{1, 2, 3});
    assertEquals(3, index.numWordOccurrences());
  }

  // tests calling isAlphabetized() on some documents with different numbers
  // of words that are in alphabetical order, and one where they aren't
  @Test public void testPublic12() throws InvalidParameterException {
    assertTrue(document1().isAlphabetized());
    assertTrue(document2().isAlphabetized());
    assertTrue(document3().isAlphabetized());
    assertTrue(document4().isAlphabetized());
    assertFalse(document5().isAlphabetized());
  }

  // tests calling isAlphabetized() on a document with some words that have
  // uppercase and some that have lowercase first letters
  @Test public void testPublic13() throws InvalidParameterException {
    Index index= new Index();

    index.addWord("Chicken", new int[]{1});
    index.addWord("cross", new int[]{2});
    index.addWord("did", new int[]{3});
    index.addWord("Road", new int[]{4});
    index.addWord("the", new int[]{5});
    index.addWord("Why", new int[]{6});

    assertTrue(index.isAlphabetized());
  }

  // tests calling removeWord() on a document that has several words, using
  // it to remove several of them
  @Test public void testPublic14() throws InvalidParameterException {
    Index index= document5();

    index.removeWord("of");
    assertEquals("university: 2 3\nmaryland: 1 4 8 9 10\ncollege: 5\n" +
                 "park: 1 4\n", index.toString());

    index.removeWord("college");
    assertEquals("university: 2 3\nmaryland: 1 4 8 9 10\npark: 1 4\n",
                 index.toString());

    index.removeWord("maryland");
    assertEquals("university: 2 3\npark: 1 4\n", index.toString());
  }

  // tests calling addWord() passing an empty string into its parameter word;
  // an InvalidParameterException should be thrown
  @Test(expected= InvalidParameterException.class) public void testPublic15() 
    throws InvalidParameterException {
    Index index= new Index();

    index.addWord("", new int[]{1, 2, 3});
  }

  // private utility methods ////////////////////////////////////////////

  // creates an index that has only one word that has only one occurrence
  private Index document1() throws InvalidParameterException {
    Index index= new Index();

    index.addWord("maryland", new int[]{1});

    return index;
  }

  // creates an index that has two words, that each have only one occurrence
  private Index document2() throws InvalidParameterException {
    Index index= new Index();

    index.addWord("maryland", new int[]{100});
    index.addWord("university", new int[]{101});

    return index;
  }

  // creates an index that has only one word, which has several occurrences
  private Index document3() throws InvalidParameterException {
    Index index= new Index();

    index.addWord("terps", new int[]{1, 2, 3, 4});

    return index;
  }

  // creates an index that has several words that each have several
  // occurrences, in which the words and their occurrences are all in order
  private Index document4() throws InvalidParameterException {
    Index index= new Index();

    index.addWord("college", new int[]{2, 3});
    index.addWord("maryland", new int[]{1, 2, 3});
    index.addWord("park", new int[]{2, 4});
    index.addWord("university", new int[]{1, 4});

    return index;
  }

  // creates an index that has several words that each have several
  // occurrences, in which some words are not in order
  private Index document5() throws InvalidParameterException {
    Index index= new Index();

    index.addWord("university", new int[]{2, 3});
    index.addWord("of", new int[]{2, 3, 5});
    index.addWord("maryland", new int[]{1, 4, 8, 9, 10});
    index.addWord("college", new int[]{5});
    index.addWord("park", new int[]{1, 4});

    return index;
  }

}
