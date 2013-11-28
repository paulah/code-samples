/*
 * CMSC 216, Spring 2013, Project #2
 * Public test 3 (public3.c)
 *
 * Tests print_instruction() with some register-and-immediate instructions.
 */

#include <stdio.h>
#include "machine.h"

int main() {
  print_instruction(0x3005ffff);
  printf("\n");

  print_instruction(0x300500d8);
  printf("\n");

  print_instruction(0xc0029876);
  printf("\n");

  return 0;
}
