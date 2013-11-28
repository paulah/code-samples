/**
 * Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * Section 0302
 * I pledge on my honor that I have not given or received
 * any unauthorized assistance on this assignment.
 **/

package othello;

/* Each square on the Othello board has a Piece object:
 * Black, white, or none. Because both players are always either "black" or
 * "white," Piece.BLACK and Piece.WHITE can be used to represent each player.
 */

public enum Piece {

  BLACK, WHITE, NONE;

  public String toString() {
    switch (this) {
      case BLACK:
        return "black";
      case WHITE:
        return "white";
      case NONE:
        return "";
    }

    return "";  // make compiler happy even though we should never reach here
  }

}
