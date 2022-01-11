// You will use this code for Lab K Demo 1
// It will be 4 bit or 16 bit

module LabJ_part6_8bit;

    reg signed [7:0] a, b, expect;
    reg [0:0] cin;
    wire cout;
    wire signed [7:0] z;

    yAdder mine[7:0](z, cout, a, b, cin);

    initial 
    begin
        repeat(10)
        begin
            // generate random inputs
            a = $random;
            b = $random;
            cin = 0;
            // this is the expected behavior of the adder
            expect = a + b + cin; // add a, b with carry in.

            #1;

            // Check all bits of expect variable against the model for z outpu
            if (expect !== z)
                $display("FAIL: a=%d b=%d cin=%d cout=%d z=%d expect=%d", a, b, cin, cout, z, expect);
            else
                 $display("PASS: a=%d b=%d cin=%d cout=%d z=%d expect=%d", a, b, cin, cout, z, expect);
        end
        $finish;
        
    end

endmodule