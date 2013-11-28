/*
 * CMSC 216, Spring 2013, Project #3
 * Public test 6 (public06.c)
 *
 * Tests different options for the ls command.  Run with input redirected
 * from public06.input.
 */

#include <stdio.h>
#include "filesystem.h"
#include "driver.h"

int main() {
  Filesystem filesystem;

  driver(&filesystem);

  return 0;
}
