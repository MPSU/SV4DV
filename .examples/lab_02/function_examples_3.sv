module function_examples_3;

    function void print (string a = "Hello", string b = " world");
        $display({a, b});
    endfunction

    initial begin
        print();
        print(.b(", Sam"));
        $finish();
    end

endmodule