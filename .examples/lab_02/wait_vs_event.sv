module wait_vs_event;

    timeunit 1ns;

    bit a;

    initial begin
        #5; a = 1; // 'a' triggers at 5ns
        $display("Set 'a' at time %0d", $realtime());
    end

    initial begin
        #10;
        $display("@: Wait 'a' at time %0d", $realtime());
        @(a); // This will stuck forever, as 'a' was triggered earlier
        $display("@: Got 'a' at time %0d", $realtime());
    end

    initial begin
        #10;
        $display("wait: Wait 'a' at time %0d", $realtime());
        wait(a); // This will not stuck and will be evaluated immediately
        $display("wait: Got 'a' at time %0d", $realtime());
        $finish();
    end


endmodule