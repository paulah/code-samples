/*
 * CMSC 216, Spring 2013, Project #5
 * Public tests 1 through 4 (public01.c)
 *
 * This program is used for the first four public tests (public02.c,
 * public03.c, and public04.c are symbolic links to this file, public01.c).
 * All test basic use of read_fakefile() and print_fakefile().  Run each one
 * with input redirected from the corresponding input file, and compare the
 * output produced to the corresponding output file, e.g.:
 *
 * public01.x < public01.input | diff - public01.output
 *
 * public01: Tests basic read/print operations on a single-rule fakefile
 * public02: The same tests on a fakefile with a few rules.
 * public03: The same tests on a fakefile with comments and whitespace.
 * public04: Tests if a rule with no dependencies is printed properly.
 */

#include <stdio.h>
#include "fakefile.h"

int main() {
  Fakefile fakefile;

  read_fakefile(&fakefile);
  print_fakefile(&fakefile);

  return 0;
}
