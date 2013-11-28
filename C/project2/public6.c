/*
 * CMSC 216, Spring 2013, Project #2
 * Public test 6 (public6.c)
 *
 * Tests disassemble() with several instructions.
 */

#include <stdio.h>
#include "machine.h"

#define SZ 9

int main() {
  unsigned int program[SZ]= {0x00000000, 0x10000000, 0xa0200000, 0xb0300000,
                             0xf0200000, 0x3005ffff, 0x300500d8, 0x40233333,
                             0x50144444};

  disassemble(program, SZ);

  return 0;
}
