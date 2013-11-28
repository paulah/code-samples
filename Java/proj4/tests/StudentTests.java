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
import graph.*;

public class StudentTests {
  @Test public void test1() {
    Graph<Integer> g = makeGraph();
    assertTrue(g.isInCycle(2));
    assertTrue(g.isInCycle(1));
    g.addVertex(11);
    assertFalse(g.isInCycle(11));
    g.removeEdge(4, 3);
    assertTrue(g.isInCycle(3));
    assertTrue(g.isInCycle(5));
    g.removeVertex(8);
    assertFalse(g.isInCycle(7));
    g.removeVertex(2);
    g.removeVertex(5);
    assertFalse(g.isInCycle(1));
  }
  
  @Test public void testSimpleGraph() {
    Graph<Integer> g = new Graph<Integer>();
    g.addVertex(1);
    assertEquals(0, g.Dijkstra(1, 1).getCost());
    assertFalse(g.isInCycle(1));
  }
  
  @Test public void testShortestPathCost() {
    Graph<Integer> g = makeGraph();
    assertEquals(0, g.Dijkstra(1, 1).getCost());
    g.addVertex(13);
    assertEquals(-1, g.Dijkstra(2, 13).getCost());
    assertEquals(1, g.Dijkstra(2, 1).getCost());
  }
  
  private Graph<Integer> makeGraph() {
    Graph<Integer> graph = new Graph<Integer>();
    graph.addVertex(1);
    graph.addEdge(1, 2, 2);
    graph.addEdge(2, 1, 1);
    graph.addEdge(2, 5, 10);
    graph.addEdge(1, 5, 1);
    graph.addEdge(2, 3, 3);
    graph.addEdge(10, 3, 6);
    graph.addEdge(3, 4, 0);
    graph.addEdge(4, 3, 1);
    graph.addEdge(4, 10, 5);
    graph.addEdge(10, 5, 1);
    graph.addEdge(5, 4, 7);
    graph.addEdge(5, 7, 3);
    graph.addVertex(8);
    graph.addEdge(8, 7, 7);
    graph.addEdge(7, 8, 5);
    return graph;
  }
}
