
#include<xc.h> 			

				.text
				.set	noreorder

				.global	asmfunction
.ent				asmfunction									
																										
				
asmfunction:
    
    la	    s0,firstNumber  /* get the address of firstNumber global variable*/
    lw	    t1, 0(s0)	    // (t1 = 0x5) store the value of address pointed(firstNumber) by s0 into t1
    la	    s1, secondNumber //get the address of secondNumber
    lw	    t2, 0(s1) //(t2 = 0xB) store the value of address pointed(secondNumber) by s1 into t2
    xor	    t4,t1,t2 // t4 = t1 XOR t2, (t4 =0xE)
    and	    t3,t4,t1 // t3 = t4 AND t1, (t3 = 0x4)
    la	    s3, global_cVariable // get the address of global_cVariable
    sw	    t3, 0(s3)  // store value in t3 into the address pointed by s3
    nop
    
    // Return to caller
    jr	    ra // jump to return address (found in ra register)
    nop
    
    
    
	
.end asmfunction												