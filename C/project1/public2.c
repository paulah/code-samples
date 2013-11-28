/*
 * CMSC 216, Spring 2013, Project #1
 * Public test 2 (public2.c)
 *
 * Tests the flag of Luxembourg (create_luxembourg()) with a different
 * height, as well as print_flag().  Ensures that both functions return 1.
 */

#include <stdio.h>
#include "flags.h"

#define H 12
#define W 20

int main() {
  char flag[MAX][MAX];
  int ans;

  ans= create_luxembourg(flag, H);

  if (ans == 1)
    ans= ans && (print_flag(flag, H, W) == 1);

  if (ans != 1)
    printf("Unexpected value returned.\n");

  return 0;
}
