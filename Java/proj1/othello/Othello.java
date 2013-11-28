/**
 * Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * Section 0302
 * I pledge on my honor that I have not given or received
 * any unauthorized assistance on this assignment.
 **/

/*
 * Othello is a game played on an 8x8 grid. There are 2 players,
 * white and black. Both players start with 2 pieces initially on the board.
 * Both players take turns laying a piece of their own color down.
 * Pieces may only be placed on empty squares and such that pieces of the other
 * color will be flipped (color will change to the current player's piece
 * color). Pieces are flipped when they are sandwiched between the current
 * piece being played and another piece of the same color. (This can be
 * horizontally, vertically, or diagonally.) At the end of the game when
 * all squares are occupied, the player with the most pieces of his/her color
 * on the board wins the game.
 */

package othello;

import java.util.NoSuchElementException;
import java.lang.IllegalArgumentException;

public class Othello {

  Piece[][] board = new Piece[8][8];
  Piece turn;
  
  //default constructor
  //fills the board with Piece.NONE, sets the turn to Black
  public Othello() {
    turn = Piece.BLACK;
    for(int i=0; i<board.length; i++)
      for(int j=0; j<board[i].length; j++)
        board[i][j] = Piece.NONE;
  }
  
  //creates an independent copy of another Othello object
  //changes made to one Othello board will not affect the other
  public Othello(Othello otherObj) {
    Othello o = new Othello();
    o.board = otherObj.board;
    o.turn = otherObj.turn;
  }

  //restart method sets Othello board to initial condition,
  //parameter "color" used to set whose turn it is
  public void restart(Piece color) throws IllegalArgumentException {
    if(color.equals(Piece.NONE))
      throw new IllegalArgumentException("restart() Color is \"NONE\"!");
    else {
      turn = color;
      for(int i=0; i<board.length; i++)
        for(int j=0; j<board[i].length; j++)
          board[i][j] = Piece.NONE;
      board[3][3] = Piece.WHITE;
      board[4][4] = Piece.WHITE;
      board[3][4] = Piece.BLACK;
      board[4][3] = Piece.BLACK;
    }
  }
  
  //sets the turn based on a parameter
  public void setTurn(Piece color) throws IllegalArgumentException {
    if(color.equals(Piece.NONE))
      throw new IllegalArgumentException("setTurn() Color is \"NONE\"!");
    else
      turn = color;
  }
  
  //get whose turn it is
  public Piece getTurn() {
    return turn;
  }
  
  //sets a particular square to a certain color
  public void setEntry(Piece color, int row, int col)
              throws NoSuchElementException {
    if(row>7 || row<0 || col>7 || col<0) //check if coordinates valid
      throw new NoSuchElementException();
    else
      board[row][col] = color;
  }
  
  //return what Piece is at a particular coordinate
  public Piece getEntry(int row, int col) throws NoSuchElementException {
    if(row>7 || row<0 || col>7 || col<0) //check if coordinates are valid
      throw new NoSuchElementException();
    else
      return board[row][col];
  }
  
  //check if a particular move is valid, based on whose turn it is
  public boolean validMove(Piece color, int row, int col) {
    if(row>7 || row<0 || col>7 || col<0 || !board[row][col].equals(Piece.NONE))
      return false;
    
    //set a variable for the other color
    Piece other;
    if(color.equals(Piece.BLACK))
        other = Piece.WHITE;
    else //already checked above for Piece.NONE
      other = Piece.BLACK;
    
    //check if you can flip pieces on the right
    if(col<6)
      if(board[row][col+1].equals(other))
        for(int c=col+2; c<=7; c++)
          if(board[row][c].equals(color))
            return true;
    
    //check to the left
    if(col>1)
      if(board[row][col-1].equals(other))
        for(int c=col-2; c>=0; c--)
          if(board[row][c].equals(color))
            return true;
    
    //check up
    if(row>1)
      if(board[row-1][col].equals(other))
        for(int r=row-2; r>=0; r--)
          if(board[r][col].equals(color))
            return true;
    
    //check down
    if(row<6)
      if(board[row+1][col].equals(other))
        for(int r=row+2; r<=7; r++)
          if(board[r][col].equals(color))
            return true;
    
    //check diagonal up-left
    if(row>1 && col>1)
      if(board[row-1][col-1].equals(other))
        for(int i=2; row-i>=0 && col-i>=0; i++)
          if(board[row-i][col-i].equals(color))
            return true;
    
    //check diagonal up-right
    if(row>1 && col<6)
      if(board[row-1][col+1].equals(other))
        for(int i=2; row-i>=0 && col+i<=7; i++)
          if(board[row-i][col+i].equals(color))
            return true;
    
    //check diagonal down-left
    if(row<6 && col>1)
      if(board[row+1][col-1].equals(other))
        for(int i=2; row+i<=7 && col-i>=0; i++)
          if(board[row+i][col-i].equals(color))
            return true;
    
    //check diagonal down-right
    if(row<6 && col<6)
      if(board[row+1][col+1].equals(other))
        for(int i=2; row+i<=7 && col+i<=7; i++)
          if(board[row+i][col+i].equals(color))
            return true;
    
    return false;
  }

  //place a piece where indicated if it's valid. If invalid, ignored.
  public void move(int row, int col) {
    if(validMove(turn, row, col)) {
      board[row][col] = turn;
      
      //flip pieces
      
      //set a variable for the other color
      Piece other;
      if(turn.equals(Piece.BLACK))
        other = Piece.WHITE;
      else
        other = Piece.BLACK;
      
      //flip pieces below if possible
      boolean possibleBelow = false;
      if(col<6)
        if(board[row][col+1].equals(other))
          for(int c=col+2; c<=7; c++)
            if(board[row][c].equals(turn))
              possibleBelow = true;
      if(possibleBelow)
        for(int i=col+1; board[row][i].equals(other); i++)
           board[row][i] = turn;
      
      //flip pieces above if possible
      boolean possibleAbove = false;
      if(col>1)
        if(board[row][col-1].equals(other))
          for(int c=col-2; c>=0; c--)
            if(board[row][c].equals(turn))
              possibleAbove = true;
      if(possibleAbove)
        for(int i=col-1; board[row][i].equals(other); i--)
          board[row][i] = turn;
      
      //flip pieces to the left if possible
      boolean possibleLeft = false;
      if(row>1)
        if(board[row-1][col].equals(other))
          for(int r=row-2; r>=0; r--)
            if(board[r][col].equals(turn))
              possibleLeft = true;
      if(possibleLeft)
        for(int i=row-1; board[i][col].equals(other); i--)
          board[i][col] = turn;
      
      //flip pieces to the right if possible
      boolean possibleRight = false;
      if(row<6)
        if(board[row+1][col].equals(other))
          for(int r=row+2; r<=7; r++)
            if(board[r][col].equals(turn))
              possibleRight = true;
      if(possibleRight)     
        for(int i=row+1; board[i][col].equals(other); i++)
          board[i][col] = turn;
      
      //flip pieces up-left if possible
      boolean possibleUpLeft = false;
      if(row>1 && col>1)
        if(board[row-1][col-1].equals(other))
          for(int i=2; row-i>=0 && col-i>=0; i++)
            if(board[row-i][col-i].equals(turn))
              possibleUpLeft = true;
      if(possibleUpLeft)
        for(int i=1; board[row-i][col-i].equals(other); i++)
          board[row-i][col-i] = turn;
      
      //flip pieces down-left if possible
      boolean possibleDownLeft = false;
      if(row>1 && col<6)
        if(board[row-1][col+1].equals(other))
          for(int i=1; row-i>=0 && col+i<=7; i++)
            if(board[row-i][col+i].equals(turn))
              possibleDownLeft = true;
      if(possibleDownLeft)
        for(int i=1; board[row-i][col+i].equals(other); i++)
          board[row-i][col+i] = turn;
      
      //flip pieces up-right if possible
      boolean possibleUpRight = false;
      if(row<6 && col>1)
        if(board[row+1][col-1].equals(other))
          for(int i=1; row+i<=7 && col-i>=0; i++)
            if(board[row+i][col-i].equals(turn))
              possibleUpRight = true;
      if(possibleUpRight)
        for(int i=1; board[row+i][col-i].equals(other); i++)
          board[row+i][col-i] = turn;
      
      //flip pieces down-right if possible
      boolean possibleDownRight = false;
      if(row<6 && col<6)
        if(board[row+1][col+1].equals(other))
          for(int i=1; row+i<=7 && col+i<=7; i++)
            if(board[row+i][col+i].equals(turn))
              possibleDownRight = true;
      if(possibleDownRight)
        for(int i=1; board[row+i][col+i].equals(other); i++)
          board[row+i][col+i] = turn;
       
      turn = other; //change whose turn it is
    }
  }

  //same as previous move method, but check if "color" parameter is the person
  //whose turn it is.
  public void move(Piece color, int row, int col) {
    if(color.equals(turn)) {
      move(row, col);
    }
  }
  
  public String toString() {
    String str = "  0 1 2 3 4 5 6 7\n";
    for(int i=0; i<board.length; i++) {
      str = str + i;
      for(int j=0; j<board[i].length; j++) {
        if(board[i][j].equals(Piece.NONE))
          str = str + " -";
        else if(board[i][j].equals(Piece.WHITE))
          str = str + " W";
        else
          str = str + " B";
      }
      str += "\n";
    }
    return str;
  }

  public int count(Piece color) {
    int c = 0;
    for(int i=0; i<board.length; i++)
      for(int j=0; j<board[i].length; j++)
        if(board[i][j].equals(color))
          c++;
    return c;
  }

  public boolean moreBlackPieces() {
    return count(Piece.BLACK)>count(Piece.WHITE);
  }

  public boolean moreWhitePieces() {
    return count(Piece.WHITE)>count(Piece.BLACK);
  }

  public boolean equalPieces() {
    return count(Piece.WHITE)==count(Piece.BLACK);
  }
  
  public boolean equals(Object o) {
    if(!(o instanceof Othello))
        return false;
    Othello oth = (Othello)o;
    return this.board==oth.board && this.turn==oth.turn;
  }
}
