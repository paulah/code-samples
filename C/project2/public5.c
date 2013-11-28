/*
 * CMSC 216, Spring 2013, Project #2
 * Public test 5 (public5.c)
 *
 * Tests print_instruction() with some memory-address-operand instructions.
 */

#include <stdio.h>
#include "machine.h"

int main() {
  print_instruction(0x70000330);
  printf("\n");

  print_instruction(0x75000134);
  printf("\n");

  print_instruction(0x80000248);
  printf("\n");

  return 0;
}
