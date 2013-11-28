#include <stdio.h>

int main() {
  int arr[100], n, num= 0, i, j, x;

  scanf("%d", &n);
  while (n != 0 && num < 100) {
    arr[num]= n;
    num++;
    scanf("%d", &n);
  }

  /* insertion sort */
  for (i= 1; i < num; i++) {
    j= i;
    x= arr[i];

    while (j > 0 && x < arr[j - 1]) {
      arr[j]= arr[j - 1];
      j--;
    }

    arr[j]= x;
  }

  /* print array */
  for (i= 0; i < num; i++)
    printf("%d ", arr[i]);
  printf("\n");

  return 0;
}
