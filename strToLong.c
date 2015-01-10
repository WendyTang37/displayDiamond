/*
 * Filename: strToLong.c
 * Author: Wenhui Tang
 * Userid: cs30xlv
 * Description: Converts the argument string to a long int
 *              in specified base and prints to stderr if it encounters
 *              conversion errors 
 * Date: Oct. 16, 2013
 */

#include <stdlib.h>
#include <errno.h>
#include <stdio.h>
#include "pa1.h"

long strToLong( char *str, int base ) {
  errno = 0;

  char *endptr;

  long num = strtol( str, &endptr, base );

  if( errno != 0 ) {
    char errMsg[BUFSIZ];
    (void)snprintf(errMsg, BUFSIZ, "\n\tConverting \"%s\" base \"%d\"", 
                   str, base);
    perror(errMsg);
  }

  if( *endptr != '\0') {
    (void)fprintf(stderr, "\n\t\"%s\" is not an integer\n", str);
    errno = 1;
  }
  return num;
}

