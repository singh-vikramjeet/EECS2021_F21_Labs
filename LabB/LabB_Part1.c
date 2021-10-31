/* 
 * File:   main_atmega_labB.c
 * Author: Vikramjeet Singh
 *
 * Created on September 18, 2021, 9:45 PM
 */

#include <xc.h>

int main(void) 
{
    
    // initialize PortD, Pin 4 (PD4) (Red LED)
    
    DDRD = 0x10; // 00001 0000
    
    PORTD = 0x10; 
    
    PORTD = 0; 
    return 0;
}

