module LabJ_part9_8bit;

    reg signed [7:0] a,b;
    reg signed [7:0] expect;
    reg [2:0] op;
    wire ex;
    wire signed [7:0] z;
    reg ok, flag;

    yAlu mine(z, ex, a, b, op);

    initial 
    begin
        repeat(10)
        begin
            
        // generate random inputs
        a = $random;
        b = $random;
        flag = $value$plusargs("op=%d", op);
        if (flag === 0) $display("missing input: op");

        // This is the expected behavior of ALU
        if(op === 0) expect = a & b; // and
        else if (op === 1) expect = a | b; // or
        else if (op === 2) expect = a + b;// add
        else if (op === 3) expect = a - b; // subtract
        else $display("not supported op");

        #1; // add a delay

        // Check all bits of expect variable against the model for z output
        if(expect === z)
            $display("Pass: op=%d a=%d b=%d z=%d expect=%d", op, a, b, z, expect);
        else
            $display("Fail: op=%d a=%d b=%d z=%d expect=%d", op, a, b, z, expect);
        end
        $finish;
        
    end


endmodule