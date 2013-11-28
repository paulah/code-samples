/* Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * CMSC216 Section 0202
 *
 * I pledge on my honor that I have neither given nor
 * received any unauthorized assistance on this assignment.
 */

#include <stdio.h>
#include "machine.h"

/* machine.c simulates interpreting assembly language on a machine that
contains 4096 bytes of memory, grouped into four byte words that contains
instructions to manipulate the data. The first byte of each instruction
is an opcode that indicates the operation to be performed, and the remaining
three bytes are interpreted accordingly, as registers, memory addresses,
immediates, or displacement values. There are eight registers numbered 0-7
that can be used. Memory addresses may indicate jumps in execution or indicate
where to store values. Immediates are a literal value that are part of an
instruction. Displacement is a literal value and its value is added to the
contents of a register to refer to a memory address.

The program uses unsigned ints to simulate commands because they happen to be
four bytes on the UMD grace machines. */

static int print_register (unsigned int register_num); /* prototype */

/* print_instruction takes an four byte unsigned int and displays the
   corresponding instruction using printf.
   Returns 1 if memory_word is valid and 0 otherwise. */
int print_instruction (unsigned int memory_word) {

  unsigned int first_byte = memory_word >> 24 & 0xFF;
  unsigned int first_hex_digit = first_byte >> 4 & 0xF;
  unsigned int register1 = memory_word >> 20 & 0xF; /* 1st 4 bits of 2nd byte */
  unsigned int register2 = memory_word >> 16 & 0xF; /* 2nd 4 bits of 2nd byte */
  unsigned int immediate = memory_word & 0xFFFF; /* last two bytes */
  unsigned int memory_address = memory_word & 0xFFFFFF; /* last three bytes */
  unsigned int displacement = immediate;

  if (! (valid_instruction(memory_word)))
    return 0;
  
  /* print the opcode. instruction annotations indicate additional info
     contained in the rest of the memory word and is for reference. */
  switch (first_byte) {
      /* opcode only */
    case 0x00: printf("nop"); break;
    case 0x10: printf("halt"); break;
      /* 2 register: */
    case 0x20: printf("rrmovl"); break;
    case 0x21: printf("cmovle"); break;
    case 0x22: printf("cmovl"); break;
    case 0x23: printf("cmove"); break;
    case 0x24: printf("cmovne"); break;
    case 0x25: printf("cmovge"); break;
    case 0x26: printf("cmovg"); break;
      /* 2nd register only, and immediate */
    case 0x30: printf("irmovl"); break;
      /* 2 register and displacement: */
    case 0x40: printf("rmmovl"); break;
    case 0x50: printf("mrmovl"); break;
      /* 2 register: */
    case 0x60: printf("addl"); break;
    case 0x61: printf("subl"); break;
    case 0x62: printf("andl"); break;
    case 0x63: printf("xorl"); break;
    case 0x64: printf("multl"); break;
    case 0x65: printf("divl"); break;
    case 0x66: printf("modl"); break;
      /* no registers, memory address: */
    case 0x70: printf("jmp"); break;
    case 0x71: printf("jle"); break;
    case 0x72: printf("jl"); break;
    case 0x73: printf("je"); break;
    case 0x74: printf("jne"); break;
    case 0x75: printf("jge"); break;
    case 0x76: printf("jg"); break;
    case 0x80: printf("call"); break;
      /* opcode only */
    case 0x90: printf("ret"); break;
      /* 1st register: */
    case 0xA0: printf("pushl"); break;
    case 0xB0: printf("popl"); break;
      /* 2nd register and immediate */
    case 0xC0: printf("iaddl"); break;
      /* opcode only */
    case 0xD0: printf("leave"); break;
      /* 1st register: */
    case 0xF0: printf("rdch"); break;
    case 0xF1: printf("wrch"); break;
    case 0xF2: printf("rdint"); break;
    case 0xF3: printf("wrint"); break;
  }
  
  /* similar instructions often share the their first hex digit, so printing
     the remaining part of the memory word is done with this switch */
  switch (first_hex_digit) {
    case 0x2:
    case 0x6:
      printf(" ");
      print_register(register1);
      printf(", ");
      print_register(register2);
      break; /* ex: "addl %eax, %ecx" */
    case 0xA:
    case 0xB:
    case 0xF:
      printf(" ");
      print_register(register1);
      break; /* ex: "pushl %eax" */
    case 0x3:
    case 0xC:
      printf(" $%05d, ", immediate);
      print_register(register2);
      break; /* ex: irmovl $216, %eax */
    case 0x7:
    case 0x8:
      printf(" %05u", memory_address);
      break; /* ex: "call 00200" */
    case 0x4:
      printf(" ");
      print_register(register1);
      printf(", ");
      if (displacement)
        printf("%05u", displacement);
      printf("(");
      print_register(register2);
      printf(")");
      break; /* ex: "rmmovl %ebx, 12(%eax)" */
    case 0x5:
      if (displacement)
        printf(" %05u(", displacement);
      print_register(register1);
      printf("), ");
      print_register(register2);
      break; /* ex: "mrmovl 00004(%ebp), %esi" */
  }
  
  return 1;
}

/* disassemble takes an array of memory instructions and prints these
   instructions in order, preceded by the corresponding memory address
   (beginning at 0x000 and incrememting by 4 bytes each time).
   The program_size parameter indicates how many instructions should be printed.
   Returns the number of valid instructions printed.
   Invalid instructions are printed as their memory address in hex ("0x000")
   followed by a blank space and new line. Possible output could be:
     0x000: rrmovl %ebx, %esp
     0x004: andl %ebx, %esp
     0x008 
     0x00c: halt */
int disassemble (const unsigned int program[], int program_size) {
  int counter = 0;
  int invalid = 0; /* number of invalid instructions */
  if (program_size < 0 || program_size > 4095) /* 4095 is max program size */
    return 0;
  while (counter < program_size) {
    printf("0x%03x", 4 * counter);
    if (valid_instruction(program[counter])) {
      printf(": ");
      print_instruction(program[counter]);
    }
    else {
      invalid++;
      printf(" ");
    }
    counter++;
    printf("\n");
  }
  return program_size - invalid;
}

/* valid_instruction returns 1 if the instruction represented by memory_word
   is valid and 0 otherwise. Reasons for being invalid:
   1) Invalid opcode (first byte)
   2) Invalid register number (not 0-7)
   3) Memory address greater than 4095
   4) Memory address not divisible by 4 */
int valid_instruction(unsigned int memory_word) {
  int valid = 1;
  unsigned int first_byte = memory_word >> 24 & 0xFF;
  unsigned int first_hex_digit = first_byte >> 4 & 0xF;
  unsigned int second_hex_digit = first_byte & 0xF; /* 1st 4 bits of 2nd byte */
  unsigned int register1 = memory_word >> 20 & 0xF; /* 2nd 4 bits of 2nd byte */
  unsigned int register2 = memory_word >> 16 & 0xF; /* last two bytes */
  unsigned int memory_address = memory_word & 0xFFFFFF; /* last three bytes */
  
  /* check if first byte command is valid */
  switch (first_hex_digit) {
  case 0xE: valid = 0; break;
  case 2:
  case 6:
  case 7:
    if (second_hex_digit > 6)
      valid = 0;
    break;
  case 0xF:
    if (second_hex_digit > 3)
      valid = 0;
    break;
  default:
    if (second_hex_digit)
      valid = 0;
  }

  /* check if registers and memory addresses are valid where applicable */
  switch (first_hex_digit) {
    case 2:
    case 4:
    case 5:
    case 6:
      if (register2 > 7)
	valid = 0;
      /* fall thru */
    case 0xA:
    case 0xB:
    case 0xF:
      if (register1 > 7)
	valid = 0;
      break;
    case 3:
    case 0xC:
      if(register2 > 7)
	valid = 0;
      break;
    case 0x7:
    case 0x8:
      if(memory_address % 4 || memory_address > 4095)
	valid = 0;
      break;
  }
  return valid;
}

/* print_register takes a register number 0-7 and prints its corresponding
   text representations, such as "%eax" for register 0
   Returns 0 if invalid register number and 1 otherwise. */
static int print_register(unsigned int register_num) {
  printf("%%e");
  switch (register_num) {
    case 0: printf("ax"); break;
    case 1: printf("cx"); break;
    case 2: printf("dx"); break;
    case 3: printf("bx"); break;
    case 4: printf("sp"); break;
    case 5: printf("bp"); break;
    case 6: printf("si"); break;
    case 7: printf("di"); break;
    default: return 0;
  }

  return 1;
}
