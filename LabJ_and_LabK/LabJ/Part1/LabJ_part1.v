// Lab J Part 1
module LabJ_part1;

    reg a, b, c, flag;
    wire z, notOutput, Aout1, Aout2, lowerInput, OrIn1, OrIn2;
    integer i, j, k, expect; // testing

    // Describe the MUX circuit
    // the yMux1.v file defines the module. It will be linked in.

    yMux1 my_mux(z,a,b,c);

    initial 
    begin
        // Testing the my_mux using command line
        flag = $value$plusargs("a=%b", a);
        flag = $value$plusargs("b=%b", b);
        flag = $value$plusargs("c=%b", c);

        #20 $display("a = %b b = %b c = %b z = %b", a, b, c, z);
        $finish;
        
    end
endmodule