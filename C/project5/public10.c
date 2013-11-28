/*
 * CMSC 216, Spring 2013, Project #5
 * Public test 10 (public10.c)
 *
 * Tests make_target() using a fakefile similar to the one provided in the
 * project description, to build a program main.x, which is then executed.
 * When run, main.x should just print 1.
 */

#include <stdio.h>
#include <stdlib.h>
#include "fakefile.h"

int main() {
  Fakefile fakefile;

  setvbuf(stdout, NULL, _IONBF, 0);

  read_fakefile(&fakefile);

  /* the -f option means that the rm will succeed even if the files don't
     exist */
  system("rm -f main.x main.o functions.o");

  printf("Return value of make_target(): %d\n\n",
         make_target(&fakefile, "main.x"));

  printf("Running main.x now: ");
  system("./main.x");

  clear_fakefile(&fakefile);

  return 0;
}
