/*
 * CMSC 216, Spring 2013, Project #5
 * Public tests 5 and 6 (public05.c)
 *
 * This program is used for the fifth and sixth public tests (public06.c is
 * a symbolic link to this file, public05.c).  These test clear_fakefile().
 * Run each one with input redirected from the corresponding input file, and
 * compare the output produced to the corresponding output file.
 *
 * public05: Checks whether memory for a fakefile with only one rule is
             properly freed.
 * public06: The same tests on a fakefile with a few rules.
 */

#include <stdio.h>
#include "fakefile.h"
#include "memory-checking.h"

int main() {
  Fakefile fakefile;

  setup_memory_checking();

  read_fakefile(&fakefile);
  print_fakefile(&fakefile);
  clear_fakefile(&fakefile);

  check_memory_leak();

  return 0;
}
