/*
 * CMSC 216, Spring 2013, Project #2
 * Public test 7 (public7.c)
 *
 * Verifies that print_instruction() returns 1 for valid instructions, and
 * that disassemble() returns the number of valid instructions printed.
 */

#include <stdio.h>
#include "machine.h"

#define SZ 9

int main() {
  unsigned int program[SZ]= {0x00000000, 0x10000000, 0xa0200000, 0xb0300000,
                             0xf0200000, 0x3005ffff, 0x300500d8, 0x40233333,
                             0x50144444};
  int ans= 1;

  ans= ans && print_instruction(0x10000000);
  printf("\n");

  ans= ans && print_instruction(0x90000000);
  printf("\n");

  ans= ans && print_instruction(0xb0300000);
  printf("\n");

  ans= ans && print_instruction(0x300500d8);
  printf("\n");

  ans= ans && print_instruction(0x40233333);
  printf("\n");

  ans= ans && print_instruction(0x50144444);
  printf("\n");

  ans= ans && print_instruction(0xf0200000);
  printf("\n");

  ans= ans && print_instruction(0x3005ffff);
  printf("\n");

  if (ans == 1)
    printf("Correct value was returned by all print_instruction() calls.\n");
  else printf("Wrong value was returned by some print_instruction(). call \n");

  printf("\n");

  if (disassemble(program, SZ) == SZ)
    printf("Correct value was returned by disassemble().\n");
  else printf("Wrong value was returned by disassemble().\n");

  return 0;
}
