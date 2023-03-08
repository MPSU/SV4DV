module simple_event_wait;

    logic clk;

    initial begin
        clk <= 0;
        forever #5 clk <= ~clk;
    end

    initial begin
        @(posedge clk);
        $display("Got clk at time %0d", $realtime());
        $finish();
    end

endmodule