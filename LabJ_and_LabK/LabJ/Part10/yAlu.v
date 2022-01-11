// 8 bit
module yAlu(z, zero, a, b, op);
    input [7:0] a, b;
    input [2:0] op;
    output [7:0] z;
    output zero;

    wire [7:0] zAnd, zOr, zArith,slt;
    wire condition, cout;

    assign slt[7:1] = 0;
    xor (condition, a[7], b[7]);
    yMux #(1) sltMux(slt[0], zArith[7], a[7], condition);

    and myAnd[7:0] (zAnd, a, b);
    or myOr[7:0] (zOr, a, b);
    yArith myArith (zArith, cout, a, b, op[2]);
    yMux4to1 #8 myMux(z, zAnd, zOr, zArith, slt, op[1:0]);

    // wire z1;
    // or or1[0:0] (z1, z[7], z[6], z[5], z[4], z[3], z[2], z[1], z[0]);
    // not last(zero, z1);

endmodule