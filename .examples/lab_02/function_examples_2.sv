module function_examples_2;

    // User integer array definition
    typedef int intarr [];

    // Use 'intarr' to return int []
    // Note: arguments can be declared as [],
    //       so this is only return type restriction
    function intarr func_arr(int a [], int b []);
        return {a, b};
    endfunction
    
    initial begin
        int a [];
        a = func_arr({4}, {5});
        $display("%p", a);
        $finish();
    end

endmodule