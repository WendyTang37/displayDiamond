/*
 * Filename: testisOdd.c
 * Author: Wenhui Tang
 * Userid: cs30xlv
 * Description: Unit test program to test the function isOdd.
 * Date: Oct. 16, 2013
 */ 

#include "pa1.h"	/* For isOdd() function prototype */
#include "test.h"	/* For TEST() macro and stdio.h */


/*
 * int isOdd( long num );
 *
 * Returns a non-zero number if value is odd
 * Returns 0 otherwise.
 */

void
testisOdd()
{
    printf( "Testing isOdd()\n" );

    TEST( isOdd( 2 ) == 0 );
    TEST( isOdd( 0 ) != 0 );
    TEST( isOdd( 4 ) == 0 );

    TEST( isOdd( -90 ) == 0 );
    TEST( isOdd( -99 ) != 0 );
    TEST( isOdd( -97 ) != 0 );
    TEST( isOdd( -100 ) == 0 );

    TEST( isOdd( 100 ) == 0 );
    TEST( isOdd( 101 ) != 0 );
    TEST( isOdd( 99 ) != 0 );
    TEST( isOdd( 102 ) == 0 );

    printf( "Finished running tests on isOdd()\n" );
}

int
main()
{
    testisOdd();

    return 0;
}
