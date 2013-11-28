#include <stdio.h>

int binary_search(int arr[], int n, int low, int high);

int main() {
  int arr[100], n, num= 0, x;

  scanf("%d", &n);
  while (n != 0 && num < 100) {
    arr[num]= n;
    num++;
    scanf("%d", &n);
  }

  scanf("%d", &x);

  printf("%d\n", binary_search(arr, x, 0, num - 1));

  return 0;
}

/* precondition: arr is in increasing sorted order */
int binary_search(int arr[], int n, int low, int high) {
  int mid;

  if (low > high)
    return -1;
  else {

    mid= (low + high) / 2;

    if (n == arr[mid])
      return mid;
    else
      if (n < arr[mid])
        return binary_search(arr, n, low, mid - 1);
      else return binary_search(arr, n, mid + 1, high);

  }
}
