package tests;

import java.util.NoSuchElementException;

import othello.Piece;
import othello.Othello;
import org.junit.*;
import static org.junit.Assert.*;

public class SecretTests {

  public static final int SIZE= 8;

  // tests that the move() method flips only the pieces that should be (only
  // the ones that are actually trapped by the move), in both vertical
  // directions
  @Test public void testSecret1() {
    Othello othello= new Othello();

    othello.setEntry(Piece.BLACK, 0, 1);
    othello.setEntry(Piece.WHITE, 1, 1);
    othello.setEntry(Piece.WHITE, 2, 1);
    othello.setEntry(Piece.BLACK, 3, 1);
    othello.setEntry(Piece.WHITE, 4, 1);
    othello.setEntry(Piece.WHITE, 5, 1);

    othello.setEntry(Piece.BLACK, 1, 0);
    othello.setEntry(Piece.WHITE, 1, 1);
    othello.setEntry(Piece.WHITE, 1, 2);
    othello.setEntry(Piece.BLACK, 1, 3);
    othello.setEntry(Piece.WHITE, 1, 4);
    othello.setEntry(Piece.WHITE, 1, 5);

    othello.setTurn(Piece.BLACK);

    othello.move(Piece.BLACK, 6, 1);

    othello.setTurn(Piece.BLACK);

    othello.move(Piece.BLACK, 1, 6);

    assertEquals("  0 1 2 3 4 5 6 7\n" +
                 "0 - B - - - - - -\n" +
                 "1 B W W B B B B -\n" +
                 "2 - W - - - - - -\n" +
                 "3 - B - - - - - -\n" +
                 "4 - B - - - - - -\n" +
                 "5 - B - - - - - -\n" +
                 "6 - B - - - - - -\n" +
                 "7 - - - - - - - -\n", othello.toString());
  }


  // tests that the move() method flips only the pieces that should be (only
  // the ones that are actually trapped by the move), in two diagonal
  // directions
  @Test public void testSecret2() {
    Othello othello= new Othello();

    othello.setEntry(Piece.BLACK, 0, 0);
    othello.setEntry(Piece.WHITE, 1, 1);
    othello.setEntry(Piece.WHITE, 2, 2);
    othello.setEntry(Piece.BLACK, 3, 3);
    othello.setEntry(Piece.WHITE, 4, 4);
    othello.setEntry(Piece.WHITE, 5, 5);

    othello.setEntry(Piece.BLACK, 0, 7);
    othello.setEntry(Piece.WHITE, 1, 6);
    othello.setEntry(Piece.WHITE, 2, 5);
    othello.setEntry(Piece.BLACK, 3, 4);
    othello.setEntry(Piece.WHITE, 4, 3);
    othello.setEntry(Piece.WHITE, 5, 2);

    othello.setTurn(Piece.BLACK);

    othello.move(Piece.BLACK, 6, 6);

    othello.setTurn(Piece.BLACK);

    othello.move(Piece.BLACK, 6, 1);

    assertEquals("  0 1 2 3 4 5 6 7\n" +
                 "0 B - - - - - - B\n" +
                 "1 - W - - - - W -\n" +
                 "2 - - W - - W - -\n" +
                 "3 - - - B B - - -\n" +
                 "4 - - - B B - - -\n" +
                 "5 - - B - - B - -\n" +
                 "6 - B - - - - B -\n" +
                 "7 - - - - - - - -\n", othello.toString());
  }


  // tests that the move() method flips pieces in all directions
  @Test public void testSecret3() {
    Othello othello= new Othello();
    int i, j;

    // set outside rows and columns to black
    for (i= 0; i < SIZE; i++) {
      othello.setEntry(Piece.BLACK, 0, i);
      othello.setEntry(Piece.BLACK, SIZE - 1, i);
      othello.setEntry(Piece.BLACK, i, 0);
      othello.setEntry(Piece.BLACK, i, SIZE - 1);
    }

    // set all interior squares to white except one
    for (i= 1; i < SIZE - 1; i++)
      for (j= 1; j < SIZE - 1; j++)
        if (i != 3 || j != 3)
          othello.setEntry(Piece.WHITE, i, j);

    othello.setTurn(Piece.BLACK);

    // move a black piece to that one empty center square
    othello.move(Piece.BLACK, 3, 3);

    assertEquals("  0 1 2 3 4 5 6 7\n" +
                 "0 B B B B B B B B\n" +
                 "1 B B W B W B W B\n" +
                 "2 B W B B B W W B\n" +
                 "3 B B B B B B B B\n" +
                 "4 B W B B B W W B\n" +
                 "5 B B W B W B W B\n" +
                 "6 B W W B W W B B\n" +
                 "7 B B B B B B B B\n", othello.toString());
  }

  // in this test there should be only one valid move for one player
  // (black), after which all the squares are filled, and neither player has
  // any valid moves
  @Test public void testSecret4() {
    Othello othello= new Othello();
    int i, j;

    for (i= 0; i < SIZE; i++)
      for (j= 0; j < SIZE; j++)
        if (i != SIZE - 1 || j != SIZE - 1)
          othello.setEntry(Piece.WHITE, i, j);
    othello.setEntry(Piece.BLACK, 5, 5);

    othello.setTurn(Piece.BLACK);

    for (i= 0; i < SIZE; i++)
      for (j= 0; j < SIZE; j++)
        if (i != 7 || j != 7) {
          assertFalse(othello.validMove(Piece.WHITE, i, j));
          assertFalse(othello.validMove(Piece.BLACK, i, j));
        }

    // should also involve checking that it's a valid move
    othello.move(Piece.BLACK, 7, 7);

    for (i=0; i < SIZE; i++)
      for (j= 0; j < SIZE; j++) {
        assertFalse(othello.validMove(Piece.WHITE, i, j));
        assertFalse(othello.validMove(Piece.BLACK, i, j));
      }

    assertEquals("  0 1 2 3 4 5 6 7\n" +
                 "0 W W W W W W W W\n" +
                 "1 W W W W W W W W\n" +
                 "2 W W W W W W W W\n" +
                 "3 W W W W W W W W\n" +
                 "4 W W W W W W W W\n" +
                 "5 W W W W W B W W\n" +
                 "6 W W W W W W B W\n" +
                 "7 W W W W W W W B\n", othello.toString());
  }

  // tests calling setTurn() with Piece.NONE
  @Test(expected= IllegalArgumentException.class) public void testSecret5() {
    Othello othello= new Othello();

    othello.restart(Piece.BLACK);
    othello.setTurn(Piece.NONE);
  }

  // tests whether setEntry() properly throws an exception if its parameter
  // is invalid (too far down)
  @Test(expected= NoSuchElementException.class) public void testSecret6() {
    Othello othello= new Othello();

    othello.setEntry(Piece.BLACK, 8, 2);
  }

  // tests whether setEntry() properly throws an exception if its parameter
  // is invalid (too far right)
  @Test(expected= NoSuchElementException.class) public void testSecret7() {
    Othello othello= new Othello();

    othello.setEntry(Piece.BLACK, 2, 8);
  }

  // tests whether setEntry() properly throws an exception if its parameter
  // is invalid (too far up)
  @Test(expected= NoSuchElementException.class) public void testSecret8() {
    Othello othello= new Othello();

    othello.setEntry(Piece.BLACK, -1, 2);
  }

  // tests whether setEntry() properly throws an exception if its parameter
  // is invalid (too far left)
  @Test(expected= NoSuchElementException.class) public void testSecret9() {
    Othello othello= new Othello();

    othello.setEntry(Piece.BLACK, 2, -1);
  }

  // tests playing a complete game, with some invalid moves included; also
  // uses the version of move() that ensures that the Othello object is
  // keeping track of whose move is next
  @Test public void testSecret10() {
    Othello othello= new Othello();

    othello.restart(Piece.BLACK);

    othello.move(3, 2);
    othello.move(2, 2);
    othello.move(5, 4);
    othello.move(5, 5);
    othello.move(4, 2);  // invalid; wrong turn
    othello.move(2, 3);
    othello.move(2, 4);
    othello.move(1, 4);
    othello.move(2, 5);
    othello.move(1, 3);
    othello.move(3, 5);  // invalid; no flips
    othello.move(0, 2);
    othello.move(5, 6);
    othello.move(0, 4);
    othello.move(0, 3);
    othello.move(1, 2);
    othello.move(3, 6);
    othello.move(4, 2);
    othello.move(3, 1);
    othello.move(1, 5);
    othello.move(0, 6);
    othello.move(4, 5);
    othello.move(5, 1);
    othello.move(6, 5);
    othello.move(7, 4);
    othello.move(6, 7);
    othello.move(3, 5);
    othello.move(5, 2);
    othello.move(6, 4);
    othello.move(5, 3);
    othello.move(6, 2);
    othello.move(3, 0);
    othello.move(4, 7);
    othello.move(2, 7);
    othello.move(4, 6);
    othello.move(2, 6);
    othello.move(6, 3);
    othello.move(7, 3);
    othello.move(7, 2);
    othello.move(6, 0);
    othello.move(4, 2);  // invalid; already occupied
    othello.move(4, 1);
    othello.move(7, 6);
    othello.move(2, 1);
    othello.move(2, 0);
    othello.move(4, 0);
    othello.move(5, 0);
    othello.move(1, 1);
    othello.move(0, 1);
    othello.move(0, 0);
    othello.move(1, 0);
    othello.move(7, 0);
    othello.move(5, 7);
    othello.move(6, 1);
    othello.move(3, 7);
    othello.move(1, 7);
    othello.move(0, 7);
    othello.move(1, 6);
    othello.move(0, 5);
    othello.move(6, 6);
    othello.move(7, 5);
    othello.move(7, 7);
    othello.move(7, 1);  // black wins

    assertEquals("  0 1 2 3 4 5 6 7\n" +
                 "0 B B B B W W W W\n" +
                 "1 B B B B W W W W\n" +
                 "2 B B B W W W B W\n" +
                 "3 B B W B B W B W\n" +
                 "4 B B W B B W B W\n" +
                 "5 B B B W W B B W\n" +
                 "6 B B W B W W B W\n" +
                 "7 B W B B B B B B\n", othello.toString());
  }

  // tests that the copy constructor works
  @Test public void testSecret11() {
    Othello othello1= new Othello();
    Othello othello2;

    othello1.setEntry(Piece.BLACK, 0, 0);
    othello1.setEntry(Piece.WHITE, 1, 1);
    othello1.setEntry(Piece.WHITE, 2, 2);
    othello1.setEntry(Piece.BLACK, 3, 3);
    othello1.setEntry(Piece.BLACK, 4, 4);
    othello1.setEntry(Piece.BLACK, 5, 5);
    othello1.setEntry(Piece.BLACK, 6, 6);

    othello1.setEntry(Piece.BLACK, 0, 7);
    othello1.setEntry(Piece.WHITE, 1, 6);
    othello1.setEntry(Piece.WHITE, 2, 5);
    othello1.setEntry(Piece.BLACK, 3, 4);
    othello1.setEntry(Piece.BLACK, 4, 3);
    othello1.setEntry(Piece.BLACK, 5, 2);
    othello1.setEntry(Piece.BLACK, 6, 1);

    othello2= new Othello(othello1);

    assertEquals("  0 1 2 3 4 5 6 7\n" +
                 "0 B - - - - - - B\n" +
                 "1 - W - - - - W -\n" +
                 "2 - - W - - W - -\n" +
                 "3 - - - B B - - -\n" +
                 "4 - - - B B - - -\n" +
                 "5 - - B - - B - -\n" +
                 "6 - B - - - - B -\n" +
                 "7 - - - - - - - -\n", othello1.toString());

    assertEquals("  0 1 2 3 4 5 6 7\n" +
                 "0 B - - - - - - B\n" +
                 "1 - W - - - - W -\n" +
                 "2 - - W - - W - -\n" +
                 "3 - - - B B - - -\n" +
                 "4 - - - B B - - -\n" +
                 "5 - - B - - B - -\n" +
                 "6 - B - - - - B -\n" +
                 "7 - - - - - - - -\n", othello2.toString());
  }

  // tests that after calling the copy constructor the turn in the new
  // object is correct, and that changing each object (the original and the
  // copy) does not affect the other
  @Test public void testSecret12() {
    Othello othello1= new Othello();
    Othello othello2;

    othello1.setEntry(Piece.BLACK, 0, 0);
    othello1.setEntry(Piece.WHITE, 1, 1);
    othello1.setEntry(Piece.WHITE, 2, 2);
    othello1.setEntry(Piece.BLACK, 3, 3);
    othello1.setEntry(Piece.BLACK, 4, 4);
    othello1.setEntry(Piece.BLACK, 5, 5);
    othello1.setEntry(Piece.BLACK, 6, 6);

    othello1.setEntry(Piece.BLACK, 0, 7);
    othello1.setEntry(Piece.WHITE, 1, 6);
    othello1.setEntry(Piece.WHITE, 2, 5);
    othello1.setEntry(Piece.BLACK, 3, 4);
    othello1.setEntry(Piece.BLACK, 4, 3);
    othello1.setEntry(Piece.BLACK, 5, 2);
    othello1.setEntry(Piece.BLACK, 6, 1);

    othello1.setTurn(Piece.WHITE);

    othello2= new Othello(othello1);

    // verify that the turn of the new object is correct
    assertEquals(Piece.WHITE, othello2.getTurn());

    // change both objects
    othello1.setEntry(Piece.BLACK, 7, 0);
    othello2.setEntry(Piece.WHITE, 7, 7);

    // ensure each one's change didn't affect the other
    assertEquals("  0 1 2 3 4 5 6 7\n" +
                 "0 B - - - - - - B\n" +
                 "1 - W - - - - W -\n" +
                 "2 - - W - - W - -\n" +
                 "3 - - - B B - - -\n" +
                 "4 - - - B B - - -\n" +
                 "5 - - B - - B - -\n" +
                 "6 - B - - - - B -\n" +
                 "7 B - - - - - - -\n", othello1.toString());

    assertEquals("  0 1 2 3 4 5 6 7\n" +
                 "0 B - - - - - - B\n" +
                 "1 - W - - - - W -\n" +
                 "2 - - W - - W - -\n" +
                 "3 - - - B B - - -\n" +
                 "4 - - - B B - - -\n" +
                 "5 - - B - - B - -\n" +
                 "6 - B - - - - B -\n" +
                 "7 - - - - - - - W\n", othello2.toString());
  }

}
