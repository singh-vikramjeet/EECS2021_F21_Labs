module labI_Part1;

// The filename does not have to match the module name

    reg[31:0] x; // a 32 bit register
    reg[0:0] one;// 1 bit register
    reg[1:0] two;// 2 bit register
    reg[2:0] three;// 3 bit register 
        initial 
        begin
            $display("time=%5d, x=%b", $time,x);
            // Syntax for integer literals
            // [size in bits]['base]value
            x = 32'hffff0000;
            $display("time=%5d, x=%b", $time,x);
            x = x + 2;
            $display("time=%5d, x=%b", $time,x);

            // Assign values.
            one = &x; // and reduction
            two = x[1:0];// part-select
            three = {one, two}; // concatenate

            $display("New variables...");
            $display("time = %5d, one = %b", $time, one);
            $display("time = %5d, two = %b", $time, two);
            $display("time = %5d, three = %b", $time, three);


            $finish;
            
        end
endmodule