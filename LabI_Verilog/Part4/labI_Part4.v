

// Part 4: Testing the model
module LabI_part4;

    reg a, b;   // reg without size means 1-bit
    wire z;

    integer i, j; // for the loops


    // two logic gates and connections between them
    not my_not(tmp, b); // tmp is input, b is output
    and my_and(z, a, tmp); // z is output, a and tmp are inputs



    initial 
    begin
        for (i = 0; i < 2; i = i + 1)
            begin
                for(j = 0; j < 2; j = j + 1)
                begin
                    a = i; b =j;
                    #1 $display("a=%b b=%b z=%b", a, b, z);
                end
            end
        $finish;
    end
endmodule