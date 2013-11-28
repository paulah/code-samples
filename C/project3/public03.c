/*
 * CMSC 216, Spring 2013, Project #3
 * Public test 3 (public03.c)
 *
 * Tests basic operation of the mkdir, touch and ls commands.
 */

#include <stdio.h>
#include "filesystem.h"

int main() {
  Filesystem filesystem;

  mkfs(&filesystem);

  mkdir(&filesystem, "rectangle");
  touch(&filesystem, "circle");
  mkdir(&filesystem, "square");
  mkdir(&filesystem, "hexagon");
  touch(&filesystem, "octagon");
  mkdir(&filesystem, "pentagon");
  touch(&filesystem, "triangle");
  touch(&filesystem, "ellipse");

  ls(&filesystem, ".");

  return 0;
}
