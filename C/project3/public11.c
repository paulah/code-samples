/*
 * CMSC 216, Spring 2013, Project #3
 * Public test 11 (public11.c)
 *
 * Tests the rmfs command.  Run with input redirected from public11.input.
 */

#include <stdio.h>
#include "filesystem.h"
#include "driver.h"

int main() {
  Filesystem filesystem;

  driver(&filesystem);

  return 0;
}
