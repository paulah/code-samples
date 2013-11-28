#include <stdio.h>

int main() {
  int x, y, i, result= 1;

  scanf("%d", &x);
  scanf("%d", &y);

  if (y > 0)
    for (i= 0; i < y; i++)
      result *= x;

  printf("%d\n", result);

  return 0;
}
