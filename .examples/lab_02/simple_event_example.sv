module simple_event_example;

    timeunit 10ns;

    event e;

    // Process 0
    initial begin
        #1;
        $display("Process 0: Triggerring event at time %0d", $realtime());
        -> e;
    end

    // Process 1
    initial begin
        $display("Process 1: Waiting event at time %0d", $realtime());
        @(e);
        $display("Process 1: Got event at time %0d", $realtime());
        $finish();
    end

endmodule