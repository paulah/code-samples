/*
 * CMSC 216, Spring 2013, Project #1
 * Public test 8 (public8.c)
 *
 * Checks that create_luxembourg() detects some error conditions correctly,
 * and returns 0 for them.
 */

#include <stdio.h>
#include "flags.h"

int main() {
  char flag[MAX][MAX];

  if (create_luxembourg(flag, 10) != 0)
    printf("Wrong return value for create_luxembourg(flag, 10).\n");
  else
    if (create_luxembourg(flag, 60) != 0)
      printf("Wrong return value for create_luxembourg(flag, 60).\n");
    else printf("Correct values returned by both calls.\n");

  return 0;
}
