/*
 * CMSC 216, Spring 2013, Project #6
 * Public test 7 (public07.c)
 *
 * Sorts an array of longs, that are in no particular order, with 4 threads.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mergesort.h"

#define SZ 20

static int cmp(const void * a, const void * b);

int cmp(const void * a, const void * b) {
  long *x= (long *) a;
  long *y= (long *) b;

  if (*x > *y)
    return 1;
  else
    if (*x == *y)
      return 0;
    else return -1;
}

int main() {
  long original[SZ]= {3, 2, 47, 12, 26, 42, 6, 10, 16, 5, 10, 36, 9, 34, 38,
                      11, 20, 22, 18, 32};
  long sorted[SZ];
  int i, correct= 1;

  memmove(sorted, original, sizeof(original));
  qsort(sorted, sizeof(sorted) / sizeof(*sorted), sizeof(*sorted), cmp);

  threaded_mergesort(original, sizeof(original) / sizeof(*original),
                     sizeof(*original), cmp, 4);

  for (i= 0; i < sizeof(original) / sizeof(*original); i++)
    if (original[i] != sorted[i]) {
      printf("Incorrect- after sorting, arr[%d] is %ld, but should be %ld.\n",
             i, original[i], sorted[i]);
      correct= 0;
    }

  if (correct)
    printf("Array is correctly sorted!\n");

  return 0;
}
