package tests;

import java.util.Comparator;

public class CharacterComparator implements Comparator<Character> {

  public int compare(Character a, Character b) {
    if (a.compareTo(b) < 0)
      return -1;
    else
      if (a.compareTo(b) > 0)
        return 1;
      else return 0;
  }

}
