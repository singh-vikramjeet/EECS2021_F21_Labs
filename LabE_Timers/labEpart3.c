/* 
 * File:   labEpart3.c
 * Author: Vikramjeet Singh
 *
 * Created on October 16, 2021, 12:34 AM
 */

/* Original Frequency = 16 MHz
 * Prescaler set to 1024, frequency = 16MHz/ 1024 = 15.625 kHz (Time Period = 64us)
 * OCROA is set to 256. This means the timer will count to 256 and as a result,
 * it goes through a total of 256 states.
 * New Frequency = 15.625 kHz/256 = 61 Hz (Time Period = 16.384 ms)
 * For frequency of 1 Hz, we need 61 clock cycles
 * For frequency of 0.5 Hz, we need ~30 clock cycles.
 */

/* If OCR0A = 128, then the timer will count to 128 and goes through
 * a total of 128 states.
 * New Frequency = 15.625 kHz/128 = 122 Hz = (122 clock cycles/second)
 * For frequency of 1 Hz, we need 122 clock cycles
 * for frequency of 0.5 Hz, we need 61 clock cycles
 
 */

#include <xc.h>

#define COUNTDOWNFROM 61 // For OCR0A = 255 and LED frequency = 0.5 Hz (T = 2 s)

int main(void) 
{
    long myCount = COUNTDOWNFROM;
    
    // Turn on PortB Bit 5 to be output
    DDRB = (1 << 5);// 0x20
    
    // Set the Timer0 's Timer Mode to CTC (Clear Timer on Compare Match)
    // For CTC, WGM00(Bit 0) = 0 and WGM01 (Bit 1) = 1 in TCCR0A (Timer Counter Control Register A)
    TCCR0A |= (1 << WGM01); // 0x02
    
    // Set the value that you want to count to  from zero
    // OCR0A is Output Compare Register A
    OCR0A = 255; // Count to 256 (Max Count)
    
    // Control Timer0 's prescale. This slows down the content
    // CS00 CS01 CS02: 1 0 0: NO prescaler
    // CS00 CS01 CS02: 0 0 1: set prescaler to 256 and start the timer
    // CS00 CS01 CS02: 1 0 1: set prescaler to 1024 and start the timer.
    TCCR0B |= (1 << CS00) | (1 << CS02); // 1024 uses 101 bit pattern (TCCR0B = 0x05)
    
    while(1)
    {
        while((TIFR0 & (1 << OCF0A)) == 0) // wait for the overflow event
        {
            // TIFR0 is Timer 0 Interrupt flag register.
            // In TIFR0, Bit 2 Bit1 Bit0: OCF0B OCF0A TOV0
            // Bits 3 to 7 are reserved
            // OCF0A (Output Compare A Match Flag) is set when a compare match occurs
            // between TCNT0 (Timer/Counter register 0) and OCR0A
            // TOV0 is timer overflow flag and it is used only for NORMAL mode, not for CTC mode
            asm("NOP");
        }
        // reset the timer overflow flag/ Output Compare A Match Flag
        //TCCR0B = 0; // Stop Timer 0
        TIFR0 |= 1 << OCF0A;
        //TIFR0 |= (1 << TOV0);
        
        
        
        // run the internal counter, once per overflow
        if(myCount > 0)
        {
            myCount = myCount - 1;
            
        }
        else // we counted enough time to toggle the LED on PB5
        {
            PORTB ^= (1 << 5);
            myCount = COUNTDOWNFROM; // reset for next round.
        }
        
    }
    
    

    
    return 0;
}

