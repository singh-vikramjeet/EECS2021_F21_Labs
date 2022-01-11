/* 
 * File:   labFpart4.c
 * Author: Vikramjeet Singh
 *
 * Created on October 23, 2021, 9:54 PM
 */

#include <xc.h>
#include <stdint.h>

// global variable for extracting value from ASM to back in C
uint8_t gResult = 0;

int main(void) 
{
    // Add 4 and 5 together, store the result in register R16
    asm("LDI    r17, 0x04"); // Load 4 in r17
    asm("LDI    r18, 0x05");// Load 5 in r18
    asm("ADD    r17,r18");// r17 = r17 + 18
    asm("STS    (gResult),r17"); // STS (Store Direct to Data Space) store the value in r17 to gResult
    return 0;
}

