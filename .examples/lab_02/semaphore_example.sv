module semaphore_example;

    timeunit 10ns;

    semaphore sem = new(1);

    // Process 0
    initial begin
        sem.get(1);
        $display("Process 0: Got key at time %0d", $realtime);
        #10;
        sem.put(1);
    end

    // Process 1
    initial begin
        #1;
        sem.get(1); // Will stuck here intil process key return at 10ns
        $display("Process 1: Got key at time %0d", $realtime);
        #10;
        sem.put(1);
        $finish();
    end

endmodule