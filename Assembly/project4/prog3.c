#include <stdio.h>

int main() {
  char s[101], t[101];
  int i, j, found= -1;

  i= 0;
  do {
    scanf("%c", &s[i]);
  } while (s[i++] != '\n');
  s[i - 1]= '\0';

  i= 0;
  do {
    scanf("%c", &t[i]);
  } while (t[i++] != '\n');
  t[i - 1]= '\0';

  i= 0;
  while (s[i] != '\0' && found == -1) {

    j= 0;
    while (s[i + j] != '\0' && t[j] != '\0' && s[i + j] == t[j])
      j++;

    if (t[j] == '\0')
      found= i;
    else i++;
  }

  printf("%d\n", found);

  return 0;
}
