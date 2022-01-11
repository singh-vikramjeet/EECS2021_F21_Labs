// Part 2: Adding (Propagation) Delays to the Model
module LabI_part2;

    reg[31:0] x,y,z;
    integer i;
    
    initial
    $monitor("%2d: x=%1d y=%1d z=%1d", $time, x, y, z);

/*    initial 
    begin
        for(i = 0; i < 4; i=i+1)
            #7 x = x + 1;    
    end
*/
    always
    #7 x = x + 1;
    
    initial
    begin
        #10 x = 5;      // delay of 10 units added
        $display("%2d:x=%1d y=%1d z=%1d", $time, x,y,z);
        #10 y = x + 1;  // delay added
        $display("%2d:x=%1d y=%1d z=%1d", $time, x,y,z);
        #10 z = y + 1;  // delay addediv
        $display("%2d:x=%1d y=%1d z=%1d", $time, x,y,z);
        #10 $finish;
    end
endmodule