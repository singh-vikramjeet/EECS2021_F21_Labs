/* 
 * File:   labDpart3.c
 * Author: Vikramjeet Singh
 *
 * Created on September 24, 2021, 11:09 PM
 */

#include <xc.h>
#include <stdint.h>

/*
 *  To find the frequency of Atmega328p (Useful for Major Project)
 * Read the LOW FUSE byte from the configuration bits
 * .low = 0x62
 * Lower nibble 2 corresponds to 0010 which means the 8MHz internal
 * oscillator is being used as the clock source
 * Higher nibble 6 corresponds to 0110 which means the bit 7(CKDIV8 = 0)
 * CKDIV8 is an active low bit
 * When CKDIV8 = 0, the clock frequency is divided internally by 8
 * Clock frequency of Atmega328p is 8MHz/8 = 1MHz 
 */

/*
 * To calculate the DELAY_CONST value for 3.2 seconds
 *  For 1 blink, every 4 seconds, DELAY_CONST = 1000,000 loops
 *  For 1 blink, every 1 second, DELAY_CONST = 1000,000/4 = 250,000 loops
 *  For 1 blink, every 3.2 seconds, DELAY_CONST = (Loops required for 1 second) * 3.2
 * DELAY_CONST = 250,000 * 3.2 = 800,000 loops  
 */

//#define DELAY_CONST 1000000 // for 1 blink, every 4 seconds

#define DELAY_CONST 800000 // for 1 blink, every 3.2 seconds

void delay_function(volatile int32_t);

int main(void) 
{
    // set PB5 to be out
    DDRB = 1UL << PORT5; // bit 5 is an out, others set to 0
    
    // enter an infinite loop
    while(1)
    {
        delay_function(DELAY_CONST); // wait
        PORTB = 0; // all are off
        
        delay_function(DELAY_CONST); // wait
        PORTB = 1 << 5; 
       
    }

    return 0;
}

void delay_function(volatile int32_t x)
{
    // x starts off as a big number and
    // we subtract 1 from it over and over
    // until it gets to zero.
    // At zero, exit the loop and return to the main function.
    while(x > 0)
    {
        x = x - 1;
    }
}
