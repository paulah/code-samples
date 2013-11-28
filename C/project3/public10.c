/*
 * CMSC 216, Spring 2013, Project #3
 * Public test 10 (public10.c)
 *
 * Tests the rm command.  Run with input redirected from public10.input.
 */

#include <stdio.h>
#include "filesystem.h"
#include "driver.h"

int main() {
  Filesystem filesystem;

  driver(&filesystem);

  return 0;
}
