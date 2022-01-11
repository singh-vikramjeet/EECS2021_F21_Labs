// Part 5: Checking in with the Oracle

module LabI_part5;

    reg a, b; // reg without size means 1-bit
    wire z;

    integer i, j, expect; // for the loops

    // two logic gates and connections between them
    not my_not(tmp, b);
    and my_and(z, a, tmp);

    initial 
    begin
        for (i = 0; i < 2; i = i + 1)
            begin
                for(j = 0; j < 2; j = j + 1)
                begin
                    a = i; b =j;
                    a = i; b = j;
                    expect = i & ~b;
                    #1; // wait for z
                    if(expect === z)
                        $display("PASS: a=%b b=%b z=%b", a, b, z);
                    else
                        $display("FAIL: a=%b b=%b z=%b", a, b, z);
                end
            end
        $finish;
    end


endmodule