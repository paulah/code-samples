/*
 * CMSC 216, Spring 2013, Project #5
 * Public test 9 (public09.c)
 *
 * Tests make_target() when the target is nonexistent (the action should be
 * performed).
 */

#include <stdio.h>
#include <stdlib.h>
#include "fakefile.h"

int main() {
  Fakefile fakefile;

  setvbuf(stdout, NULL, _IONBF, 0);

  read_fakefile(&fakefile);

  printf("\nReturn value of make_target: %d\n",
         make_target(&fakefile, "nonexistent-file"));

  clear_fakefile(&fakefile);

  return 0;
}
