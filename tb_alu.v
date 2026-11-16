module tb_alu;                                  // module = KEYWORD, tb_alu = NAME you chose (no pins)
    reg  [3:0] a, b;                            // reg = KEYWORD; we SET these (4 bits each)
    reg  [1:0] op;                              // we SET this (2 bits, picks the operation)
    wire [3:0] result;                          // wire = KEYWORD; we only WATCH this
    reg  [3:0] expected;                        // the right answer we work out ourselves
    integer i;                                  // integer = KEYWORD; i counts 0 to 1023

    alu dut (.a(a), .b(b), .op(op), .result(result)); // alu = your chip; dut = NAME you chose; plugs it in

    initial begin                               // initial, begin = KEYWORDS (runs once)
        for (i=0; i<1024; i=i+1) begin          // 10 input bits (2 + 4 + 4) = 2^10 = 1024 tests
            {op,a,b} = i;                       // splits i into op (2 bits), a (4 bits), b (4 bits)
            case (op)                           // case = KEYWORD; works out the right answer for this op
                2'b00: expected = a+b;        // add: a plus b
                2'b01: expected = a-b ;        // subtract: a minus b
                2'b10: expected = a&b ;        // AND
                2'b11: expected = a|b ;        // OR
            endcase                             // endcase = KEYWORD
            #10;                                // wait 10 time units
            if (result !== expected)            // !== means "not equal"
                $display("Fail: op=%b a=%d b=%d result=%d expected=%d", op, a, b, result, expected); // prints Fail
            else                                // else = KEYWORD
                $display("Pass: op=%b a=%d b=%d result=%d", op, a, b, result);  // prints Pass
        end                                     // ends the for loop
        $finish;                                // $finish = KEYWORD, stops the simulation
    end                                         // ends initial
endmodule                                       // ends the test bench