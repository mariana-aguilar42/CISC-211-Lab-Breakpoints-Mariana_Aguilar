/*** asmFunc.s   ***/

/* Tell the assembler that what follows is in data memory    */
.data
.align
 
.global nameStr
.type nameStr,%gnu_unique_object
/* create a string */
    
/*** STUDENTS: HINT: this is the string that the C code prints out!  **/
nameStr: .asciz "Hello. My name is Inigo Montoya"  
 
/* initialize a global variable that C can access to print the nameStr */
.global nameStrPtr
.type nameStrPtr,%gnu_unique_object
nameStrPtr: .word nameStr   /* Assign the mem loc of nameStr to nameSrPtr */
 
/* Tell the assembler that what follows is in instruction memory    */

/* For Spring '26, we removed the .text directive and used the .section
 * directive below to make sure that asmFunc is located consistently
 * regardless of MPLAB data packs and other config differences */

/* .text */

.section lab3code,code,address(0x00002000)

.align

/* Tell the assembler to allow both 16b and 32b extended Thumb instructions */
.syntax unified

    
/********************************************************************
function name: asmFunc
function description:
     output = asmFunc ( input1, input2 )
     
where:
     input1:  an integer value passed in from the C program
     input2:  an integer value passed in from the C program
     output: the integer value returned to the C function
     
     function description: The C call passes in the two values to be summed
                           in registers 0 and 1 (r0 and r1).
                           asmFunc adds the two integer values together
                           and places the result in r0.
     
     notes:
        None
          
********************************************************************/    
.global asmFunc
.type asmFunc,%function
asmFunc:   

    /* save the caller's registers, as required by the ARM calling convention */
    push {r4-r11,LR}
    
    /* Lets study these lines in class. Can we predict the values of APSR
     * and the general purpose registers???    */
    subs r0,r0,r0  /* What will r0 be? How about the APSR? */
    movs r0,0b10110100 
    mov  r1,0
    movs r1,1
    rsbs r2,r1,0

     /* Start of Breakpoint Lab Quiz Section */
    subs r0,r0,r0  /* Mariana! Set a breakpoint at this line! */
    subs r2,r2,r2
    adds r1, r0, 5
    rsbs r2,r1,0
    mov  r2, 0
    movs r2, 0
    movs r3, 0x80000000
    adds r4, r3, r3  
       
    /* restore the caller's registers, as required by the 
     * ARM calling convention 
     */
    pop {r4-r11,LR}

    mov pc, lr	 /* asmFunc return to caller */
   

/**********************************************************************/   
.end  /* The assembler will not process anything after this directive!!! */
           




