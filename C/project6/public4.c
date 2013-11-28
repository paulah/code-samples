/*
 * CMSC 216, Spring 2013, Project #6
 * Public test 4 (public04.c)
 *
 * Sorts an array of strings, that are in no particular order, with 2
 * threads.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mergesort.h"

#define SZ 6

static int cmp(const void *a, const void *b);

int cmp(const void *a, const void *b) {
  return strcmp(* (char * const *) a, * (char * const *) b);
}

int main() {
  char *original[SZ]= {"hippo", "elephant", "rhino", "monkey", "aardvark",
                       "narwhal"};
  char *sorted[SZ];
  int i, correct= 1;

  memmove(sorted, original, sizeof(original));
  qsort(sorted, sizeof(sorted) / sizeof(*sorted), sizeof(*sorted), cmp);

  threaded_mergesort(&original[0], sizeof(original) / sizeof(*original),
                       sizeof(*original), cmp, 2);

  for (i= 0; i < sizeof(original) / sizeof(*original); i++)
    if (original[i] != sorted[i]) {
      printf("Incorrect- after sorting, arr[%d] is %s, but should be %s.\n",
             i, original[i], sorted[i]);
      correct= 0;
    }

  if (correct)
    printf("Array is correctly sorted!\n");

  return 0;
}
