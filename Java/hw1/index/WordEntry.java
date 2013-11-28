/**
 * Paula Huang
 * DirectoryID: phuang
 * UID: 112419189
 * Section 0302
 * I pledge on my honor that I have not given or received
 * any unauthorized assistance on this assignment.
 **/


package index;

public class WordEntry {
  String word;
  int[] pages;
  
  public WordEntry(String w, int[] p) {
    word = w;
    pages = p;
  }
  
  public boolean equals(Object obj) {
    if(!(obj instanceof WordEntry))
      return false;
    WordEntry entry = (WordEntry)obj;
    return entry.word == this.word && entry.pages == this.pages;
  }
  
  public String toString() {
    String str = this.word + ":";
    for(int j=0; j<this.pages.length; j++)
      str += " " + this.pages[j];
    return str;
  }
}
