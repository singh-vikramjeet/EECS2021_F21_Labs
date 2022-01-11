// Part 3: Implementing Simple Circuits
module LabI_Part3;

    reg a, b; // reg without size means 1-bit
//    wire tmp, z;
    wire notOutput, lowerInput, tmp, z;

    // two logic gates and connections between them
    //not my_not(tmp, b);
   // and my_and(z,a,tmp);
   not my_not(notOutput, b);
   and my_and(z, a, lowerInput);
   assign lowerInput = notOutput;

    initial 
    begin
        a = 1; b = 1;
        #2 $display("a=%b b=%b z=%b", a,b,z);
        #5 $finish;        
    end

endmodule