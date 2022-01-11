module LabJ_part4;

    reg [7:0] a0, a1, a2, a3; // inputs a0, a1, a2, a3, a4 
    reg [1:0] c; // control bit c is two bits
    wire [7:0] z, zLo, zHi; // outputs
    reg [7:0] expected; // test variable

    defparam mine.SIZE = 8; // 8 bits wide

    yMux4to1 mine(z, a0, a1, a2, a3, c);

    initial 
    begin

        repeat(10)
        begin
            a0 = $random;
            a1 = $random;
            a2 = $random;
            a3 = $random;
            c = $random % 4;

            // This is the expected behavior of the 4to1 mux.
            if (c === 0) expected = a0;
            else if (c === 1) expected = a1;
            else if (c === 2) expected = a2;
            else expected = a3;

            #1;

            if (expected !== z)
                $display("FAIL: c=%b a0=%b a1=%b a2=%b a3=%b z=%b", c, a0, a1, a2, a3, z);
            else
                $display("PASS");

        end
        $finish;
        
    end



endmodule