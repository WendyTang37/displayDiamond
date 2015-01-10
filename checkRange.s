/*
 * Filename: checkRange.s
 * Author: Wenhui Tang
 * Userid: cs30xlv
 * Description: checks that the given value is within the given range
 * Date: Oct. 16, 2013
 */


      .global checkRange



      .section ".text"


/*
 * Function name: checkRange()
 * Function prototype: int checkRange( long value, long minRange,
 *                                     long maxRange );
 * Description: Determines if value is within the range 
 * Parameters: 
 *	    arg 1: long value - the number to check if it is in the range
 *	    arg 2: long minRange - the lower bound of the range, inclusive
 *	    arg 3: long maxRange - the upper bound of the range, inclusive
 *
 * Side Effects: None
 * Error Conditions: None 
 * Return Value: returns 1 if value in range, returns 0 if not in the range
 *
 * Registers Used:
 *	%i0 - arg 1 - the value to check if it is in the range
 *	%i1 - arg 2 - the minRange 
 *	%i3 - arg 3 - the maxRange
 */



checkRange:

    save  %sp,  -96,  %sp

    cmp   %i0,  %i1         ! compare value and minRange
    bl,a  else              ! if value is less than minRange, branch to else
    mov 0,  %i0             ! move 0 to %i0, return value

    cmp   %i0,  %i2         ! compare value and maxRange
    bg,a  else              ! if value is greater than maxRange, branch to else
    mov 0,  %i0             ! move 0 to %i0, return value

    ba    end_if            
    mov   1,    %i0         ! move 1 to %i0, return value




else: 
    
end_if:
    ret
    restore
    
    


