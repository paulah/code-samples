/*
 * CMSC 216, Spring 2013, Project #3
 * Public test 1 (public01.c)
 *
 * Tests basic operation of the touch and ls commands.
 */

#include <stdio.h>
#include "filesystem.h"

int main() {
  Filesystem filesystem;

  mkfs(&filesystem);

  touch(&filesystem, "lion");
  touch(&filesystem, "camel");
  touch(&filesystem, "tiger");
  touch(&filesystem, "elephant");

  ls(&filesystem, ".");

  return 0;
}
