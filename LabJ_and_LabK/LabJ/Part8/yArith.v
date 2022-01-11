// 8-bit version of yArith

module yArith(z, cout, a, b, ctrl);
    // add if ctrl = 0, subtract if ctrl = 1
    output [7:0] z;
    output cout;
    input [7:0] a, b;
    input ctrl;
    wire [7:0] notB, tmp;
    wire cin;

    not myNot[7:0] (notB, b);
    yMux #(8) mux(tmp, b, notB, ctrl);
    assign cin = ctrl;
    yAdder add(z, cout, a, tmp, cin);

endmodule