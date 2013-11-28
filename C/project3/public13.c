/*
 * CMSC 216, Spring 2013, Project #3
 * Public test 13 (public13.c)
 *
 * Tests the rm command and checks for memory leaks.
 */

#include <stdio.h>
#include "filesystem.h"
#include "memory-checking.h"

int main() {
  Filesystem filesystem;

  setup_memory_checking();

  mkfs(&filesystem);

  touch(&filesystem, "plants");
  rm(&filesystem, "plants");

  mkdir(&filesystem, "animals");
  cd(&filesystem, "animals");
  touch(&filesystem, "hippo");
  touch(&filesystem, "rabbit");

  mkdir(&filesystem, "kangaroo");
  rm(&filesystem, "kangaroo");

  mkdir(&filesystem, "wild");
  touch(&filesystem, "bear");
  touch(&filesystem, "lion");
  touch(&filesystem, "tiger");

  rm(&filesystem, "lion");

  touch(&filesystem, "tiger");

  cd(&filesystem, "/");
  mkdir(&filesystem, "birds");
  mkdir(&filesystem, "plants");

  rm(&filesystem, "birds");

  rmfs(&filesystem);

  check_memory_leak();

  return 0;
}
