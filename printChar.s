/*
 * Filename: printChar.s
 * Author: Wenhui Tang
 * Userid: cs30xlv
 * Description: Prints the character argument to stdout
 * Date: Oct. 16, 2013
 */


    .global   printChar

    .section  ".data"

fmt:    			              ! The format string to printf()
    .asciz    "%c"



    .section  ".text"

/*
 * Function name: printChar
 * Function prototype: void printChar( char ch );
 * Description: prints the passed in character using printf()
 * Parameters: 
 *	    arg 1: char ch - the character to be printed
 * Side Effects: None
 * Error Conditions: None. [Arg 1 is not checked to ensure it is not NULL.]
 * Return Value: none
 *
 *	%i0 - arg 1 -- the char passed into this function
 *
 *	%o0 - param 1 to printf() -- format string
 *	%o1 - param 2 to printf() -- copy of arg 1 being passed in
 */

printChar: 

    save  %sp,  -96,  %sp	! Save caller's window; if different than -96
				                  ! then comment on how that value was calculated.

    set   fmt,  %o0	      ! Parameter 1 to printf() goes in register %o0
    mov   %i0,  %o1 	    ! Parameter 2 to printf() goes in register %o1
    call  printf, 2     	! Make function call specifying # of params
    nop		              	! Delay slot for call instruction

    ret		              	! Return from subroutine
    restore			          ! Restore caller's window; in "ret" delay slot

