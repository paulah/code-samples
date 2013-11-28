/*
 * CMSC 216, Spring 2013, Project #3
 * Public test 5 (public05.c)
 *
 * Tests the pwd command.  Run with input redirected from public05.input.
 */

#include <stdio.h>
#include "filesystem.h"
#include "driver.h"

int main() {
  Filesystem filesystem;

  driver(&filesystem);

  return 0;
}
