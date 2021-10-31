/* 
 * File:   newmain.c
 * Author: Vikramjeet Singh 
 *
 * Created on September 9, 2021, 11:57 PM
 */

#include <xc.h>

// Part 2
/*
 * 
 */
int main(void) {
    
    // Let 's manipulate internal registers in the ATMEGA328.
    // This is is simulation only.
    
    // Make Port B, Pin 5 an output. On regular Arduino UNO, this is D13
    DDRB |= (1UL << DDB5);
    
    // Turn on the "pretend" LED on Port B Pin 5 (D13 on Arduino Uno)
    PORTB |= (1UL << PORT5);
    
    // Turn off the "pretend" LED
    PORTB &= ~(1UL << PORT5);
    
    return 0;
    
}

