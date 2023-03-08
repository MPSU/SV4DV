module fork_join_example_6;

    timeunit 1ns;

    function void run_another_process();
        fork
            #40 $display("Process 2 finished at time %0d", $realtime());
        join_none
    endfunction

    initial begin
        run_another_process();
        fork begin // Thread wrapper begin

            fork
                #10 $display("Process 0 finished at time %0d", $realtime());
                #20 $display("Process 1 finished at time %0d", $realtime());
            join_any
            $display("Parallel block finished at time %0d", $realtime());

            disable fork; // This will kill only process 1, process 2
                          // will be completed

        end join // Thread wrapper end
        #50;
        $finish();
    end

endmodule