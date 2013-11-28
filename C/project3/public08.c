/*
 * CMSC 216, Spring 2013, Project #3
 * Public test 8 (public08.c)
 *
 * Tests a few error conditions for the cd command.  Run with input
 * redirected from public08.input.
 */

#include <stdio.h>
#include "filesystem.h"
#include "driver.h"

int main() {
  Filesystem filesystem;

  driver(&filesystem);

  return 0;
}
