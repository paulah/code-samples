/*
 * CMSC 216, Spring 2013, Project #6
 * Public test 1 (public01.c)
 *
 * Sorts an array of integers, that are in no particular order, with no
 * threads (this should just be calling the nonthreaded mergesort).
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mergesort.h"

#define SZ 10

static int cmp(const void * a, const void * b);

int cmp(const void * a, const void * b) {
  int *x= (int *) a;
  int *y= (int *) b;

  if (*x > *y)
    return 1;
  else
    if (*x == *y)
      return 0;
    else return -1;
}

int main() {
  int original[SZ]= {9, 8, 7, 6, 5, 4, 3, 2, 1, 0};
  int sorted[SZ];
  int i, correct= 1;

  memmove(sorted, original, sizeof(original));
  qsort(sorted, sizeof(sorted) / sizeof(*sorted), sizeof(*sorted), cmp);

  threaded_mergesort(&original[0], sizeof(original) / sizeof(*original),
                     sizeof(*original), cmp, 0);

  for (i= 0; i < sizeof(original) / sizeof(*original); i++)
    if (original[i] != sorted[i]) {
      printf("Incorrect- after sorting, arr[%d] is %d, but should be %d.\n",
             i, original[i], sorted[i]);
      correct= 0;
    }

  if (correct)
    printf("Array is correctly sorted!\n");

  return 0;
}
