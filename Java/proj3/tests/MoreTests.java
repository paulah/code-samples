package tests;

import org.junit.*;
import java.util.*;

import tree.*;
import static org.junit.Assert.*;

public class MoreTests {

  // Testing add and lookup
  @Test
  public void studentTest01() {
    Tree<Integer, String> atree = EmptyTree.getInstance();

    atree = atree.add(1, "Red");
    atree.add(2, "Orange");
    atree.add(3, "Yellow");

    assertTrue(atree.lookup(2) == "Orange");
    assertTrue(atree.lookup(4) == null);
    assertFalse(atree.lookup(3) == "Blue");
    assertTrue(atree.lookup(1) == "Red");

    atree.add(2, "BWAHAHAHA");
    assertTrue(atree.lookup(2) == "BWAHAHAHA");

  }

  // Testing add and lookup
  @Test
  public void studentTest02() {
    Tree<Integer, String> atree = EmptyTree.getInstance();

    assertTrue(atree.lookup(4) == null);

  }

  // Testing add and size
  @Test
  public void studentTest03() {
    Tree<Integer, String> atree = EmptyTree.getInstance();

    atree = atree.add(1, "Red");
    assertTrue(atree.size() == 1);
    atree.add(2, "Orange");
    atree.add(3, "Yellow");
    assertTrue(atree.size() == 3);

  }

  // Testing add and size
  @Test
  public void studentTest04() {
    Tree<Integer, String> atree = EmptyTree.getInstance();
    assertEquals(atree.size(), 0);

  }

  // Testing max & min
  @Test
  public void studentTest05() {
    Tree<Integer, String> atree = EmptyTree.getInstance();
    atree = atree.add(4, "Fa");
    atree.add(2, "Re");
    atree.add(3, "Mi");
    atree.add(6, "La");
    atree.add(5, "So");
    try{
    assertEquals(atree.max().intValue(), 6);
    assertEquals(atree.min().intValue(), 2);
    }catch(EmptyTreeException e) {
      System.out.println(e.getStackTrace());
    }
  }
  
  // Testing delete
  @Test
  public void studentTest06() {
    Tree<Integer, String> atree = EmptyTree.getInstance();
    atree = atree.add(4, "Fa");
    atree.add(2, "Re");
    atree.add(3, "Mi");
    atree.add(6, "La");
    atree.add(5, "So");
    atree.delete(2);
    try{
    assertEquals(atree.min().intValue(), 3);
    atree.delete(6);
    assertEquals(atree.max().intValue(), 5);
    }catch(EmptyTreeException e){
    }
  }
  
  // Testing delete 2
  @Test
  public void studentTest07() {
    Tree<Integer, String> atree = EmptyTree.getInstance();
    atree = atree.add(10, "Yeol");
    atree = atree.delete(10);
    Tree<Integer, String> btree = EmptyTree.getInstance();
    assertEquals(atree, btree);
  }
  
  
  // Testing delete and toString
  @Test
  public void studentTest08() {
    Tree<Integer, String> atree = EmptyTree.getInstance();
    atree = atree.add(4, "ne");
    atree.add(10, "yeol");
    atree.add(1, "han");
    atree.add(9, "ahob");
    atree.add(2, "du");
    assertEquals(atree.toString(), "1=>han 2=>du 4=>ne 9=>ahob 10=>yeol");
    atree.delete(10);
    assertEquals(atree.toString(), "1=>han 2=>du 4=>ne 9=>ahob");
    atree.delete(2);
    assertEquals(atree.toString(), "1=>han 4=>ne 9=>ahob");
    atree.delete(4);
    assertEquals(atree.toString(), "1=>han 9=>ahob");

  }


  // Testing removeSubTree and toString
  @Test
  public void studentTest09() {
    Tree<Integer, String> atree = EmptyTree.getInstance();
    atree = atree.add(4, "ne");
    atree.add(10, "yeol");
    atree.add(1, "han");
    atree.add(9, "ahob");
    atree.add(2, "du");
    atree.removeSubTree(10);
    assertEquals(atree.toString(), "1=>han 2=>du 4=>ne");
    atree.removeSubTree(1);
    assertEquals(atree.toString(), "4=>ne");
    atree = atree.removeSubTree(4);
    assertEquals(atree.toString(), "");

  }


  // Testing haveSameKeys which uses clone, so also tests clone.
  @Test
  public void studentTest10() {
    Tree<Integer, String> atree = EmptyTree.getInstance();
    atree = atree.add(4, "ne");
    atree.add(10, "yeol");
    atree.add(1, "han");
    atree.add(9, "ahob");
    atree.add(2, "du");
    
    Tree<Integer, String> btree = EmptyTree.getInstance();
    btree = btree.add(4, "ne");
    btree.add(10, "yeol");
    btree.add(1, "han");
    assertFalse(atree.haveSameKeys(btree));
    btree.add(9, "ahob");
    btree.add(2, "du");
    assertTrue(atree.haveSameKeys(btree));
    btree.delete(10);
    btree.add(7, "Hai");
    assertFalse(atree.haveSameKeys(btree));
    btree.delete(7);
    btree = btree.add(10, "hiding");
    assertTrue(atree.haveSameKeys(btree));  
  }

  // tests clone independently from other methods
  @Test
  public void studentTest11() {
    Tree<Integer, String> atree = EmptyTree.getInstance();
    
    atree = atree.add(4, "Fa");
    atree.add(2, "Re");
    atree.add(3, "Mi");
    atree.add(6, "La");
    atree.add(5, "So");
    
    Tree<Integer, String> btree = atree.clone();
    assertEquals(atree.toString(), btree.toString());
    
    Tree<Integer, String> ctree = EmptyTree.getInstance();
    ctree = ctree.add(1, "Red");
    ctree.add(2, "Orange");
    ctree.add(7, "Violet");
    ctree.add(3, "Yellow");
    ctree.add(5, "Blue");

    Tree<Integer, String> dtree = ctree.clone();
    assertEquals(ctree.toString(), dtree.toString());
  }


  // Testing pathToRoot
  @Test
  public void studentTest12() {
    Tree<Integer, String> atree = EmptyTree.getInstance();
    atree = atree.add(4, "ne");
    atree.add(10, "yeol");
    atree.add(1, "han");
    atree.add(9, "ahob");
    atree.add(2, "du");
    
    ArrayList<Integer> alist = new ArrayList<Integer>();
    ArrayList<Integer> blist = new ArrayList<Integer>();
    
    alist.add(7);
    alist.add(5);
    
    atree.pathFromRoot(9, alist);
    blist.add(4);
    blist.add(10);
    blist.add(9);
    assertEquals(alist, blist);
    
    atree.pathFromRoot(2, alist);
    blist.clear();
    blist.add(4);
    blist.add(1);
    blist.add(2);
    assertEquals(alist, blist);
    
    blist.clear();
    blist.addAll(alist);
    atree.pathFromRoot(20, alist);
    assertEquals(alist, blist);
    
  }


  // Testing pathFromRoot
  @Test
  public void studentTest13() {
    Tree<Integer, String> atree = EmptyTree.getInstance();
    atree = atree.add(4, "ne");
    atree.add(10, "yeol");
    atree.add(1, "han");
    atree.add(9, "ahob");
    atree.add(2, "du");
    
    ArrayList<Integer> alist = new ArrayList<Integer>();
    ArrayList<Integer> blist = new ArrayList<Integer>();
    
    alist.add(30);
    alist.add(25);
    
    atree.pathToRoot(9, alist);
    blist.add(9);
    blist.add(10);
    blist.add(4);
    assertEquals(alist, blist);
    
    atree.pathToRoot(2, alist);
    blist.clear();
    blist.add(2);
    blist.add(1);
    blist.add(4);
    assertEquals(alist, blist);
    
    blist.clear();
    blist.addAll(alist);
    atree.pathToRoot(20, alist);
    assertEquals(alist, blist);
    
  }


  
  
}
