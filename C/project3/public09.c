/*
 * CMSC 216, Spring 2013, Project #3
 * Public test 9 (public09.c)
 *
 * Tests the addline and cat commands.  Run with input redirected from
 * public09.input.
 */

#include <stdio.h>
#include "filesystem.h"
#include "driver.h"

int main() {
  Filesystem filesystem;

  driver(&filesystem);

  return 0;
}
