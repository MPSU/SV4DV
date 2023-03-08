module new_comb (
    input  logic a,
    input  logic b,
    output logic c
);

    // Simple OR here
    always_comb begin
        c = a | b;
    end

endmodule