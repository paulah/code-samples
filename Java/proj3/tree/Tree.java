/**
 * Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * Section 0302
 * I pledge on my honor that I have not given or received
 * any unauthorized assistance on this assignment.
 **/

/* The Tree class provides an interface for a polymorphic binary tree.
 * A binary tree has a root element and a left and right element that point to
 * trees. Left and Right can be of the class EmptyTree or NonEmptyTree.
 * In a binary tree, all nodes must be greater than all the elements in their
 * left subtree and less than all the elements in their right subtree.
 * There cannot be duplicate values.
 * EmptyTree and NonEmptyTree implement the Tree methods.
 * The Tree class uses generics as the tree values and takes any object
 * that implements comparable as the Key value and any object that the Key maps
 * to.
 */

package tree;

import java.util.List;

public interface Tree<K extends Comparable<K>, V> extends Cloneable {

  public NonEmptyTree<K, V> add(K key, V value); //add an element to the tree
  public V lookup(K key); //find the value associated with a key
  public int size(); //returns the number of elements in a tree
  public K max() throws EmptyTreeException; //returns the largest key
  public K min() throws EmptyTreeException; //returns the smallest key
  public Tree<K, V> delete(K key);
    //removes element with key "key", keeping the tree binary
  public boolean haveSameKeys(Tree<K, V> otherTree);
    //checks if two trees have the same keys, regardless of structure
  public Tree<K, V> removeSubTree(K key); //removes the subtree at key "key"
  public void pathFromRoot(K key, List<K> list);
    //if key exists, changes list to the path from the root to the element "key"
    //if key doesn't exist, do not affect list
  public void pathToRoot(K key, List<K> list);
    //same as pathFromRoot except gives the path from the given key to the root
  public Tree<K, V> clone();
    //returns virtually a deep copy of the Tree (K and V can be mutable objects
    // and the mutable fields of these will not be deep copied.)
  public boolean delete(K key, NonEmptyTree<K, V> prev, boolean isLeft);
    //helper method for delete
  public void removeSubTree(K key, NonEmptyTree<K, V> prev);
    //helper method for removeSubTree
  public NonEmptyTree<K, V> add(K key, V value, NonEmptyTree<K, V> prev);
    //helper method for add
  public boolean isPresent(K key); //checks if a key is present, returns boolean
  public K getParent(K key, NonEmptyTree<K, V> prev);
    //returns the parent of a given key
  public K getKey();
    //returns myKey
  public boolean haveSameKeysHelper(Tree<K, V> otherTree);
    //helper method for haveSameKeys
  public void pathFromRootHelper(K key, List<K> list);
    //helper method for pathFromRoot
}
