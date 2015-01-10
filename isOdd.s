/*
 * Filename: isOdd.s
 * Author: Wenhui Tang
 * Userid: cs30xlv
 * Description: Checks if the long int argument is odd or not
 * Date: Oct. 16, 2013
 */


      .global isOdd



      .section ".text"

/*
 * Function name: isOdd()
 * Function prototype: int isOdd( long num );
 * Description: Determines if the argument is odd by using a modulus
 * Parameters: 
 *	    arg 1: long num - the number to check if it is odd
 *
 * Side Effects: None
 * Error Conditions: None [Arg 1 is not checked to ensure it is not NULL.]
 * Return Value: returns 1 if odd and returns 0 if not odd
 *
 * Registers Used:
 *	%i0 - arg 1 - the long passed in to this function
 *	%o0 - param 1 to .rem -- the number being modded
 *	%o1 - param 2 to .rem -- the divider
 */

isOdd:
        
    save  %sp,  -96,  %sp     ! Save caller's window; if different than -96
				                      ! then comment on how that value was calculated.


    mov   %i0,  %o0           ! move passed in argument to output register 0
    mov   2,    %o1           ! move the number 2 to output register 1

    cmp   %o0,  %g0           ! compare the passed in argument with 0
    be    zero                ! branch to zero if it is zero
    nop                       ! delay slot

    call .rem                 ! call .rem to do operation num%2
    nop                       ! delay slot


    mov   %o0,  %i0           ! move result of num%2 to input register 0

end:
    ret                       ! return
    restore                   ! restore


zero:
    mov   1,  %i0             ! move 1 to %i0, return value
    ba    end                 ! branch back to end
    nop                       ! delay slot


