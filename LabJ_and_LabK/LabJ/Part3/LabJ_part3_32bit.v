module LabJ_part3;

    reg [7:0] a, b; // a and b are input signals
    reg [0:0] c; // c is control bit
    output [7:0] z; // 2 bit output from the 2-bit mux

    integer i, j, k, m, expect; // testing

    defparam mine.SIZE = 8;
    yMux mine(z, a, b, c);

    initial 
    begin
        // Examine 10 random combinations
        repeat (10)
        begin
            a = $random;
            b = $random;
            c = $random % 2;
            #1; // Add delay

            // compare z with the expected output
            for(m = 0; m < 31;m=m+1)
            begin
                expect[m] = (c &b[m]) | (a[m] & ~c);
            end

            // Check all bits of expect variable against the model for z output
            if(expect[31:0] !== z)
                $display("FAIL: a=%b b=%b c=%b z=%b", a, b, c, z);
            else
                $display("PASS: a=%b b=%b c=%b", a, b, c, z);
        end
        $finish;
        
    end


endmodule