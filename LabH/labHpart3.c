/* 
 * File:   labHpart3.c
 * Author: Vikramjeet Singh
 *
 * Created on November 9, 2021, 11:55 AM
 */

#include <xc.h>



int volatile firstNumber = 0b0101;//(0x05)
int volatile secondNumber = 0b1011;//(0x0B)
    
int main(void) {
    
    // Using assembler commands, perform the following math operation:
    // (0b0101 XOR 0b1011) AND 0b0101.
    // (0x05 XOR 0x0B) AND (0x05)
    
    //Do it in two stages.
    // Only use unsigned numbers. Use "temporary" registers t1, t2, t3, t4 and t5.
    // Store the result of the AND in t3.
    // Store the final answer in t5 and report the value in binary.
    
    // Register Numbers
    //t1 t2 t3 t4 t5: $9 $10 $11 $12 $13  

    asm("lw $t1,firstNumber \n"); // Load firstNumber(0x05) from SRAM into t1 register
    asm("lw $t2, secondNumber \n");// Load secondNumber(0x0B) from SRAM into t2 register
    asm("xor $t4,$t1,$t2 \n");// t4 = t1 XOR t2 (0x5 XOR 0xB), t4 = 0xE
    asm("and $t3,$t4,$t1 \n");// t3 = t4 AND t1 (0xE AND 0x5), t3 = 0x4
    asm("addu $t5, $zero,$t3"); // Store the final result in t5, t5 = 0 + t3
    
    
  
    

    return 0;
}

