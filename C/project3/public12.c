/*
 * CMSC 216, Spring 2013, Project #3
 * Public test 12 (public12.c)
 *
 * Tests the rmfs command and checks for memory leaks.
 */

#include <stdio.h>
#include "filesystem.h"
#include "memory-checking.h"

int main() {
  Filesystem filesystem;

  setup_memory_checking();

  mkfs(&filesystem);

  touch(&filesystem, "plants");
  mkdir(&filesystem, "animals");

  cd(&filesystem, "animals");
  touch(&filesystem, "hippo");
  touch(&filesystem, "rabbit");
  mkdir(&filesystem, "wild");
  touch(&filesystem, "bear");
  touch(&filesystem, "lion");
  touch(&filesystem, "tiger");

  cd(&filesystem, "/");
  mkdir(&filesystem, "birds");
  cd(&filesystem, "birds");
  touch(&filesystem, "peacock");

  rmfs(&filesystem);

  check_memory_leak();

  return 0;
}
