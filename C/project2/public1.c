/*
 * CMSC 216, Spring 2013, Project #2
 * Public test 1 (public1.c)
 *
 * Tests print_instruction() with the no-operand instructions.
 */

#include <stdio.h>
#include "machine.h"

int main() {
  print_instruction(0x00000000);
  printf("\n");
  print_instruction(0x10000000);
  printf("\n");
  print_instruction(0x90000000);
  printf("\n");
  print_instruction(0xd0000000);
  printf("\n");

  return 0;
}
