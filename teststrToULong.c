/*
 * Filename: teststrToULong.c
 * Author: Wenhui Tang
 * Userid: cs30xlv
 * Description: Unit test program to test the function strToULong.
 * Date: Oct. 30, 2013
 */ 

#include "pa2.h"	/* For strToLong() function prototype */
#include "test.h"	/* For TEST() macro and stdio.h */
#include <errno.h>


/*
 * unsigned long strToULong( char *str, int base )
 *
 * Converts the passed in string into a long in the given base
 * prints error messages to stderr if number too large or if not an integer
 *
 */

void
teststrToULong()
{
    printf( "Testing strToULong()\n" );

    TEST( strToULong( "17", 0 ) == 17 );

    printf( "Finished running tests on strToULong()\n" );
}

int
main()
{
    teststrToULong();

    return 0;
}
