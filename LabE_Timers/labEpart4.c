/* 
 * File:   labEpart4.c
 * Author: Vikramjeet Singh
 *
 * Created on October 16, 2021, 4:12 PM
 */

#include <xc.h>
#include <avr/interrupt.h>

// Use 30 for: 0.5 Hz ISR Period with 16 MHz and 1024 prescale & TIMER0 count to 256
// For 1 Hz, we need ~60 clock cycles


#define ISR_TIMER0_RELOAD 120 // Use 15 for 0.250Hz (T = 4s)

int main(void) 
{
    //Turn on PortB Bit 5 to be output
    DDRB |= (1 << 5);
    
    // Set the Timer0 's Timer Mode to CTC
    TCCR0A |= (1 << WGM01);
    
    // Set the value that you want to count to
    OCR0A = 0xFF;
    
    // Set up Timer 0 to have an Interrupt Service Request on 'COMPA'
    // TIMSK0 is Timer Interrupt Mask Register (Bits 3 to 7 are reserved)
    // Bit 2 Bit 1 Bit 0: OCIE0B OCIE0A TOIE0
    // OCIE0A is Output Compare Match A Interrupt Enable, when OCIE0A = 1, interrupt is enabled
    // Interrupt is executed when OCF0A bit is set in TIFR0 (Timer Interrupt flag register)
    TIMSK0 |= (1 << OCIE0A);
    
    // Enable interrupts with an asm() statement here.
    asm("SEI"); // SEI is Set Interrupt instruction which sets the
    // bit 7 (I flag - Global Interrupt Enable) in the SREG(status register) to HIGH
    
    // Control Timer0 's prescale. This slows down the content
    // CS00 CS01 CS02: 1 0 0: NO prescaler
    // CS00 CS01 CS02: 0 0 1: set prescaler to 256 and start the timer
    // CS00 CS01 CS02: 1 0 1: set prescaler to 1024 and start the timer.
    TCCR0B |= (1 << CS00) | (1 << CS02); // 1024 uses 101 bit pattern (TCCR0B = 0x05)
    
    // Infinite loop. Nothing here.
    while(1)
    {
        asm("NOP");// No operation
    }

    return 0;
}

// Interrupt Service Routine for Timer 0.
ISR(TIMER0_COMPA_vect) // timer0 overflow interrupt
{
    // Use this variable to keep a count of the number
    // of times that the ISR is called.
    // Use it to delay the toggling of the PB5 LED so that it can be visible.
    // The "static" keyword allows a local variable to retain its value for the next time
    // the ISR function is called. It makes the "local" variable persist when it should normally
    // get erased when the function exists.
    static int8_t isr_count = ISR_TIMER0_RELOAD;
    
    // run the internal counter, once per ISR call
    if(isr_count > 0) // write a check here for isr_count being greater than zero
    {
        isr_count = isr_count - 1;
    }
    else
    {
        PORTB ^= (1 << 5);
        isr_count = ISR_TIMER0_RELOAD;
    }
}


