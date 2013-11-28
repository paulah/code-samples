/* Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * CMSC216 Section 0202
 *
 * I pledge on my honor that I have neither given nor
 * received any unauthorized assistance on this assignment.
 */

/* mergetest times how long mergesort takes to sort an array with
   0, 1, 2, and 4 threads. displays wall, user, system, time in seconds */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <unistd.h>
#include "mergesort.h"

int cmp(const void * a, const void * b);
static struct timeval tv_delta(struct timeval start, struct timeval end);

/* takes command line parameters. 1st parameter: number of integers in array
2nd parameter: seed for random number generator
3rd parameter: maximum random integer value, exclusive */
int main(int argc, char *argv[]) {
  int n, seed, m, i;
  int *arr;
  double wall, user, system;
  struct rusage start_ru, end_ru;
  struct timeval start_wall, end_wall, wdiff, udiff, sdiff;
  int thread_num;
  for (thread_num = 0; thread_num <=4;
       (thread_num == 2 ? thread_num = thread_num + 2: thread_num++)) {
            /* skip 3 threads */
    if (argc == 4) { /* remember arg[0] is name of executable */
    
      n = atoi(argv[1]);
      seed = atoi(argv[2]);
      m = atoi(argv[3]);
      
      arr = malloc(n * sizeof(int));
      
      srand(seed);
      for (i = 0; i < n; i++)
	arr[i] = rand() % m;
    }
    
    gettimeofday(&start_wall, NULL);
    getrusage(RUSAGE_SELF, &start_ru);
    
    threaded_mergesort(arr, n, 4, cmp, thread_num);
    
    gettimeofday(&end_wall, NULL);
    getrusage(RUSAGE_SELF, &end_ru);
    
    wdiff = tv_delta(start_wall, end_wall);
    udiff = tv_delta(start_ru.ru_utime, end_ru.ru_utime);
    sdiff = tv_delta(start_ru.ru_stime, end_ru.ru_stime);
    
    wall = wdiff.tv_sec + wdiff.tv_usec * .000001;
    user = udiff.tv_sec + udiff.tv_usec * .000001;
    system = sdiff.tv_sec + sdiff.tv_usec * .000001;
    
    free(arr);
    printf("%d threads: %fs wall; %fs user; %fs sys\n",
	   thread_num, wall, user, system);
  }

  return 0;
}

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

/* compute the time difference between two struct timeval's */
static struct timeval tv_delta(struct timeval start, struct timeval end) {
  struct timeval delta = end;
  delta.tv_sec -= start.tv_sec;
  delta.tv_usec -= start.tv_usec; /* usec is 10^-6 seconds */
  if (delta.tv_usec < 0) {
    delta.tv_usec += 1000000;
    delta.tv_sec--;
  }
  return delta;
}
