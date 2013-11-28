/*
 * CMSC 216, Spring 2013, Project #3
 * Public test 2 (public02.c)
 *
 * Tests basic operation of the mkdir and ls commands.
 */

#include <stdio.h>
#include "filesystem.h"

int main() {
  Filesystem filesystem;

  mkfs(&filesystem);

  mkdir(&filesystem, "animals");
  mkdir(&filesystem, "birds");
  mkdir(&filesystem, "insects");
  mkdir(&filesystem, "plants");

  ls(&filesystem, ".");

  return 0;
}
