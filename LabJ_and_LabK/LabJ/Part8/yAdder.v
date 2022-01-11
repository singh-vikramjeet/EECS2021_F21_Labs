// 8 bit adder
module yAdder(z, cout, a, b, cin);
    output [7:0] z;
    output cout;
    input [7:0] a, b;
    input cin;
    wire [7:0] in, out;

    yAdder1 mine[7:0](z, out, a, b, in);
    
    assign in[0] = cin;
    assign in[1] = out[0];
    assign in[2] = out[1];
    assign in[3] = out[2];

    assign in[4] = out[3];
    assign in[5] = out[4];
    assign in[6] = out[5];
    assign in[7] = out[6];

    assign cout = out[7];



endmodule