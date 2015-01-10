/*
 * Filename: main.c
 * Author: Wenhui Tang
 * Userid: cs30xlv
 * Description: The driver for this program. Prints a diamond by entering
 *              arguments in the command line. Prints error messages to stderr
 *              if the user enters an invalid value. 
 * Date: Oct. 16, 2013
 */

#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include "pa1.h"

/*
 * Function name: main()
 * Function prototype: int main( int argc, char *argv[] );
 * Description: C main driver which calls C and SPARC assembly routines to 
 *              print a diamond using the width, height, and ASCII characters
 *              specified by the user.
 * Parameters: width - the width of the border 
 *             height - the height of the diamond
 *             border_ch - the ASCII character of the border 
 *             diamond_ch - the ASCII character of the diamond
 * Side Effects: Outputs a diamond within a square border
 * Error Conditions: Width not within the range 3 - 21
 *                   Width not odd
 *                   Height not within the range 1 - 19
 *                   Height not odd
 *                   Height not less than width
 *                   border_ch not ASCII code within range 33 - 126
 *                   diamond_ch not ASCII code within range 33 - 126
 *                   border_ch and diamond_ch not different
 *                   inputted number too large 
 *                   input not an integer
 * Return Value: 0 indicating successful execution.
 */

int main( int argc, char *argv[]) {
  int diamond = 1;
  if( argc != 5 ) {
    printf("\nUsage: %s width height border_ch diamond_ch \n", "./pa1");
    printf("    width      (must be odd within the range of [%d - %d])\n", 
                                              WIDTH_MIN, WIDTH_MAX);
    printf("    height     (must be odd within the range of [%d - %d])\n",
                                              HEIGHT_MIN, HEIGHT_MAX);
    printf("               (must be less than width)\n");
    printf("    border_ch  (must be an ASCII value within the range");
    printf(" [%d - %d])\n", ASCII_MIN, ASCII_MAX);
    printf("               (must be different than diamond_ch)\n");
    printf("    diamond_ch (must be an ASCII value within the range");
    printf(" [%d - %d])\n", ASCII_MIN, ASCII_MAX);  
    printf("               (must be different than border_ch)\n");
    printf("\n");                
    return ( 0 );
  }

  long width = strToLong(argv[1], BASE);
  if( errno == 0 ) {
    if( checkRange(width, WIDTH_MIN, WIDTH_MAX) == 0 ) {
      (void)fprintf(stderr, "\n\twidth(%ld) must be within the range of",
                                                                   width);
      (void)fprintf(stderr, " [%d - %d])\n", WIDTH_MIN, WIDTH_MAX);
      diamond = 0;
    }
    if( isOdd( width ) == 0 ) {
      (void)fprintf(stderr, "\n\twidth(%ld) must be an odd number.\n", width);
      diamond = 0;
    }
  }

  long height = strToLong(argv[2], BASE);
  if( errno == 0 ) {
    if( checkRange(height, HEIGHT_MIN, HEIGHT_MAX) == 0 ) {
      (void)fprintf(stderr, "\n\theight(%ld) must be within the range of",
                                                                 height);
      (void)fprintf(stderr, " [%d - %d]\n", HEIGHT_MIN, HEIGHT_MAX);
      diamond = 0;
    }
    if( isOdd( height ) == 0 ) {
      (void)fprintf(stderr, "\n\theight(%ld) must be an odd number.\n", height);
      diamond = 0;
    }
    if( height >= width ) {
      (void)fprintf(stderr, "\n\theight(%ld) must be less than width(%ld)\n",
                                                           height, width);
      diamond = 0;
    }
  }

  long border_ch = strToLong(argv[3], BASE);
  if( errno == 0 ) {
    if( checkRange(border_ch, ASCII_MIN, ASCII_MAX) == 0 ) {
      (void)fprintf(stderr, "\n\tborder_ch(%ld) must be an ASCII code",
                                                             border_ch);
      (void)fprintf(stderr, " in the range [%d - %d]\n", ASCII_MIN, ASCII_MAX);
      diamond = 0;
    }
  }

  long diamond_ch = strToLong(argv[4], BASE);
  if( errno == 0 ) {
    if( checkRange(diamond_ch, ASCII_MIN, ASCII_MAX) == 0 ) {
      (void)fprintf(stderr, "\n\tdiamond_ch(%ld) must be an ASCII code ",
                                                             diamond_ch);
      (void)fprintf(stderr, "in the range [%d - %d]\n", ASCII_MIN, ASCII_MAX);
      diamond = 0;
    }

  }
    

  if( border_ch == diamond_ch) {
    (void)fprintf(stderr, "\n\tborder_ch(%ld) and ", border_ch);
    (void)fprintf(stderr, "diamond_ch(%ld) must be different\n\n", diamond_ch);
    diamond = 0;
  }



  if( diamond != 0 ) {
    displayDiamond(width, height, border_ch, diamond_ch);
  }

  return ( 0 );

}

