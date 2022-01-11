// Lab K: Demo 2

module LabK_CPU_16bit;

    reg signed [15:0] a,b;
    reg signed [15:0] expect;
    reg [2:0] op;
    wire ex;
    wire signed [15:0] z;
    reg ok, flag, tmp, zero;
    

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
        else if (op === 6) expect = a - b; // subtract
        else if (op === 7) expect = (a < b) ? 1 : 0; // op = 7: SLT
        else $display("not supported op");
        zero = (expect === 0) ? 1 : 0;

        #1; // add a delay

        // Check all bits of expect variable against the model for z output
        if(zero === ex) ok = 1;
        else ok=0;
        $display("ok=%d a=%d b=%d op=%d z=%d zero=%d ex=%2d", ok, a, b, op, z, zero, ex);
          
        end
        $finish;
        
    end


endmodule