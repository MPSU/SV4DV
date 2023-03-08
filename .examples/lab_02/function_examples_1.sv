module function_examples_1;

    function int sum(int a, int b);
        return (a + b);
    endfunction

    function void print(int a);
        $display(a);
    endfunction

    function bit sum2(int a, int b, output int sum);
        sum = a + b;
        if( sum == 10 ) return 1;
        else return 0;
    endfunction

    initial begin

        int c, d;

        // Set 'c' to the 'sum()' return value
        c = sum(2, 7);

        // Print 'c'
        // This function is called without assigning
        print(c);

        // Here we use result of 'sum' as part of the expression
        d = 5 + sum(2, 10);

        print(c);

        // We can use non-void function without assigning return
        // value, but warning will appear
        sum2(5, 5, c);

        // To suppress warning - use static void cast
        void'(sum2(5, 5, c));

        print(c);

        $finish();

    end

endmodule