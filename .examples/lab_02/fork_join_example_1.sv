module fork_join_example_1;

    initial begin
        fork
            // All this lines are executing in parallel
            #50  $display("Process 0 finished at time %0d", $realtime());
            #100 $display("Process 1 finished at time %0d", $realtime());
            #150 $display("Process 2 finished at time %0d", $realtime());
            #200 $display("Process 3 finished at time %0d", $realtime());
        join
        $finish();
    end

endmodule