/*
 * CMSC 216, Spring 2013, Project #2
 * Public test 2 (public2.c)
 *
 * Tests print_instruction() with some one-register-operand and
 * two-register-operand instructions.
 */

#include <stdio.h>
#include "machine.h"

int main() {
  print_instruction(0xa0200000);
  printf("\n");
  print_instruction(0xb0300000);
  printf("\n");
  print_instruction(0xf0200000);
  printf("\n");
  print_instruction(0xf1100000);
  printf("\n");
  print_instruction(0x60310000);
  printf("\n");
  print_instruction(0x61020000);
  printf("\n");
  print_instruction(0x62230000);
  printf("\n");
  print_instruction(0x63320000);
  printf("\n");

  return 0;
}
