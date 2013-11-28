/* Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * CMSC216 Section 0202
 *
 * I pledge on my honor that I have neither given nor
 * received any unauthorized assistance on this assignment.
 */

/* mergesort sorts a generic array using the mergesort algorithm
(dividing the array into one element arrays and then merging these
subarrays together).
threaded_mergesort sorts the array using 0, 1, 2, or 4 threads
(in addition to the main thread). */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <err.h>
#include <sysexits.h>
#include "mergesort.h"
#include <pthread.h>

 /* structure used to pass parameters to child threads */
typedef struct args {
  void *arr;
  int num_elts, elt_size;
  Compare_fn cmp;
} Args;

/* prototypes */
static void merge(void *arr, int num_elts_a, int num_elts_b,
                  int elt_size, Compare_fn cmp);
static void *mergesort_helper(void *args);

/* mergesort sorts the elements of a given generic array,
elt_size is in bytes */
void mergesort(void *arr, int num_elts, int elt_size, Compare_fn cmp) {
  int first_half_count, second_half_count;

  if (arr != NULL && cmp != NULL && num_elts > 1) {
    first_half_count= num_elts / 2;
    second_half_count= num_elts - first_half_count;

    /* call recursively on first half of array */
    mergesort(arr, first_half_count, elt_size, cmp);
    /* call recursively on second half of array; note use of char pointer in
       order to be able to do pointer arithmetic with the parameter arr */
    mergesort((char *) arr + (first_half_count * elt_size), second_half_count,
              elt_size, cmp);

    /* merge the two sorted array halves into one beautiful sorted whole */
    merge(arr, first_half_count, second_half_count, elt_size, cmp);
  }
}

/* merge together two halves of a sorted array into a single sorted array */
static void merge(void *arr, int num_elts_a, int num_elts_b, int elt_size,
                  Compare_fn cmp) {
  char *a_ptr= arr, *b_ptr, *temp_arr, *cur_last_elt;
  int total_elem= num_elts_a + num_elts_b;

  /* the straightforward implementation of merge uses an auxiliary array to
     do the merging, of the same size as the input array, so create it here */
  temp_arr= malloc(total_elem * elt_size);
  if (temp_arr == NULL)
    err(EX_OSERR, "error allocating temp_arr");

  /* a_ptr will traverse down the first half of the array, while b_ptr will
     traverse down the second half; note these are both char pointers, in
     order to be able to do pointer arithmetic with them */
  b_ptr= a_ptr + (elt_size * num_elts_a);
  /* cur_last_elt will indicate where the next element to be added to the
     temporary array should be placed */
  cur_last_elt= temp_arr;

  /* while both halves of the array still have elements to be merged */
  while (num_elts_a > 0 && num_elts_b > 0) {
    /* test the first element of the first half of the array and the first
       element of the second half, to see which is smaller */
    if (cmp(a_ptr, b_ptr) < 0) {
      /* if the first element in the first half is smaller, copy it to the
         temporary array */
      memmove(cur_last_elt, a_ptr, elt_size);
      a_ptr += elt_size;
      num_elts_a--;
    } else {
      /* if the first element in the second half is smaller, copy it */
      memmove(cur_last_elt, b_ptr, elt_size);
      b_ptr += elt_size;
      num_elts_b--;
    }
    cur_last_elt += elt_size;
  }

  /* if there are any remaining elements in either half of the array, copy
     them to the temporary array (note that at least one of these calls will
     be on zero bytes and do nothing, because the loop above stops when
     either num_elts_a or num_elts_b is zero, although both could reach zero
     simultaneously */
  memmove(cur_last_elt, a_ptr, elt_size * num_elts_a);
  memmove(cur_last_elt, b_ptr, elt_size * num_elts_b);

  /* lastly copy the temporary array back to the input array, and free the
     temporary array */
  memmove(arr, temp_arr, elt_size * total_elem);
  free(temp_arr);
}

/* threaded_mergesort takes an array and sorts it using 0, 1, 2, or 4 threads
   based on the parameter num_threads */
void threaded_mergesort(void *arr, int num_elts, int elt_size,
			Compare_fn cmp, int num_threads) {
  pthread_t tid, tid2, tid3, tid4;
  Args *arg, *arg2, *arg3, *arg4;

  if ( !(num_threads == 0 || num_threads == 1 || num_threads == 2 ||
	 num_threads == 4) || arr == NULL || cmp == NULL)
    return;

  if (num_threads == 0) /* no additional threads */
    mergesort(arr, num_elts, elt_size, cmp);

  if (num_threads == 1) {
    arg = malloc(sizeof(Args));
    if (arg == NULL)
      err(EX_OSERR, "Memory allocation failed!");
    
    arg->arr = arr;
    arg->num_elts = num_elts;
    arg->elt_size = elt_size;
    arg->cmp = cmp;

    if (pthread_create(&tid, NULL, mergesort_helper, arg) != 0)
      err(EX_OSERR, "pthread_create() failed");
    
    if (pthread_join(tid, NULL) != 0)
      err(EX_OSERR, "pthread_join() failed");

    free(arg);
  }

  if (num_threads == 2) { /* 2 threads, each sorts half the array */
    arg = malloc(sizeof(Args));
    if (arg == NULL)
      err(EX_OSERR, "Memory allocation failed!");
    
    arg->arr = arr;
    arg->num_elts = num_elts / 2;
    arg->elt_size = elt_size;
    arg->cmp = cmp;

    if (pthread_create(&tid, NULL, mergesort_helper, arg) != 0)
      err(EX_OSERR, "pthread_create() failed");
    
    arg2 = malloc(sizeof(Args));
    if (arg == NULL)
      err(EX_OSERR, "Memory allocation failed!");
    
    arg2->arr = (char *)arr + elt_size * (num_elts / 2); /* char has byte size
			        1, allows us to perform pointer arithmetic */
    arg2->num_elts = num_elts - num_elts / 2; /* not just num_elts/2, in case
					       there's an odd number */
    arg2->elt_size = elt_size;
    arg2->cmp = cmp;

    if (pthread_create(&tid2, NULL, mergesort_helper, arg2) != 0)
      err(EX_OSERR, "pthread_create() failed");

    if (pthread_join(tid, NULL) != 0)
      err(EX_OSERR, "pthread_join() failed");

    if (pthread_join(tid2, NULL) != 0)
      err(EX_OSERR, "pthread_join() failed");

    merge(arr, (num_elts / 2), (num_elts - num_elts / 2), elt_size, cmp);

    free(arg);
    free(arg2);
  }

  if (num_threads == 4) { /* each thread sorts a fourth of the array */
    arg = malloc(sizeof(Args));
    if (arg == NULL)
      err(EX_OSERR, "Memory allocation failed!");
    
    arg->arr = arr;
    arg->num_elts = num_elts / 4;
    arg->elt_size = elt_size;
    arg->cmp = cmp;

    if (pthread_create(&tid, NULL, mergesort_helper, arg) != 0)
      err(EX_OSERR, "pthread_create() failed");
    
    arg2 = malloc(sizeof(Args));
    if (arg2 == NULL)
      err(EX_OSERR, "Memory allocation failed!");
    
    arg2->arr = (char *)arr + elt_size * (num_elts / 4);
    arg2->num_elts = (2 * num_elts) / 4 - num_elts / 4;
    arg2->elt_size = elt_size;
    arg2->cmp = cmp;

    if (pthread_create(&tid2, NULL, mergesort_helper, arg2) != 0)
      err(EX_OSERR, "pthread_create() failed");

    arg3 = malloc(sizeof(Args));
    if (arg3 == NULL)
      err(EX_OSERR, "Memory allocation failed!");
    
    arg3->arr = (char *)arr + elt_size * ((2 * num_elts) / 4);
    arg3->num_elts = (3 * num_elts) / 4 - ((2 * num_elts) / 4);
    arg3->elt_size = elt_size;
    arg3->cmp = cmp;

    if (pthread_create(&tid3, NULL, mergesort_helper, arg3) != 0)
      err(EX_OSERR, "pthread_create() failed");

    arg4 = malloc(sizeof(Args));
    if (arg4 == NULL)
      err(EX_OSERR, "Memory allocation failed!");
    
    arg4->arr = (char *)arr + elt_size *
      ((3 * num_elts) / 4);
    arg4->num_elts = num_elts - ((3 * num_elts) / 4);
    arg4->elt_size = elt_size;
    arg4->cmp = cmp;

    if (pthread_create(&tid4, NULL, mergesort_helper, arg4) != 0)
      err(EX_OSERR, "pthread_create() failed");

    if (pthread_join(tid, NULL) != 0)
      err(EX_OSERR, "pthread_join() failed");

    if (pthread_join(tid2, NULL) != 0)
      err(EX_OSERR, "pthread_join() failed");

    if (pthread_join(tid3, NULL) != 0)
      err(EX_OSERR, "pthread_join() failed");

    if (pthread_join(tid4, NULL) != 0)
      err(EX_OSERR, "pthread_join() failed");

    /* merge two quarters into halves */
    merge(arr, (num_elts / 4),
	  (2 * num_elts) / 4 - num_elts / 4, elt_size, cmp);
    merge((char *)arr + elt_size * ((2 * num_elts) / 4),
	  (3 * num_elts) / 4 - ((2 * num_elts) / 4),
	  num_elts - ((3 * num_elts) / 4), elt_size, cmp);

    /* merge two halves together */
    merge(arr, (num_elts / 2), num_elts - (num_elts / 2), elt_size, cmp);

    free(arg);
    free(arg2);
    free(arg3);
    free(arg4);
  }
}

/* this is the function passed to the threads */
static void *mergesort_helper(void *args) {
  Args *arg = (Args *)args;
  if (args != NULL)
    mergesort(arg->arr, arg->num_elts, arg->elt_size, arg->cmp);
  return NULL;
}
