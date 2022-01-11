// Part 7: User input during testing
module LabI_part7;

    reg a, b, c, flag; // reg without size means 1-bit
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
        // $value$plusargs has 2 parameters
        // $value is like a format specifier that enables
        // vvp to parse the command line and extracts the desired argument

        // $plusargs specifies the variable to be initialized.
        // a=%b instructs vvp to look for a= followed by a single bit.
        // This specifier can also be %h or %d to indicate that the entered
        // value is in hex or decimal.

        flag = $value$plusargs("a=%b", a); // To get user input for a
        flag = $value$plusargs("b=%b", b);
        flag = $value$plusargs("c=%b", c);

        #20 $display("a=%b b=%b z=%b", a, b, z);
        $finish;
    end

endmodule

