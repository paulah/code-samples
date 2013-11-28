/*
 * CMSC 216, Spring 2013, Project #3
 * Public test 4 (public04.c)
 *
 * Tests basic use of the cd command with different directories.  Run with
 * input redirected from public04.input.
 */

#include <stdio.h>
#include "filesystem.h"
#include "driver.h"


int main() {
  Filesystem filesystem;

  driver(&filesystem);

  return 0;
}
