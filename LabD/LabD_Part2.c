/* 
 * File:   labDpart2.c
 * Author: Vikramjeet Singh
 *
 * Created on September 24, 2021, 10:55 PM
 */

#include <xc.h>

/*
 * 
 */
int main(void) 
{
    // Set PB5 to be out
    DDRB = (1 << 5); // bit 5 is an out, others are set to 0
    
    PORTB = 0; // all are OFF
    
    PORTB = 1UL << PORT5;  // PB5 (LED) is on (method 1)
    
    PORTB = 0;
    
    PORTB = 0b00100000; // PB5 (LED) is on (method 2)
    
    PORTB = 0;
    
    PORTB |= 0b00100000; // PB5 (LED) is on (method 3)
    
    PORTB = 0;
    
    PORTB |= 1UL << PORT5; //PB5 (LED) is on (method 4)
    
    PORTB = 0;
      
    return 0;
}

