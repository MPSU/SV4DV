`timescale 1ns/100ps
module simple_delay;

    int a;

    initial begin
        a = 5;
        #5.07; // 5.1ns delay here, because time precision
               // is 100ps = 0.1ns -> 5.07 ~ 5.1
        a = 10;
        $finish();
    end

endmodule