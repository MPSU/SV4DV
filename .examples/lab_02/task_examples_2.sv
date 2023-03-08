module task_examples_2;

    timeunit 1ns;

    // Static by default
    task my_task(input int a, output int b);
        // Variable 'b' will be saved between calls
        b = b + a;
    endtask

    // Automatic via keyword
    task automatic my_task_auto(input int a, output int b);
        // Variable 'b' will be reallocated between calls
        b = b + a;
    endtask

    initial begin

        int b;

        // Call static task twice
        $display("\nStatic");
        repeat(2) begin
            my_task(1, b);
            $write("b = %0d; ", b);
        end

        // Reset 'b'
        b = 0;

        // Call automatic task twice
        $display("\nAutomatic");
        repeat(2) begin
            my_task_auto(1, b);
            $write("b = %0d; ", b);
        end

        $finish();

    end


endmodule