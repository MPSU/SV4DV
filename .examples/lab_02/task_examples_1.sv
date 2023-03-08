module task_examples_1;

    timeunit 1ns;

    task task_input_output(input int a, output int b);
        #10; b = a;
        // After 10ns b will be set to a and can 
        // be obtained from the outside routine
    endtask

    task task_inout(inout int a);
        int a_tmp;
        a_tmp = a;
        a = a_tmp*2;
        // This equal to a = a*2;
    endtask

    task automatic task_ref(ref bit signal);
        repeat(2) @(posedge signal);
        // We can track 'signal' change as it
        // passed by reference so all changes
        // are vivible inside this task
    endtask

    initial begin

        int c; bit s;

        // Set 'c' to 5
        task_input_output(5, c);
        $display("c = %0d at time %0d", c, $realtime());

        // Set 'c' = 'c'*2 = 10
        task_inout(c);
        $display("c = %0d at time %0d", c, $realtime());

        // Initiate posedges for 's'
        fork
            repeat(3) #5 s <= ~s;
        join_none

        // Catch posedges
        task_ref(s);
        $display("All tasks ended at time %0d", $realtime());

        $finish();

    end

endmodule