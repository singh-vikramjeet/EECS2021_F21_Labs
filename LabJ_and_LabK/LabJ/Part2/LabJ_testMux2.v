// This program has syntax error and does not compile
// Make sure you fix the error before uploading this to github

module LabJ_testMux2
    reg[1:0] a, b; // 2 bits each
    reg[0:0] c; // 1 bit only
    integer i, j, k, l, m; // used for for loops
    output [1:0] z;

    yMux2 my2bitmux(z, a, b, c); // 2 bit mux object

    initial 
    begin
        $monitor("2d a = %2b b = %2b c=%2b z = %2b", $time, a, b, c, z);
        
    end

    initial
    begin
        for(i = 0; i < 4; i = i + 1)
        begin
            for (j = 0; j < 4; j = j + 2)
            begin
                for(k = 0; k < 2; k=k+1)
                begin
                    #1 a=i; b=j; c=k;
        end
        
    end


endmodule