module active_event_region;

    logic p, q;

    // 'assign' and 'initial' runs in parallel
    // |
    // V
    
    assign p = q;

    initial begin
        q = 1;
        #1 q = 0;
        $display(p); // Can be evaluated before 'assign p = q;'
        $finish();
    end

endmodule