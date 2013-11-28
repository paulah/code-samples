/*
 * CMSC 216, Spring 2013, Project #6
 * Public test 5 (public05.c)
 *
 * Sorts an array of doubles, that are in no particular order, with 2
 * threads.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mergesort.h"

#define SZ 4

static int cmp(const void * a, const void * b);

int cmp(const void * a, const void * b) {
  double *x= (double *) a;
  double *y= (double *) b;

  if (*x > *y)
    return 1;
  else
    if (*x == *y)
      return 0;
    else return -1;
}

int main() {
  double original[SZ]= {3.14, 4.000001, 2.71, 3.999999};
  double sorted[SZ];
  int i, correct= 1;

  memmove(sorted, original, sizeof(original));
  qsort(sorted, sizeof(sorted) / sizeof(*sorted), sizeof(*sorted), cmp);

  threaded_mergesort(&original[0], sizeof(original) / sizeof(*original),
                     sizeof(*original), cmp, 2);

  for (i= 0; i < sizeof(original) / sizeof(*original); i++)
    if (original[i] != sorted[i]) {
      printf("Incorrect- after sorting, arr[%d] is %f, but should be %f.\n",
             i, original[i], sorted[i]);
      correct= 0;
    }

  if (correct)
    printf("Array is correctly sorted!\n");

  return 0;
}
