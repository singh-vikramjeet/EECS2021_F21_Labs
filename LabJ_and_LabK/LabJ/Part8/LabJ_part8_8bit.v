module LabJ_part8_8bit;

    reg signed [7:0] a, b, expect;
    reg [0:0] ctrl;
    wire cout;
    wire signed [7:0] z;

    yArith mine[7:0] (z, cout, a, b, ctrl);

    initial 
    begin
        repeat(10)
        begin
            // generate random inputs
            a = $random;
            b = $random;
            ctrl = $random % 2;
            // this is the expected behavior of the adder
            expect = (ctrl === 0) ? (a + b) : (a - b);

            #1;

            // Check all bits of expect variable against the model for z outpu
            if (expect !== z)
                $display("FAIL: a=%d b=%d ctrl=%d z=%d expect=%d", a, b, ctrl, z, expect);
            else
                 $display("PASS: a=%d b=%d ctrl=%d z=%d expect=%d", a, b, ctrl, z, expect);
        end
        $finish;
        
    end

endmodule