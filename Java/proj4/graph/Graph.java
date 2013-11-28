/**
 * Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * Section 0302
 * I pledge on my honor that I have not given or received
 * any unauthorized assistance on this assignment.
 **/

/* The Graph class creates a directed graph of a generic type
 * that implements Comparable. Graphs contain vertices, which are nodes in the
 * graph, and edges, which are directed from one vertex to another and have an
 * associated cost. The class contains methods that allow you to modify the
 * graph, find the path with lowest cost from one vertex to another, and the
 * cost associated with this path. The graph class also contains a method that
 * allows you to see if a cycle is reachable from a given vertex. A cycle is a
 * path that begins and eventually returns to the same vertex. 
 */

package graph;

import java.lang.Iterable;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class Graph<V extends Comparable<V>> implements Iterable<V> {
  //inner class
  private class Vertex<T extends Comparable<T>>
          implements Comparable<Vertex<T>> {
    private T myVertex;
    private List<T> adjacent = new List<T>(); //adjacent vertices
    private List<Integer> costs = new List<Integer>();
        //costs of the edges that correspond to adjacent vertices, in the
        //same order.
    private boolean active, done;
        //active and done are important for isInCycle()
        //done is also used for Dijkstra
    private int cost; //used for Dijkstra
    private T predecessor; //used for Dijkstra
    
    //the inner class implements Comparable
    public int compareTo(Vertex<T> other) {
      return myVertex.compareTo(other.myVertex);
    }
    
    //returns the cost from this vertex to another vertex
    private int getCost(T otherVertex) {
      return costs.get(adjacent.getIndex(otherVertex));
    }
    
    public String toString() {
      String str = "";
      str += myVertex.toString() +
          ": " + adjacent.toString() + ": " + costs.toString() + "\n";
      return str;
    }
  }
  
  //linked list of all the vertices in the graph
  private List<Vertex<V>> vertices = new List<Vertex<V>>();

  //adds a new vertex to the graph, but no edges
  //if the graph already contains the vertex, the method will throw an
  //IllegalArgumentException
  public void addVertex(V vertex) throws IllegalArgumentException {
    if(contains(vertex))
      throw new IllegalArgumentException();
    else {
      Vertex<V> newVertex = new Vertex<V>();
      newVertex.myVertex = vertex;
      vertices.add(newVertex);
    }
  }
  
  //adds an edge from source to dest, with cost "cost".
  //if cost is negative, the method will throw an IllegalArgumentException
  //if source or dest do not exist yet, the will be added
  public void addEdge(V source, V dest, int cost)
              throws IllegalArgumentException {
    if(cost < 0)
      throw new IllegalArgumentException();
    if(!contains(source))
      addVertex(source);
    if(!contains(dest))
      addVertex(dest);
    if(lookup(source).adjacent.contains(dest)) {
      int index = lookup(source).adjacent.getIndex(dest);
      lookup(source).costs.setIndex(index, cost);
    }
    else {
      lookup(source).adjacent.add(dest);
      lookup(source).costs.add(cost);
    }
  }
  
  //returns the cost of the edge form source to dest
  public int getEdge(V source, V dest) {
    if(!contains(source) || !contains(dest) ||
            !lookup(source).adjacent.contains(dest))
      return -1;
    return lookup(source).getCost(dest);
  }
  
  //returns the linked list of vertices that are adjacent to a particular vertex
  public Iterable<V> getNeighbors(V vertex) throws IllegalArgumentException {
    return lookup(vertex).adjacent;
  }
  
  //removes the edge between source and dest
  //if the edge doesn't exist, the graph will not be changed
  //if source or dest don't exist,
  //the method will throw a NoSuchElementException
  public void removeEdge(V source, V dest) throws NoSuchElementException {
    if(!contains(source) || !contains(dest))
      throw new NoSuchElementException();
    int index = lookup(source).adjacent.getIndex(dest);
    lookup(source).adjacent.delete(dest);
    lookup(source).costs.deleteIndex(index);
  }
  
  //removes a vertex and the edges to and from that vertex
  public void removeVertex(V vertex) throws NoSuchElementException {
    if(!contains(vertex))
      throw new NoSuchElementException();
    vertices.delete(lookup(vertex));
    for(Vertex<V> fe: vertices)
      if(fe.adjacent.contains(vertex)) {
        int index = fe.adjacent.getIndex(vertex);
        fe.adjacent.delete(vertex);
        fe.costs.deleteIndex(index);
      }
  }
  
  //returns an iterator for the vertices in the graph
  public Iterator<V> iterator() {
    List<V> vertexList = new List<V>();
    for(Vertex<V> fe: vertices)
      vertexList.add(fe.myVertex);
    return vertexList.iterator(); //the List class already has an iterator
  }
  
  //isInCycle checks if there is a cycle reachable from the specified vertex
  //if vertex does not exist, the method will throw an IllegalArgumentException
  public boolean isInCycle(V vertex) throws IllegalArgumentException {
    if(!contains(vertex))
      throw new IllegalArgumentException();
    for(Vertex<V> fe: vertices) {
      fe.active = false;
      fe.done = false;
    }
    return isInCycleHelper(vertex);
  }
  
  //recursive helper method for isInCycle
  private boolean isInCycleHelper(V vertex) {
    lookup(vertex).active = true;
    for(V fe: lookup(vertex).adjacent) {
      if(lookup(fe).active)
        return true;
      else if(!lookup(fe).done && isInCycleHelper(fe))
        return true;
    }
    lookup(vertex).done = true;
    return false;
  }

  //finds the shortest path and the cost of this path from source to dest
  //throws IllegalArgumentException if source or dest do not exist
  public ShortestPath<V> Dijkstra(V source, V dest)
         throws IllegalArgumentException {
    if(!contains(source) || !contains(dest))
      throw new IllegalArgumentException();
    ShortestPath<V> shortestPath = new ShortestPath<V>();
    if(source.compareTo(dest) == 0) { //source and dest are the same
      shortestPath.setCost(0);
      List<V> list = new List<V>();
      list.add(source);
      shortestPath.setPath(list);
      shortestPath.setCost(0);
      return shortestPath;
    }
    for(Vertex<V> fe: vertices) {
      //set predecessor, cost, and done fields to default for all vertices
      fe.predecessor = null;
      fe.cost = Integer.MAX_VALUE;
      fe.done = false;
    }
    lookup(source).cost = 0;
    lookup(source).predecessor = source;
    while(notAllDone() && nextVertex() != null) {
      Vertex<V> nextVertex = nextVertex();
      nextVertex.done = true;
      for(V fe: nextVertex.adjacent)
        if(!lookup(fe).done)
          if(nextVertex.cost + nextVertex.getCost(fe) < lookup(fe).cost) {
            lookup(fe).cost = nextVertex.cost + nextVertex.getCost(fe);
            lookup(fe).predecessor = nextVertex.myVertex;
          }
    }
    if(lookup(dest).cost == Integer.MAX_VALUE) { //unreachable vertex
      List<V> list = new List<V>();
      shortestPath.setCost(-1);
      shortestPath.setPath(list);
      return shortestPath;
    }
    List<V> path = new List<V>();
    path.add(dest);
    V pred = lookup(dest).predecessor;
    while(pred.compareTo(source) != 0) {
      path.add(pred);
      pred = lookup(pred).predecessor;
    }
    path.add(source); //path is now in reverse order
    List<V> pathInOrder = new List<V>();
    for(int i = path.size()-1; i >= 0; i--) //reverse the order of the path
      pathInOrder.add(path.get(i));
    shortestPath.setPath(pathInOrder);
    shortestPath.setCost(getCostOfPath(pathInOrder));
    return shortestPath;
  }
  
  //checks if all the vertices' "done" field is false
  private boolean notAllDone() {
    for(Vertex<V> fe: vertices)
      if(!fe.done)
        return true;
    return false;
  }
  
  //used in Dijkstra's algorithm
  //find the vertex K that's not done that has the smallest cost
  private Vertex<V> nextVertex() {
    Vertex<V> nextVertex = null;
    int smallestCost = Integer.MAX_VALUE;
    for(Vertex<V> fe: vertices)
      if(!fe.done && fe.cost < smallestCost) {
        smallestCost = fe.cost;
        nextVertex = fe;
      }
    return nextVertex;
  }
  
  //checks if the graph contains a vertex
  private boolean contains(V vertex) {
    for(Vertex<V> fe: vertices)
      if(fe.myVertex.compareTo(vertex) == 0)
        return true;
    return false;
  }
  
  //returns the Vertex that corresponds with the V vertex key
  private Vertex<V> lookup(V vertex) throws IllegalArgumentException {
    for(Vertex<V> fe: vertices)
      if(fe.myVertex.compareTo(vertex) == 0)
        return fe;
    throw new IllegalArgumentException("Illegal Argument!");
  }
  
  //getCostOfPath takes the list generated from Dijkstra's algorithm and
  //finds its cost.
  private int getCostOfPath(List<V> list) {
    int cost = 0;
    for(int i = 0; i < list.size() - 1; i++)
      cost += getEdge(list.get(i), list.get(i + 1));
    return cost;
  }
  
  public String toString() {
    return vertices.toString();
  }
}
