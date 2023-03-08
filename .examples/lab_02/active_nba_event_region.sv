module active_nba_event_region;

    bit p, q, clk;

    // All begin-end blocks below are executed in parallel
    // |
    // V

    // Generate clock
    initial begin
        clk <= 0;
        forever begin
            #10 clk <= ~clk;
        end
    end

    // 'p <= q' will be evaluated in NBA event region
    // after '@(posedge clk)' in previous Active event region
    always_ff @(posedge clk) begin
        p <= q;
    end

    initial begin
        q = 1;
        @(posedge clk); // Wait for clock
        $display(p);    // Here p = 0
        #1;             // Step to the next time event
        $display(p);    // Print updated value
        $finish();
    end

endmodule