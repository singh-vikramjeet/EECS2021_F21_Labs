// 8 bit
module yAlu(z, ex, a, b, op);
    input [7:0] a, b;
    input [2:0] op;
    output [7:0] z;
    output ex;

    wire [7:0] aAndb, aOrb, aArb, slt;

    assign slt = 0; // not supported yet
    assign ex = 0; // not supported yet
    // instantiate the components and connect them

    and my_and[7:0] (aAndb, a, b);
    or my_or[7:0](aOrb, a, b);
    yArith my_arith(aArb, cout, a, b, op[2]);
    yMux4to1 #(8) my_mux(z, aAndb, aOrb, aArb, slt, op[1:0]);

endmodule