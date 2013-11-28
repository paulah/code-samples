/*
 * CMSC 216, Spring 2013, Project #2
 * Public test 4 (public4.c)
 *
 * Tests print_instruction() with both of the two-register-and-displacement
 * instructions.
 */

#include <stdio.h>
#include "machine.h"

int main() {
  print_instruction(0x40233333);
  printf("\n");

  print_instruction(0x40231133);
  printf("\n");

  print_instruction(0x50144444);
  printf("\n");

  print_instruction(0x50141144);
  printf("\n");

  return 0;
}
