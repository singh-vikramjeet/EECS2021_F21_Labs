/* 
 * File:   main.c
 * Author: Vikramjeet Singh
 *
 * Created on September 18, 2021, 10:30 PM
 */

// Initialize global variable to 7
// Use Port B, Pin 1

#include <xc.h>

// my global variable
int my_global = 7;

int main(void){

    // local variable for use in the main function
    int my_local = 0;
    
    //initialize Port B, Pin 1 (PB1)
    DDRB = 0b00000010; // bit 1 of port B is an output
    PORTB = 0b00000000; // bit 1 is turned off.
    
    while(1)
    {
        my_local = my_local + 1;
        
        // Turn on PB1 if my_local < 5
        // Turn off PB1 if my_local is between 5 and 10
        // Reset my_local if over 10/
        
        if(my_local < 5)
        {
            PORTB = 0b00000010; // bit 1 is turned on.
        }
        else if(my_local < 10)
        {
            PORTB = 0b00000000; // bit 1 is turned off.
        }
        else
        {
            // reset count on local variable, my_local
            my_local = 0;
            // increment the count on the global variable
            my_global = my_global + 1;
        }
    }
    return 0;
}

