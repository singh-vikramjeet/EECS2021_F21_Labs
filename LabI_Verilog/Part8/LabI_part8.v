// Part 8: Multiplexer with an Oracle
module LabI_part8;

    reg a, b, c, flag;
    wire z, notOutput, Aout1, Aout2, lowerInput, OrIn1, OrIn2;
    integer i, j, k, expect;

    // Describe the circuit 
    not my_not(notOutput, c);
    and my_and(Aout1, a, lowerInput);
    and my_and(Aout2, c, b);
    or my_or(z, OrIn1, OrIn2);

    assign lowerInput = notOutput;
    assign OrIn1 = Aout1;
    assign OrIn2 = Aout2;

    // 2 to 1 Multiplexer has 2 inputs 'a' and 'b'
    // input 'c' is select line
    // When select line 'c' is 0, then output (z) =  input 'a'
    // When select line 'c' is 1, then output (z) =  input 'b'

    initial 
    begin
        for (i = 0; i < 2; i = i + 1)
        begin
            for (j = 0; j < 2;j = j + 1)
            begin
                for (k = 0; k < 2; k = k + 1)
                begin
                    a = i; b = j; c = k;
                    // Logic of the circuit using Ternary operator
                    expect = c ? b : a; 
                    // How the ternary operator works?
                    // If c == 1, then expect = b
                    // If c == 0, then expect = a

                    // Bitwise Expression for the circuit
                    //expect = (c & b) | (a & ~c);
                    // put a delay for signal propagation 
                    #1; // wait for z
                    if (expect === z)
                        $display("PASS: a = %b b = %b c = %b z = %b", a, b, c, z);
                    else
                        $display("FAIL: a= %b b= %b c= %b d= %b", a, b, c, z);    
                end // end k loop
                end // end j loop   
        end // end i loop
        $finish;
    
    
    end
endmodule