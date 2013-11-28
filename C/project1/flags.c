/* Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * CMSC216 Section 0202
 *
 * I pledge on my honor that I have neither given nor
 * received any unauthorized assistance on this assignment.
 */

#include <stdio.h>
#include "flags.h"

/* flags.c  contains methods to fill a 2D array with characters that create a
graphical representation of the flags of Luxembourg, Romania, Sweden, and
the Czech Republic. Flag width and sizes of flag parts are calculated using
given ratios relative to the height parameter.

An entirely red 2x2 flag would be represented as: RR
                                                  RR

The print_flag method displays the flag array using printf.

Methods return 1 if they have executed successfully, and 0 otherwise.

The compare_flags returns 1 if the two flag arrays have equal corresponding
elements within the given dimensions.
 */

/* Luxembourg specifications: height divisible by 3, height:width = 3:5
   Evenly spaced R, W, and B horizontal stripes. */

int create_luxembourg(char flag[][MAX], int height) {
  /* width is set by ratio */
  int width = height * 5 / 3;
  int i, j;

  /* ensure that height is positive, less than MAX, and divisible by 3 */
  if( height % 3 || width > MAX || height < 1 )
     return 0;
  
  /* create R, W and B horizontal stripes */
  for( i = 0; i < height / 3; i++ )
    for( j = 0; j < width; j++ )
      flag[i][j] = 'R';
  for( i = i; i < height / 3 * 2; i++ ) /* i=i prevents compiler warning*/
    for( j = 0; j < width; j++ )
      flag[i][j] = 'W';
  for( i = i; i < height; i++ )
    for( j = 0; j < width; j++ )
      flag[i][j] = 'B';
  
  return 1;
}

/* Romania specifications: height divisible by 2, height:width = 2:3
   Evenly spaced B, Y, and R vertical stripes. */

int create_romania(char flag[][MAX], int height) {
  int width = height * 3 / 2;
  int i, j;
  
  /* height must be positive, less than MAX, and divisible by 2 */
  if( height % 2 || width > MAX || height < 1 )
    return 0;
  
  /* fill the rows with even B, Y, and R creating vertical stripes */
  for( i = 0; i < height; i++ ) {
    for( j = 0; j < width / 3; j++ )
      flag[i][j] = 'B';
    for( j = j; j < width / 3 * 2; j++ )
      flag[i][j] = 'Y';
    for( j = j; j < width; j++ )
      flag[i][j] = 'R';
  }

  return 1;
}

/* Sweden specifications: height divisible by 5, height:width = 5:8
   B with Y cross. Cross thickness is 1/5 of flag height.
   Horizontal arm is centered, vertical arm is positioned 1/4 from the left.
 */

int create_sweden(char flag[][MAX], int height) {
  int width = height * 8 / 5;
  int i, j;

  if( height % 5 || width > MAX || height < 1 )
    return 0;
  
  /* initially fill whole flag with B */
  for( i = 0; i < height; i++ )
    for( j = 0; j < width; j++ )
      flag[i][j] = 'B';
  
  /* create horizontal Y stripe */
  for( i = height * 2 / 5; i < height * 3 / 5; i++ )
    for( j = 0; j < width; j++ )
      flag[i][j] = 'Y';
  
  /* create vertical Y stripe */
  for( i = 0; i < height; i++ )
    for( j = width / 4; j < width * 3 / 8; j++ )
      flag[i][j] = 'Y';
  
  return 1;
}

/* Czechoslovakia specifications: height divisible by 6, height:width = 2:3
   Top half W, bottom half R, with a B isosceles triangle flush with the left
   side. (The hypotenuse of the flag is the length of the height.) */
   
int create_czechoslovakia(char flag[][MAX], int height) {
  int width = height * 3 / 2;
  int i, j, k = 0;

  if( height % 6 || width > MAX || height < 1 )
     return 0;

  /* fill top half with W, bottom half with R */
  for( i = 0; i < height / 2; i++ )
    for(j = 0; j < width; j++)
      flag[i][j] = 'W';
  for( i = i; i < height; i++ )
    for( j = 0; j < width; j++ )
      flag[i][j] = 'R';
  
  /* fill the top half of the B triangle */
  /* k increments the number of B's placed in each row */
  for( i = 0; i < height / 2; i++ ) {
    k++;
    for( j = 0; j < k; j++ )
      flag[i][j] = 'B';
  }
  
  /* fill the bottom half of the B triangle */
  /* k decrements the number of B's placed in each row */
  for( i = height / 2; i < height; i++ ) {
    for( j = 0; j < k; j++ )
      flag[i][j] = 'B';
    k--;
  }

  return 1;
}

/* displays the elements of the flag array within the given height and width
   using printf */

int print_flag(char flag[][MAX], int height, int width) {
  int i, j;

  if( height > MAX || width > MAX || height < 1 || width < 1 )
    return 0;
  
  for( i = 0; i < height; i++ ) {
    for( j = 0; j < width; j++ )
      printf("%c", flag[i][j]);
    printf("\n");
  }

  return 1;
}

/* returns 1 if the two flag parameters have the same characters within the
   given width and height parameters, otherwise returns 0 */

int compare_flags(char flag1[][MAX], char flag2[][MAX], int height,
                  int width) {
  int i, j;

  if(height > MAX || width > MAX || height < 1 || width < 1)
    return 0;
  
  /* if the elements are unequal at any time during the loop,
     the function will return 0 */
  for(i = 0; i < height; i++)
    for(j = 0; j < width; j++)
      if(flag1[i][j] != flag2[i][j])
	 return 0;
  
  /* no unequal elements have been found if this line is being executed */
  return 1;
}
