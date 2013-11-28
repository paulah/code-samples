package tests;

import othello.Piece;
import othello.Othello;
import org.junit.*;
import static org.junit.Assert.*;

public class PublicTests {

  // just ensures that the get/set methods are working, since other methods
  // may rely upon them
  @Test public void testPublic01() {
    Othello othello= new Othello();

    othello.setEntry(Piece.WHITE, 3, 3);
    othello.setEntry(Piece.BLACK, 3, 4);

    assertEquals(Piece.WHITE, othello.getEntry(3, 3));
    assertEquals(Piece.BLACK, othello.getEntry(3, 4));
  }

  // verifies that the starting turn's is black's, after restart() is called
  @Test public void testPublic02() {
    Othello othello= new Othello();

    othello.restart(Piece.BLACK);

    assertEquals(Piece.BLACK, othello.getTurn());
  }

  // tests the basic operation of toString()
  @Test public void testPublic03() {
    Othello othello= new Othello();

    othello.setEntry(Piece.WHITE, 3, 3);
    othello.setEntry(Piece.BLACK, 3, 4);

    assertEquals("  0 1 2 3 4 5 6 7\n" +
                 "0 - - - - - - - -\n" +
                 "1 - - - - - - - -\n" +
                 "2 - - - - - - - -\n" +
                 "3 - - - W B - - -\n" +
                 "4 - - - - - - - -\n" +
                 "5 - - - - - - - -\n" +
                 "6 - - - - - - - -\n" +
                 "7 - - - - - - - -\n", othello.toString());
  }


  // checks the validity of a move that should trap one opposing piece,
  // in a horizontal direction
  @Test public void testPublic04() {
    Othello othello= new Othello();

    othello.setEntry(Piece.WHITE, 3, 3);
    othello.setEntry(Piece.BLACK, 3, 4);

    othello.setTurn(Piece.BLACK);

    assertTrue(othello.validMove(Piece.BLACK, 3, 2));
  }

  // checks the validity of a move that should trap several opposing pieces,
  // in a vertical direction
  @Test public void testPublic05() {
    Othello othello= new Othello();

    othello.setEntry(Piece.WHITE, 3, 3);
    othello.setEntry(Piece.BLACK, 4, 3);
    othello.setEntry(Piece.BLACK, 5, 3);

    othello.setTurn(Piece.WHITE);

    assertTrue(othello.validMove(Piece.WHITE, 6, 3));
  }

  // checks the validity of a move that should trap several opposing pieces,
  // in more than one diagonal direction (note that this board
  // configuration, and some other ones in later tests, cannot come up
  // during actual play of the game)
  @Test public void testPublic06() {
    Othello othello= new Othello();

    othello.setEntry(Piece.BLACK, 5, 2);
    othello.setEntry(Piece.WHITE, 4, 3);
    othello.setEntry(Piece.WHITE, 2, 5);
    othello.setEntry(Piece.BLACK, 1, 6);

    othello.setTurn(Piece.BLACK);

    assertTrue(othello.validMove(Piece.BLACK, 3, 4));
  }

  // tests an invalid move to a square that is already occupied
  @Test public void testPublic07() {
    Othello othello= new Othello();

    othello.setEntry(Piece.WHITE, 3, 3);
    othello.setEntry(Piece.BLACK, 3, 4);

    othello.setTurn(Piece.BLACK);

    assertFalse(othello.validMove(Piece.BLACK, 3, 4));
  }

  // tests an invalid move to a square that is off the board
  @Test public void testPublic08() {
    Othello othello= new Othello();

    othello.setEntry(Piece.WHITE, 3, 3);
    othello.setEntry(Piece.BLACK, 3, 4);

    othello.setTurn(Piece.BLACK);

    assertFalse(othello.validMove(Piece.BLACK, 10, 20));
  }

  // tests the result of the count() method
  @Test public void testPublic09() {
    Othello othello= new Othello();

    othello.setEntry(Piece.BLACK, 5, 2);
    othello.setEntry(Piece.WHITE, 4, 3);
    othello.setEntry(Piece.WHITE, 2, 5);
    othello.setEntry(Piece.BLACK, 1, 6);
    othello.setEntry(Piece.BLACK, 2, 6);
    othello.setEntry(Piece.BLACK, 3, 7);

    assertEquals(4, othello.count(Piece.BLACK));
    assertEquals(2, othello.count(Piece.WHITE));
  }

  // tests whether the restart() method properly resets the game board
  @Test public void testPublic10() {
    Othello othello= new Othello();

    othello.setEntry(Piece.BLACK, 5, 2);
    othello.setEntry(Piece.WHITE, 4, 3);
    othello.setEntry(Piece.WHITE, 2, 5);
    othello.setEntry(Piece.BLACK, 1, 6);
    othello.setEntry(Piece.BLACK, 2, 6);
    othello.setEntry(Piece.BLACK, 3, 7);

    othello.restart(Piece.WHITE);

    assertEquals("  0 1 2 3 4 5 6 7\n" +
                 "0 - - - - - - - -\n" +
                 "1 - - - - - - - -\n" +
                 "2 - - - - - - - -\n" +
                 "3 - - - W B - - -\n" +
                 "4 - - - B W - - -\n" +
                 "5 - - - - - - - -\n" +
                 "6 - - - - - - - -\n" +
                 "7 - - - - - - - -\n", othello.toString());
    assertEquals(Piece.WHITE, othello.getTurn());
  }

  // checks whether a basic move, that just traps just one opposing piece, in
  // a horizontal direction, is performed correctly
  @Test public void testPublic11() {
    Othello othello= new Othello();

    othello.setEntry(Piece.WHITE, 3, 3);
    othello.setEntry(Piece.BLACK, 3, 4);

    othello.setTurn(Piece.BLACK);

    othello.move(Piece.BLACK, 3, 2);

    assertEquals("  0 1 2 3 4 5 6 7\n" +
                 "0 - - - - - - - -\n" +
                 "1 - - - - - - - -\n" +
                 "2 - - - - - - - -\n" +
                 "3 - - B B B - - -\n" +
                 "4 - - - - - - - -\n" +
                 "5 - - - - - - - -\n" +
                 "6 - - - - - - - -\n" +
                 "7 - - - - - - - -\n", othello.toString());
    assertEquals(Piece.WHITE, othello.getTurn());
  }

  // checks whether a move that should trap several opposing pieces, in a
  // vertical direction, is performed correctly
  @Test public void testPublic12() {
    Othello othello= new Othello();

    othello.setEntry(Piece.WHITE, 3, 3);
    othello.setEntry(Piece.BLACK, 4, 3);
    othello.setEntry(Piece.BLACK, 5, 3);

    othello.setTurn(Piece.WHITE);

    othello.move(Piece.WHITE, 6, 3);

    assertEquals("  0 1 2 3 4 5 6 7\n" +
                 "0 - - - - - - - -\n" +
                 "1 - - - - - - - -\n" +
                 "2 - - - - - - - -\n" +
                 "3 - - - W - - - -\n" +
                 "4 - - - W - - - -\n" +
                 "5 - - - W - - - -\n" +
                 "6 - - - W - - - -\n" +
                 "7 - - - - - - - -\n", othello.toString());
    assertEquals(Piece.BLACK, othello.getTurn());
  }

  // checks whether a move that should trap several opposing pieces, in more
  // than one diagonal direction, is performed correctly
  @Test public void testPublic13() {
    Othello othello= new Othello();

    othello.setEntry(Piece.BLACK, 5, 2);
    othello.setEntry(Piece.WHITE, 4, 3);
    othello.setEntry(Piece.WHITE, 2, 5);
    othello.setEntry(Piece.BLACK, 1, 6);

    othello.setTurn(Piece.BLACK);

    othello.move(Piece.BLACK, 3, 4);

    assertEquals("  0 1 2 3 4 5 6 7\n" +
                 "0 - - - - - - - -\n" +
                 "1 - - - - - - B -\n" +
                 "2 - - - - - B - -\n" +
                 "3 - - - - B - - -\n" +
                 "4 - - - B - - - -\n" +
                 "5 - - B - - - - -\n" +
                 "6 - - - - - - - -\n" +
                 "7 - - - - - - - -\n", othello.toString());
    assertEquals(Piece.WHITE, othello.getTurn());
  }

  // verifies that an invalid move does not alter the board
  @Test public void testPublic14() {
    Othello othello= new Othello();

    othello.restart(Piece.BLACK);

    othello.move(Piece.BLACK, 3, 4);

    assertFalse(othello.validMove(Piece.BLACK, 3, 4));

    assertEquals("  0 1 2 3 4 5 6 7\n" +
                 "0 - - - - - - - -\n" +
                 "1 - - - - - - - -\n" +
                 "2 - - - - - - - -\n" +
                 "3 - - - W B - - -\n" +
                 "4 - - - B W - - -\n" +
                 "5 - - - - - - - -\n" +
                 "6 - - - - - - - -\n" +
                 "7 - - - - - - - -\n", othello.toString());
  }

  // verifies that an invalid move does not change the turn
  @Test public void testPublic15() {
    Othello othello= new Othello();

    othello.restart(Piece.BLACK);

    othello.move(Piece.BLACK, 3, 4);

    assertFalse(othello.validMove(Piece.BLACK, 3, 4));
    assertEquals(Piece.BLACK, othello.getTurn());
  }

  // tests whether several valid moves in sequence are all performed
  // correctly
  @Test public void testPublic16() {
    Othello othello= new Othello();

    othello.restart(Piece.BLACK);

    othello.move(Piece.BLACK, 3, 2);
    othello.move(Piece.WHITE, 2, 4);
    othello.move(Piece.BLACK, 4, 5);
    othello.move(Piece.WHITE, 3, 1);
    othello.move(Piece.BLACK, 1, 4);
    othello.move(Piece.WHITE, 5, 3);
    othello.move(Piece.BLACK, 3, 0);
    othello.move(Piece.WHITE, 2, 3);

    assertEquals("  0 1 2 3 4 5 6 7\n" +
                 "0 - - - - - - - -\n" +
                 "1 - - - - B - - -\n" +
                 "2 - - - W B - - -\n" +
                 "3 B B B W B - - -\n" +
                 "4 - - - W B B - -\n" +
                 "5 - - - W - - - -\n" +
                 "6 - - - - - - - -\n" +
                 "7 - - - - - - - -\n", othello.toString());
    assertEquals(Piece.BLACK, othello.getTurn());
  }

}
