// Part 6: More complex circuitry

module LabI_part6;

    reg a, b, c; // reg without size means 1-bit
    wire z, notOutput, Aout1, Aout2, lowerInput, OrIn1, OrIn2;

    integer i, j, expect; // for the loops and testing

    // Describe the gates in the circuit
    not my_not(notOutput, b); // b is input and notOutput is Output
    and my_and(Aout1, a, lowerInput);// Aout1 is output, a and lowerInput are inputs
    and my_and2(Aout2, c,b); // Aout2 is output, c and b are inputs
    or my_or(z, OrIn1, OrIn2); // z is output, OrIn1 and OrIn2 are inputs

    assign lowerInput = notOutput;
    assign OrIn1 = Aout1;
    assign OrIn2 = Aout2;

    initial 
    begin
        a = 1; b = 0; c = 0;// set the signals to single values
        #2 $display("a=%b b=%b z=%b", a, b, z);
        $finish;
    end
endmodule