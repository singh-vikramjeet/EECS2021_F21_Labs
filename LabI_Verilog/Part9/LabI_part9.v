module LabI_part9

    reg [0:0] a; // 1 bits each
    reg[0:0] b;
    reg[0:0] c; // 1 bit only
    integer i, j, k, l, m;  // for for loops
    output [0:0] z;
    output [0:0] cout;

    // interconnections
    wire xor1out, xor1in, orin1, orin2, and1out, and2out;

    // the Adder circuit
    xor myxor1(xor1out, a, b);
    and myand1(and1out, a, b);
    xor myxor2(z, xor1out, c);
    and myand2(and2out, xor1out, c);
    or myor1(cout, and2out, and1out);

    initial 
    begin
        $monitor("%2d a = %2b b = %2b c = %2b z = %2b cout = %2b ", $time, a, b, c, z, cout);    
    end


    initial 
    begin
        for(i = 0; i < 2; i = i + 1)
        begin
            for (j = 0; j < 2; j = j + 2)
            begin
                for (k = 0; k < 2; k = k + 1)
                begin
                    #1 a = i; b = j; c = k;
        end
        $finish;
    end


endmodule