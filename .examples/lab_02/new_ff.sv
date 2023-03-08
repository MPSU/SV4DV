module new_ff (
    input  logic clk,
    input  logic a,
    input  logic b,
    output logic c
);

    // Flip-flop here
    always_ff @(posedge clk) begin
        c <= a | b;
    end

endmodule