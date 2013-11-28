package tests;

import java.util.Comparator;

// equivalent to an Integer comparator, but has field that increments
// after every compare to measure performance
public class IntegerEfficiencyComparator implements Comparator<Integer> {

  public int compareCount= 0;

  public int compare(Integer a, Integer b) {
    compareCount++;
    return a.compareTo(b);
  }

  public void reset() {
    compareCount= 0;
  }

}
