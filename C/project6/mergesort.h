#if !defined(MERGESORT_H)
#define MERGESORT_H

typedef int (*Compare_fn)(const void *, const void *);

void mergesort(void *arr, int num_elts, int elt_size, Compare_fn cmp);
void threaded_mergesort(void *arr, int num_elts, int elt_size, Compare_fn cmp,
                        int num_threads);

#endif
