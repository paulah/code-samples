/**
 * Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * Section 0302
 * I pledge on my honor that I have not given or received
 * any unauthorized assistance on this assignment.
 **/

/* The NonEmptyTree class implements the Tree interface and takes two generic
 * objects, some Object type that extends comparable for the key.
 * The comparator will be used to maintain the tree properties and determine
 * where to add new tree elements, etc.
 */

package tree;

import java.util.List;

public class NonEmptyTree<K extends Comparable<K>, V> implements Tree<K, V> {
  private K myKey;
  private V myValue;
  private Tree<K, V> left, right;
  
  //constructor creats a NonEmptyTree with a root element
  public NonEmptyTree(K key, V value) {
    myKey = key;
    myValue = value;
    left = EmptyTree.getInstance();
    right = EmptyTree.getInstance();
  }
  
  //add calls the add helper method, then returns the current object
  public NonEmptyTree<K, V> add(K key, V value) {
    add(key, value, this);
    return this;
  }
  
  //helper method for add
  public NonEmptyTree<K, V> add(K key, V value, NonEmptyTree<K, V> prev) {
    if(myKey.compareTo(key) == 0) {
      myValue = value;
      return this;
    }
    return (myKey.compareTo(key) > 0 ? left : right).add(key, value, this);
  }
  
  //returns the value associated with the given key
  //if the key is not found, returns null
  public V lookup(K key) {
    if(myKey.compareTo(key) == 0)
      return myValue;
    else return (myKey.compareTo(key) > 0 ? left : right).lookup(key);
  }
  
  //returns the number of elements in the tree
  public int size() {
    return 1 + left.size() + right.size();
  }
  
  //returns the largest key in the tree, which is all the way to the right
  public K max() throws EmptyTreeException {
    try {
      return right.max();
    } catch (EmptyTreeException e) {
      return myKey;
    }
  }
  
  //returns the smallest key in the tree, which is all the way to the left
  public K min() throws EmptyTreeException {
    try {
      return left.min();
    } catch (EmptyTreeException e) {
      return myKey;
    }
  }
  
  //calls the delete helper method
  //returns true if key is successfully deleted
  public Tree<K, V> delete(K key) {
    boolean onlyOneElement = delete(key, this, false);
    if(onlyOneElement)
      return EmptyTree.getInstance();
    return this;
  }
  
  //helper method for delete
  public boolean delete(K key, NonEmptyTree<K, V> prev, boolean isLeft) {
    if(myKey.compareTo(key) == 0) {    
      try { //replace my current key and value with the max of the left subtree
        myValue = lookup(left.max());
        myKey = left.max();
        left.delete(left.max(), this, true);
      }
      catch (EmptyTreeException e) { //no left subtree
        try { //the replace my current key and value with min of right subtree
          myValue = lookup(right.min());
          myKey = right.min();
          right.delete(right.min(), this, false);
        }
        catch (EmptyTreeException e1) {
          if(prev.equals(this)) //only 1 element!
            return true;
          else if(isLeft)
            prev.left = EmptyTree.getInstance();
          else
            prev.right = EmptyTree.getInstance();
        }
      }
    }
    else if(myKey.compareTo(key) > 0)
      left.delete(key, this, true);
    else
      right.delete(key, this, false);
    return false;
  }
  
  //removes the subtree associated with the key "key" 
  public Tree<K, V> removeSubTree(K key) {
    if(myKey.compareTo(key) == 0)
      return EmptyTree.getInstance();
    removeSubTree(key, this);
    return this;
  }
  
  //helper method for removeSubTree
  public void removeSubTree(K key, NonEmptyTree<K, V> prev) {
    if(myKey.compareTo(key) == 0) {
      if(prev.myKey.compareTo(key) > 0)
        prev.left = EmptyTree.getInstance();
      else
        prev.right = EmptyTree.getInstance();
    }
    else if(myKey.compareTo(key) > 0)
      left.removeSubTree(key, this);
    else
      right.removeSubTree(key, this);
  }
  
  //returns true if both trees have the same keys
  public boolean haveSameKeys(Tree<K, V> otherTree) {
    if(size() != otherTree.size())
      return false;
    return haveSameKeysHelper(otherTree);
  }
  
  //helper method for haveSameKeys
  public boolean haveSameKeysHelper(Tree<K, V> otherTree) {
    if(otherTree.isPresent(myKey))
      return left.haveSameKeysHelper(otherTree) &&
          right.haveSameKeysHelper(otherTree);
    else
      return false;
  }
  
  //finds the path from the root to the key "key" and adds the keys to list.
  //if key is not present, list is left unchanged
  public void pathFromRoot(K key, List<K> list) {
    if(!isPresent(key))
      return;
    else {
      list.clear();
      pathFromRootHelper(key, list);
    }
  }
  
  //helper method for pathFromRoot
  public void pathFromRootHelper(K key, List<K> list) {
    if(!isPresent(key))
      return;
    else {
      list.add(myKey);
      if(myKey.compareTo(key) > 0)
        left.pathFromRootHelper(key, list);
      else if(myKey.compareTo(key) < 0)
        right.pathFromRootHelper(key, list);
      else return;
    }
  }
  
  //checks if key is present in the tree
  public boolean isPresent(K key) {
    if(myKey.compareTo(key) == 0)
      return true;
    return (myKey.compareTo(key) > 0 ? left : right).isPresent(key);
  }
  
  //same as pathFromRoot, except gives the path from the given key to the root
  public void pathToRoot(K key, List<K> list) {
    if(isPresent(key)) {
      list.clear();
      list.add(key);
      while(key != myKey) {
        list.add(getParent(key, this));
        key = getParent(key, this);
      }
    }   
  }  
  
  //toString returns a String that traverses the tree least to greatest
  public String toString() {
    return left.toString() + (left.toString().equals("") ? "" : " ") +
        myKey + "=>" + myValue +
        (right.toString().equals("") ? "" : " ")+ right.toString(); 
  }

  //attempts to create a deep copy of a tree
  //if K and V are mutable objects with mutable fields, these will not be deep
  //copied.
  @SuppressWarnings("unchecked")
  public NonEmptyTree<K, V> clone() {
    NonEmptyTree<K, V> other = null;
    try {
      other = (NonEmptyTree<K, V>) super.clone();
    } catch (CloneNotSupportedException c) {
      c.printStackTrace();
    }
    other.myKey = myKey;
    other.myValue = myValue;
    other.left = left.clone();
    other.right = right.clone();
    return other;
  }
  
  //returns myKey
  public K getKey() {
    return myKey;
  }
  
  //sets the left subtree
  public void setLeft(Tree<K, V> t) {
    left = t;
  }
  
  //sets the right subtree
  public void setRight(Tree<K, V> t) {
    right = t;
  }
  
  //returns the parent of a given key
  public K getParent(K key, NonEmptyTree<K, V> prev) {
    if(myKey.compareTo(key) == 0)
      return prev.myKey;
    else if(myKey.compareTo(key) > 0)
      return left.getParent(key, this);
    else
      return right.getParent(key, this);
  }
}
