module mailbox_example;

    timeunit 10ns;

    mailbox#(string) box = new();

    // Process 0
    initial begin
        static string message = "Hello!";
        #5; // Wait and put message
        box.put(message);
        $display("Process 0: Set message '%s' at time %0d", message, $realtime());
    end

    // Process 1
    initial begin
        string message;
        while(!box.try_get(message)) begin // Try to get message
            $display("Process 1: No message at time %0d", $realtime());
            #2;
        end
        $display("Process 1: Got message '%s' at time %0d", message, $realtime());
        $finish();
    end

endmodule