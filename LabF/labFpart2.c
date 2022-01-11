/* 
 * File:   labFpart2.c
 * Author: Vikramjeet Singh
 *
 * Created on October 23, 2021, 12:06 AM
 */

#include <xc.h>

int main(void) {
    
    // Set PB5 to out. Leave others the same.
    DDRB |= (1 << 5);
    
    // Drive PB5 to 0. Leave others the same.
    PORTB &= ~(1 << 5);
    
    // Drive PB5 to 1. Leave others the same.
    PORTB |= (1 << 5);
    
    // Invert PB5. Leave others the same.
    //PORTB ^= (1 << 5);
    asm("IN     r25,0x05 \n"    // Contents of PORTB copied from 0x05 into r25
        "LDI    r24,0x20 \n"    // Put 0x20 into r24
        "EOR    r24,R25  \n"    // Exclusive OR r24 and r25
        "OUT    0x05,r24"       // Send value in r24 to 0x05(PORTB)
    : : :"r24","r25");          // R24 and R25 protected from "clobbering"
    
    // asm("code" : output operand list: input operand list: clobber list);
    
    
    

    return 0;
}

