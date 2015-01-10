/*
 * Filename: displayDiamond.s
 * Author: Wenhui Tang
 * Userid: cs30xlv
 * Description: displays a diamond with a border 
 * Date: Oct. 16, 2013
 */


    .global displayDiamond

    .section  ".data"

    NL = '\n'


    .section ".text"
/*
 * Function name: displayDiamond()
 * Function prototype: void displayDiamond( long width, long height, 
 *                                          long borderCh, long diamondCh );
 * Description: prints out a diamond with a square border around it using 
 *              printChar()
 * Parameters: 
 *	    arg 1: long width - the width of the border
 *	    arg 2: long height - the height of the diamond
 *	    arg 3: long borderCh - the ASCII character that will make the border
 *	    arg 4: long diamondCh - the ASCII character that will make the diamond
 * Side Effects: None
 * Error Conditions: None
 * Return Value: nothing
 *
 * Registers Used:
 *    %i0 - 1st arg width
 *    %i1 - 2nd arg height
 *    %i2 - 3rd arg borderCh
 *    %i3 - 4th arg diamondCh
 *    %l0 - row
 *    %l1 - col
 *    %l2 - outer
 *    %l3 - inner
 *
 *
 */


displayDiamond:

    save  %sp,  -96,  %sp         ! Save caller's window; if different than -96
		    		  ! then comment on how that was calculated.

    mov   1,    %l0               ! row mapped to %l0
    clr   %l1                     ! col mapped to %l1
    clr   %l2                     ! outer mapped to %l2
    clr   %l3                     ! inner mapped to %l3

    cmp   %l1,  %i0               ! compare col with width
    bge,a end_top_row             ! annuled branch
    mov   NL,   %o0               ! delay slot filled from target of branch

    mov   %i2,  %o0

top_row:
    call  printChar               ! print borderCh
    inc   %l1                     ! col++, delay slot

    cmp   %l1,  %i0               ! col < width
    bl,a  top_row                 ! annuled branch
    mov   %i2,  %o0

    mov   NL,   %o0     


end_top_row:
    call  printChar               ! print new line
    cmp   %l0,  %i1               ! compare row with height, delay slot 

    bge,a end_diamond_top_half
    mov   %i1,  %l0               ! row = height, delay slot

    sub   %i0,  %l0,  %o0         ! %o0 = width - row

diamond_top_half:
    mov   2,    %o1
    call  .div                    ! (width - row)/2
    nop

    mov   %o0,  %l2               ! outer = (width - row)/2
    cmp   %l2,  1
    bl,a  end_top_half_first
    mov   1,    %l3               ! inner = 1, delay slot

    mov   %i2,  %o0


top_half_first:
    call  printChar               ! print borderCh
    dec   %l2                     ! outer-- delay slot
    cmp   %l2,  1                 
    bge,a top_half_first          ! outer >= 1
    mov   %i2,  %o0               ! delay slot

    mov   1,    %l3 
    

end_top_half_first: 

    cmp   %l3,  %l0
    bg,a  end_top_half_second
    sub   %i0,  %l0,  %o0         ! %o0 = width - row, delay slot

    mov   %i3,  %o0


top_half_second:

    call  printChar               ! print diamondCh      
    inc   %l3                     ! inner++, delay slot

    cmp   %l3,  %l0
    ble,a top_half_second
    mov   %i3,  %o0               ! move diamondCh to %o0, delay slot

    sub   %i0,  %l0,  %o0         ! %o0 = width - row


end_top_half_second:

    mov   2,    %o1
    call  .div                    ! (width - row)/2
    nop

    mov   %o0,  %l2               ! outer = (width - row)/2
    cmp   %l2,  1
    bl,a  end_top_half_third
    mov   NL,   %o0               ! delay slot
    mov   %i2,  %o0

top_half_third:
    call  printChar               ! print borderCh
    dec   %l2                     ! outer--, delay slot

    cmp   %l2,  1                 
    bge,a top_half_third          ! outer >= 1
    mov   %i2,  %o0               ! delay slot
    mov   NL,   %o0 

end_top_half_third:
        
    call  printChar               ! print new line
    inc   %l0                     ! delay slot

    inc   %l0
    sub   %i1,  2,  %l4           ! %l4 = height - 2
    cmp   %l0,  %l4
    ble,a diamond_top_half        ! row <= height - 2
    sub   %i0,  %l0,  %o0         ! %o0 = width - row

    mov   %i1,  %l0               ! row = height

end_diamond_top_half:

    cmp   %l0,  %g0
    bl,a  end_diamond_bottom_half
    clr   %l1

    sub   %i0,  %l0,  %o0         ! %o0 = width - row

diamond_bottom_half:

    mov   2,    %o1
    call  .div                    ! (width - row)/2
    nop

    mov   %o0,  %l2               ! outer = (width - row)/2
    cmp   %l2,  1
    bl,a  end_bottom_half_first
    mov   1,    %l3               ! inner = 1

    mov   %i2,  %o0

bottom_half_first:
    call  printChar               ! print borderCh
    dec   %l2                     ! outer--, delay slot

    cmp   %l2,  1
    bge,a bottom_half_first       ! outer >= 1
    mov   %i2,  %o0

    mov   1,    %l3               ! inner = 1

end_bottom_half_first:

    cmp   %l3,  %l0
    bg,a  end_bottom_half_second
    sub   %i0,  %l0,  %o0         ! %o0 = width - row

    mov   %i3,  %o0

bottom_half_second:
    call  printChar               ! print diamondCh      
    inc   %l3                     ! inner++, delay slot

    cmp   %l3,  %l0
    ble,a bottom_half_second
    mov   %i3,  %o0

    sub   %i0,  %l0,  %o0         ! %o0 = width - row

end_bottom_half_second:
    mov   2,    %o1
    call  .div                    ! (width - row)/2
    nop

    mov   %o0,  %l2               ! outer = (width - row)/2
    cmp   %l2,  1
    bl,a  end_bottom_half_third
    mov   NL,   %o0               ! delay slot

    mov   %i2,  %o0

bottom_half_third:
    call  printChar               ! print borderCh
    nop

    dec   %l2
    cmp   %l2,  1
    bge,a bottom_half_third       ! outer >= 1
    mov   %i2,  %o0

    mov   NL,   %o0

end_bottom_half_third:

    call  printChar               ! print new line
    dec   %l0                     ! delay slot

    dec   %l0
    cmp   %l0,  %g0
    bge,a diamond_bottom_half     ! row >= 0
    sub   %i0,  %l0,  %o0         ! %o0 = width - row

    clr   %l1

end_diamond_bottom_half:

    cmp   %l1,  %i0               ! compare col with width
    bge   end_bottom_row
    mov   NL,   %o0

    mov   %i2,  %o0               ! move borderCh to %o0

bottom_row:
    call  printChar               ! print borderCh
    nop

    inc   %l1                     ! col++
    cmp   %l1,  %i0               ! col < width
    bl bottom_row
    mov   %i2,  %o0               ! move borderCh to %o0

    mov   NL,   %o0


end_bottom_row:
    call  printChar
    nop

    ret   
    restore
                                                                
