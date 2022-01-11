#include	<xc.h>
//Configuration	Bits.	NB	read	chapter	26	of	PIC32MX1XX/2XX	datasheet	
//DS61168E
//	DEVCFG3		- don't	usually	need	to	alter	these,	but	for	completeness	cf	
//p230
//	Nothing	here
//	DEVCFG2			
#pragma	config	FPLLIDIV	=	DIV_4	//	8MHz	XTAL	so	8	/	4	=	2
#pragma	config	FPLLMUL	=	MUL_20	//	2	*	20		=	40MHz	SYSCLK
#pragma	config	FPLLODIV	=	DIV_1	//	Still	40MHz!
//	DEVCFG1
#pragma	config	FNOSC	=	PRIPLL						//	use	8MHz	XTAL	and	PLL	(page	
//227/DS61168E)
#pragma	config	FSOSCEN	=	OFF							//	FSOSCEN	is	the	secondary	
//oscillator
#pragma	config	POSCMOD	=	HS								//	Since	using	High	speed	XTAL,	or	
//use	XT.
#pragma	config	OSCIOFNC	=	OFF						//	OSCIOFNC	disables	o/p	on	OSCO	
//pin
#pragma	config	FPBDIV	=	DIV_2						//	FPBDIV	is	Peripheral	bus
#pragma	config	FCKSM	=	CSDCMD						//	no	clockswitch	or	monitor
#pragma	config	FWDTEN	=	OFF								//	watchdog	off	so	next	3	don't	
//matter...
#pragma	config	JTAGEN	=	OFF								//	Disable	JTAG	
//Programmer/debugger

// GLOBAL variables
int volatile firstNumber = 0b0101;//(0x05)
int volatile secondNumber = 0b1011;//(0x0B)

volatile unsigned int global_cVariable = 0;

extern	void	asmfunction(int	myvariable);		


int main(void){
    
    // Using assembler commands, perform the following math operation:
    // (0b0101 XOR 0b1011) AND 0b0101.
    // (0x05 XOR 0x0B) AND (0x05)
    
    // Set Port A to be output, in two steps.
	LATA = 0;				// Set value of PORT A output to 0. 
	TRISA = 0;				// Set all pins on PORT A to output
    
    asmfunction(0x0000); // Input parameter will go through register a0.
    if(global_cVariable == 0x04){
        LATA = 0x0001; // turn on all 8 bits in PORT A
        asm("NOP");
        asm("NOP");
        LATA = 0x0000; // turn off all bits in PORT A
        asm("NOP");
        asm("NOP");
    }
    while(1)
    {
        asm("NOP");
    }
    return 0;
}
