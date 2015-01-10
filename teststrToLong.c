/*
 * Filename: teststrToLong.c
 * Author: Wenhui Tang
 * Userid: cs30xlv
 * Description: Unit test program to test the function strToLong.
 * Date: Oct. 16, 2013
 */ 

#include "pa1.h"	/* For strToLong() function prototype */
#include "test.h"	/* For TEST() macro and stdio.h */
#include <errno.h>


/*
 * long strToLong( char *str, int base )
 *
 * Converts the passed in string into a long in the given base
 * prints error messages to stderr if number too large or if not an integer
 *
 */

void
teststrToLong()
{
    printf( "Testing strToLong()\n" );

    TEST( strToLong( "17", 10 ) == 17 );
    TEST( strToLong( "101", 2 ) == 5 );
    TEST( strToLong( "a", 16 ) == 10 );
    strToLong( "123abc", 10 );
    TEST( errno != 0 );
    TEST( strToLong( "0", 2 ) == 0 );
    TEST( errno == 0 );
    strToLong( "999999999999999", 10 );
    TEST( errno != 0 );
    TEST( strToLong( "500", 10 ) == 500 );
    TEST( errno == 0 );
    strToLong( "30", 2 );
    TEST( errno != 0 ); 
    TEST( strToLong( "44", 8 ) == 36 );


    printf( "Finished running tests on checkRange()\n" );
}

int
main()
{
    teststrToLong();

    return 0;
}
