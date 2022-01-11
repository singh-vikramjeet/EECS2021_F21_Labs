/* 
 * File:   labFpart3.c
 * Author: Vikramjeet Singh
 *
 * Created on October 23, 2021, 9:25 PM
 */

#include <xc.h>


int main(void) {
    
    // Store 0xF in r16. Decrement it twice and
    // store the result in r16.
    
    // LDI stands for Load Immediate and it loads an 8 bit-constant
    // directly to register r16 to r31.
    
    // DEC is for Decrement and it subtracts one from the contents of register.
    // C flag (Carry flag - Bit 0) in SREG is not affected by DEC operation.
    
    asm("LDI    r16,0xF"); // Load 0xF in r16
    asm("DEC    r16"); // r16 =0xE (14)
    asm("DEC    r16");// r16 = 0xD (13)
    
    
    
    return 0;
}

