module yAdder1(z, cout, a, b, cin);
    
    output z, cout;
    input a, b, cin;

    wire outAndL, outAndR, outXorL;

    // Logic for the Adder
    xor left_xor(outXorL, a, b);
    xor right_xor(z, cin, outXorL);
    and left_and(outAndL, a, b);
    and right_and(outAndR, outXorL, cin);
    or my_or(cout, outAndR, outAndL);


endmodule