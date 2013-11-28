/*
 * CMSC 216, Spring 2013, Project #6
 * Public test 3 (public03.c)
 *
 * Sorts an array of characters, that are in no particular order, with 1
 * thread.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mergesort.h"

#define SZ 8

static int cmp(const void * a, const void * b);

int cmp(const void * a, const void * b) {
  char *x= (char *) a;
  char *y= (char *) b;

  if (*x > *y)
    return 1;
  else
    if (*x == *y)
      return 0;
    else return -1;
}

int main() {
  char original[SZ]= {'b', 'a', 'g', 'e', 'c', 'h', 'f', 'd'};
  char sorted[SZ];
  int i, correct= 1;

  memmove(sorted, original, sizeof(original));
  qsort(sorted, sizeof(sorted) / sizeof(*sorted), sizeof(*sorted), cmp);

  threaded_mergesort(original, sizeof(original) / sizeof(*original),
                     sizeof(*original), cmp, 1);

  for (i= 0; i < sizeof(original) / sizeof(*original); i++)
    if (original[i] != sorted[i]) {
      printf("Incorrect- after sorting, arr[%d] is %c, but should be %c.\n",
             i, original[i], sorted[i]);
      correct= 0;
    }

  if (correct)
    printf("Array is correctly sorted!\n");

  return 0;
}
