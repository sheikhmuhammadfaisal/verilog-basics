module alu(                                     // module = KEYWORD, alu = NAME you chose
    input  [3:0] a, b,                          // input = KEYWORD; a b = NAMES you chose (the two numbers)
    input  [1:0] op,                            // op = NAME you chose, the 2-bit "button"
    output reg [3:0] result                     // output, reg = KEYWORDS; result = NAME you chose
);                                              // closes the port list

    always @(*) begin                           // always, begin = KEYWORDS; @(*) = "redo this whenever any input changes"
        case (op)                               // case = KEYWORD; looks at op to pick one line
            2'b00:   result = a+b ;            // 2'b00 = "2 bits, value 00" (add); fill in: a plus b
            2'b01:   result = a-b ;            // value 01 (subtract); fill in: a minus b
            2'b10:   result = a&b ;            // value 10 (AND); fill in: a AND b (use &)
            2'b11:   result = a|b ;            // value 11 (OR); fill in: a OR b (use |)
            default: result = 4'b0000;          // default = KEYWORD; covers anything else, sets result to 0000
        endcase                                 // endcase = KEYWORD, ends the case
    end                                         // end = KEYWORD, ends the always block

endmodule                                       // endmodule = KEYWORD