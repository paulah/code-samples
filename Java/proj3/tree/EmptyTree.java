/**
 * Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * Section 0302
 * I pledge on my honor that I have not given or received
 * any unauthorized assistance on this assignment.
 **/

/* This creates the EmptyTree class (the Object equivalent of a null pointer).
 * The "left" and "right" fields of a NonEmptyTree can point either to another
 * nonempty tree or an empty tree. The EmptyTree class is a singleton class
 * which means that all references to EmptyTree point to the same object.
 * This object can be accessed through the method getInstance().
 */

package tree;

import java.util.List;

@SuppressWarnings("unchecked")
public final class EmptyTree<K extends Comparable<K>, V> implements Tree<K, V> {
  @SuppressWarnings("rawtypes")
  //create a single instance of the EmptyTree class
  private static EmptyTree empty = new EmptyTree();
  
  //returns the single instance of the EmptyTree class
  public static <K extends Comparable<K>, V> EmptyTree<K, V> getInstance() {
    return empty;
  }
  
  //add returns a NonEmptyTree with the Key-Value pair as its single entry
  public NonEmptyTree<K, V> add(K key, V value) {
    return new NonEmptyTree<K, V>(key, value);
  }
  
  //lookup should return the value associated with a particular key
  //there are no keys present, so the key passed in as a parameter cannot be
  //present. the method returns null.
  public V lookup(K key) {
    return null;
  }
  
  //size() returns the size of the array
  public int size() {
    return 0;
  }
  
  //max() throws an EmptyTreeException because the tree does not contain
  //any keys.
  public K max() throws EmptyTreeException {
    throw new EmptyTreeException();
  }
  
  //min() throws an EmptyTreeException because the tree does not contain any
  //keys.
  public K min() throws EmptyTreeException {
    throw new EmptyTreeException();
  }
  
  //delete() returns the current EmptyTree because there are no elements to
  //delete.
  public Tree<K, V> delete(K key) {
    return this;
  }
  
  //removeSubTree returns the current EmptyTree because there are no elements
  //to remove.
  public Tree<K, V> removeSubTree(K key) {
    return this;
  }

  //haveSameKeys returns true if otherTree is also an EmptyTree
  //(because "this," the object calling the method, must be an EmptyTree
  public boolean haveSameKeys(Tree<K, V> otherTree) {
    return otherTree == getInstance();
  }
  
  //pathFromRoot does not affect the current object and returns void.
  public void pathFromRoot(K key, List<K> list) {
    return;
  }
  
  //pathToRoot does not affect the current object and returns void 
  public void pathToRoot(K key, List<K> list) {
    return;
  }
  
  //toString returns an empty string
  public String toString() {
    return "";
  }
  
  //returns the empty tree
  public EmptyTree<K, V> clone() {
    return empty;
  }
  
  //cannot delete the given key because there are no elements, thus returns
  //false and does not affect the object.
  public boolean delete(K key, NonEmptyTree<K, V> prev, boolean isLeft) {
    return false;
  }
  
  //removeSubTree does not affect the object and returns null.
  public void removeSubTree(K key, NonEmptyTree<K, V> prev) {
    return;
  }
  
  //the add helper determines whether or not the new element should replace the
  //empty tree on "prev" (parent tree's) left or right.
  public NonEmptyTree<K, V> add(K key, V value, NonEmptyTree<K, V> prev) {
    if(prev.getKey().compareTo(key) > 0)
      prev.setLeft(add(key, value));
    else if(prev.getKey().compareTo(key) < 0)
      prev.setRight(add(key, value));
    return prev;
  }
  
  //pathFromRoot returns void
  public void pathFromRoot(K key, List<K> list, NonEmptyTree<K, V> prev) {
    return;
  }
  
  //isPresent returns false because there are no elements
  public boolean isPresent(K key) {
    return false;
  }
  
  //returns the parent of the particular key
  public K getParent(K key, NonEmptyTree<K, V> prev) {
    return prev.getKey();
  }
  
  //getKey() returns null - EmptyTree does not have the myKey field
  public K getKey() {
    return null;
  }
  
  //returns whether or not the other tree has an EmptyTree in it, which
  //is always true.
  public boolean haveSameKeysHelper(Tree<K, V> otherTree) {
    return true;
  }
  
  //pathFromRootHelper returns void
  public void pathFromRootHelper(K key, List<K> list) {
    return;
  }
}
