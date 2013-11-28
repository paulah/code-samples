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
import othello.*;

public class StudentTests {
  @Test public void testConstructor() {
    Othello o = new Othello();
    assertEquals(Piece.NONE, o.getEntry(7, 7));
    assertEquals(Piece.NONE, o.getEntry(0, 0));
    assertEquals(Piece.NONE, o.getEntry(3, 4));
  }
  
  @Test public void testSetTurn() {
    Othello o = new Othello();
    o.setTurn(Piece.WHITE);
    assertEquals(o.getTurn(), Piece.WHITE);
  }
  
  @Test public void testRestart() {
    Othello o = new Othello();
    o.restart(Piece.BLACK);
    assertTrue(o.getTurn().equals(Piece.BLACK));
    assertEquals(o.getEntry(3, 4), Piece.BLACK);
    assertEquals(o.getEntry(3, 3), Piece.WHITE);
  }
  
  @Test public void testSetEntry() {
    Othello o = new Othello();
    o.setEntry(Piece.WHITE, 1, 2);
    assertEquals(Piece.WHITE, o.getEntry(1, 2));
  }
  
  @Test public void testCopyConstructor() {
    Othello o1 = new Othello();
    o1.restart(Piece.BLACK);
    Othello o2 = new Othello(o1);
    o2.setTurn(Piece.WHITE);
    assertEquals(Piece.BLACK, o1.getTurn());
    assertEquals(Piece.WHITE, o2.getTurn());
  }
  
  @Test public void testValidMove() {
    Othello o = new Othello();
    o.restart(Piece.BLACK);
    boolean valid = o.validMove(Piece.BLACK, 2, 3);
    assertTrue(valid);
    valid = o.validMove(Piece.BLACK, 5, 3);
  }
  
  @Test public void testPieceFlip() {
    Othello o = new Othello();
    o.restart(Piece.BLACK);
    o.move(2, 3);
    assertEquals(Piece.BLACK, o.getEntry(3, 3));
  }
  
  @Test public void testCount() {
    Othello o = new Othello();
    o.restart(Piece.BLACK);
    assertEquals(2, o.count(Piece.WHITE));
  }
  
  @Test public void testEqualPieces() {
    Othello o = new Othello();
    assertTrue(o.equalPieces());
  }
  
  @Test public void testMoreBlackPieces() {
    Othello o = new Othello();
    o.restart(Piece.BLACK);
    o.move(2, 3);
    assertTrue(o.moreBlackPieces());
  }
  
  @Test public void testMoreWhitePieces() {
    Othello o = new Othello();
    o.setEntry(Piece.WHITE, 0, 0);
    assertTrue(o.moreWhitePieces());
  }
}
