// 2 bit mux
module yMux(z, a, b, c);

    parameter SIZE = 2;
    output [SIZE-1:0] z; // output has two bits
    input [SIZE-1:0] a, b; // inputs each have 2 bits
    input [0:0] c;  // control is a single bit

    // Assign signals to the two single-bit muxes, yMux1
    // New way:
    yMux1 mine[SIZE-1:0](z, a, b, c);


    // Old way:
    // Assign signals to the two single-bit muxs, yMux2
    // yMux1 upper(z[0], a[0], b[0], c); // first mux
    // yMux1 lower(z[1], a[1], b[1], c); // second mux


endmodule