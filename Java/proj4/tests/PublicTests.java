package tests;

import graph.Graph;
import graph.ShortestPath;
import java.util.Iterator;
import org.junit.*;
import static org.junit.Assert.*;

public class PublicTests {

  // checks for the presence of an edge in a small graph that contains only
  // two vertices, with that as the only edge
  @Test public void testPublic1() {
    Graph<Character> graph= TestGraphs.testGraph1();

    assertEquals(3, graph.getEdge('A', 'B'));
  }

  // calls getNeighbors() on the only vertex in a small graph that has an
  // edge (the only edge), to the only other vertex, and ensures that the
  // adjacent vertex is in the set returned
  @Test public void testPublic2() {
    Graph<Character> graph= TestGraphs.testGraph1();

    assertEquals("B", TestGraphs.iterableToString(graph.getNeighbors('A')));
  }

  // ensures that only the vertices connected to outgoing edges from a
  // vertex are in the set returned by getNeighbors(), when called on a
  // small graph that has only two vertices and one edge
  @Test public void testPublic3() {
    Graph<Character> graph= TestGraphs.testGraph1();

    assertEquals("", TestGraphs.iterableToString(graph.getNeighbors('B')));
  }

  // checks the effects of using removeEdge() to remove some edges from a
  // graph by checking the neighbors of all of the vertices afterwards
  @Test public void testPublic4() {
    Graph<Character> graph= TestGraphs.testGraph2();
    String[] results= {"O", "", "", "E F", "", "", "", "", "", "", "",
                       "B K", "A N", "C G", "H", "D"};
    Character ch;
    int i;

    graph.removeEdge('A', 'I');
    graph.removeEdge('K', 'J');
    graph.removeEdge('M', 'L');
    graph.removeEdge('N', 'P');

    for (ch= 'A', i= 0; ch <= 'P'; ch++, i++)
      assertEquals(results[i],
                   TestGraphs.iterableToString(graph.getNeighbors(ch)));
  }

  // tests the graph iterator; is the same as the previous test except for
  // use of the iterator (note that "ch - 'A'" is the index of an element of
  // the array; its value is 0 if ch is 'A', 1 if ch is 'B', etc.)
  @Test public void testPublic5() {
    Graph<Character> graph= TestGraphs.testGraph2();
    String[] results= {"O", "", "", "E F", "", "", "", "", "", "", "",
                       "B K", "A N", "C G", "H", "D"};

    graph.removeEdge('A', 'I');
    graph.removeEdge('K', 'J');
    graph.removeEdge('M', 'L');
    graph.removeEdge('N', 'P');

    for (Character ch : graph)
      assertEquals(results[ch - 'A'],
                   TestGraphs.iterableToString(graph.getNeighbors(ch)));
  }

  // tests getNeighbors() on a graph that has a cycle
  @Test public void testPublic6() {
    Graph<Integer> graph= TestGraphs.testGraph3();
    String[] results= {"1 4", "2 4", "3 4", "0 4", ""};
    Integer i;

    for (i= 0; i <= 4; i++)
      assertEquals(results[i],
                   TestGraphs.iterableToString(graph.getNeighbors(i)));

  }

  // tests the effect of removeVertex() in removing some vertices from a
  // graph
  @Test public void testPublic7() {
    Graph<Character> graph= TestGraphs.testGraph2();
    char[] toRemove= {'I', 'H', 'B', 'J', 'C', 'G', 'E', 'F'};
    Iterator<Character> iter;
    int i;

    for (i= 0; i < toRemove.length; i++)
      graph.removeVertex(toRemove[i]);

    for (i= 0; i < toRemove.length; i++) {
      iter= graph.iterator();
      assertFalse(TestGraphs.hasVertex(iter, toRemove[i]));
    }
  }

  // tests that removeVertex() removes the necessary edges also
  @Test public void testPublic8() {
    Graph<Character> graph= TestGraphs.testGraph2();
    char[] toRemove= {'I', 'H', 'B', 'J', 'C', 'G', 'E', 'F'};
    String[] results= {"O", "", "", "", "", "", "", "", "", "", "", "K",
                       "A L N", "P", "", "D"};
    int i;

    for (i= 0; i < toRemove.length; i++)
      graph.removeVertex(toRemove[i]);

    for (Character ch : graph)
      assertEquals(results[ch - 'A'],
                   TestGraphs.iterableToString(graph.getNeighbors(ch)));
  }

  // ensures that isInCycle() returns false for every vertex in an acyclic
  // graph
  @Test public void testPublic9() {
    Graph<Character> graph= TestGraphs.testGraph2();

    for (Character ch : graph)
      assertFalse(graph.isInCycle(ch));
  }

  // ensures that isInCycle() returns true for every vertex in a graph in
  // which all vertices are in a cycle
  @Test public void testPublic10() {
    Graph<Integer> graph= new Graph<Integer>();
    int i;

    // note this adds the adjacent vertices in the process
    for (i= 0; i < 10; i++)
      graph.addEdge(i, i + 1, 1);
    graph.addEdge(10, 0, 1);

    for (Integer vertex : graph)
      assertTrue(graph.isInCycle(vertex));
  }

  // checks the result of isInCycle() on a graph in which some vertices are
  // in a cycle but one is not
  @Test public void testPublic11() {
    Graph<Integer> graph= TestGraphs.testGraph3();
    int i;

    for (i= 0; i < 4; i++)
      assertTrue(graph.isInCycle(i));

    assertFalse(graph.isInCycle(4));
  }

  // calls Dijkstra's algorithm on a pair of vertices in a simple graph and
  // checks its results
  @Test public void testPublic12() {
    Graph<Character> graph= TestGraphs.testGraph2();
    ShortestPath<Character> shortestPath= graph.Dijkstra('A', 'O');
    assertEquals(1, shortestPath.getCost());
    assertEquals("A O", TestGraphs.getPath(shortestPath.getPath()));
  }

  // calls Dijkstra's algorithm on another pair of vertices in a simple
  // graph and checks its results
  @Test public void testPublic13() {
    Graph<Character> graph= TestGraphs.testGraph2();
    ShortestPath<Character> shortestPath= graph.Dijkstra('M', 'F');

    assertEquals(4, shortestPath.getCost());
    assertEquals("M N P D F", TestGraphs.getPath(shortestPath.getPath()));
  }

  // calls Dijkstra's algorithm on a pair of vertices in a more complex
  // graph and checks its results
  @Test public void testPublic14() {
    Graph<Integer> graph= TestGraphs.testGraph4();
    ShortestPath<Integer> shortestPath= graph.Dijkstra(131, 351);

    assertEquals(5, shortestPath.getCost());
    assertEquals("131 330 351", TestGraphs.getPath(shortestPath.getPath()));
  }

  // calls Dijkstra's algorithm on another pair of vertices in a more
  // complex graph and checks its results
  @Test public void testPublic15() {
    Graph<Integer> graph= TestGraphs.testGraph4();
    ShortestPath<Integer> shortestPath= graph.Dijkstra(131, 141);

    assertEquals(8, shortestPath.getCost());
    assertEquals("131 330 132 141",
                 TestGraphs.getPath(shortestPath.getPath()));
  }

  // calls Dijkstra's algorithm on another pair of vertices in a more
  // complex graph and checks its results
  @Test public void testPublic16() {
    Graph<Integer> graph= TestGraphs.testGraph4();
    ShortestPath<Integer> shortestPath= graph.Dijkstra(250, 141);

    assertEquals(13, shortestPath.getCost());
    assertEquals("250 351 132 141",
                 TestGraphs.getPath(shortestPath.getPath()));
  }

}
