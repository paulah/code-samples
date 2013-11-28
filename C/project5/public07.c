/*
 * CMSC 216, Spring 2013, Project #5
 * Public tests 7 and 8 (public07.c)
 *
 * This program is used for the seventh and eighth public tests (public08.c
 * is a symbolic link to this file, public07.c).  These are simple tests of
 * make_target().  Run each one with input redirected from the corresponding
 * input file, and compare the output produced to the corresponding output
 * file.
 *
 * public07: make_target() is called on the target of a single-rule
 *           fakefile, where the target already exists and is already newer
 *           than its dependency (the action should not be performed).
 * public08: The same tests on a fakefile with a dependency that exists and
 *           is older than the target (so the action should be performed).
 */

#include <stdio.h>
#include <stdlib.h>
#include "fakefile.h"

int main() {
  Fakefile fakefile;

  system("rm -f older_file file newer_file");
  system("date > older_file");
  system("sleep 1");
  system("date > file");
  system("sleep 1");
  system("date > newer_file");

  setvbuf(stdout, NULL, _IONBF, 0);

  read_fakefile(&fakefile);

  printf("\nReturn value of make_target(): %d\n",
         make_target(&fakefile, "file"));

  clear_fakefile(&fakefile);

  return 0;
}
