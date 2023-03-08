module function_examples_4;

    function automatic int factorial (input int operand);
        if (operand >= 2) factorial = factorial (operand - 1) * operand;
        else factorial = 1;
    endfunction

    int result;
    initial begin
        for (int n = 0; n <= 4; n++) begin
            result = factorial(n);
            $display("%0d factorial=%0d", n, result);
        end
        $finish();
    end

endmodule