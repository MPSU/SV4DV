module fork_join_example_5;

    timeunit 1ns;

    function void run_another_process();
        fork
            #40 $display("Process 2 finished at time %0d", $realtime());
        join_none
    endfunction

    initial begin
        run_another_process();
        fork
            #10 $display("Process 0 finished at time %0d", $realtime());
            #20 $display("Process 1 finished at time %0d", $realtime());
        join_any
        $display("Parallel block finished at time %0d", $realtime());

        disable fork; // This will kill process 1 and (!!!) process 2,
                      // because they are both descendants of the
                      // initial process
        #50;
        $finish();
    end

endmodule