module fulladder(                              // module = KEYWORD, fulladder = NAME you chose
    input a, b, cin,                           // input = KEYWORD, a b cin = NAMES you chose (the 3 inputs)
    output sum, cout                           // output = KEYWORD, sum cout = NAMES you chose (the 2 outputs)
);                                             // closes the port list
    wire s1, c1, c2;                           // wire = KEYWORD, s1 c1 c2 = NAMES you chose (small wires inside the chip, we only watch them)

    halfadder ha1 (.a(a), .b(b), .sum(s1), .carry(c1));        // halfadder = the module you already made, ha1 = NAME you chose for this copy; HA1 adds a + b
    halfadder ha2 (.a(s1), .b(cin), .sum(sum), .carry(c2)); // ha2 = NAME you chose for the 2nd copy; HA2 adds s1 + cin

    assign cout = c1 | c2;                     // assign = KEYWORD; | is the OR sign; cout = c1 OR c2
endmodule                                      // endmodule = KEYWORD, ends the chip