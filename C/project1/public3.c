/*
 * CMSC 216, Spring 2013, Project #1
 * Public test 3 (public3.c)
 *
 * Tests the flag of Romania (create_romania()), as well as print_flag().
 * Ensures that both functions return 1.
 */

#include <stdio.h>
#include "flags.h"

#define H 12
#define W 18

int main() {
  char flag[MAX][MAX];
  int ans;

  ans= create_romania(flag, H);

  if (ans == 1)
    ans= ans && (print_flag(flag, H, W) == 1);

  if (ans != 1)
    printf("Unexpected value returned.\n");

  return 0;
}
