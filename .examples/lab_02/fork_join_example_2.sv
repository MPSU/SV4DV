module fork_join_example_2;

    timeunit 1ns;

    initial begin
        fork
            #10 $display("Process 0 finished at time %0d", $realtime());
            #20 $display("Process 1 finished at time %0d", $realtime());
        join_any
        $display("Parallel block finished at time %0d", $realtime());
        #50;
        $finish();
    end

endmodule