module adder4(                                  // module = KEYWORD, adder4 = NAME you chose
    input  [3:0] a, b,                          // input = KEYWORD; [3:0] = a bundle of 4 wires (bit 0 is rightmost); a b = NAMES you chose
    input        cin,                           // cin = NAME you chose, a single wire that goes into column 0 only
    output [3:0] sum,                           // output = KEYWORD; sum = NAME you chose, 4 wires (one answer digit per column)
    output       cout                           // cout = NAME you chose, the 5th digit of the answer
);                                              // closes the port list
    wire c1, c2, c3;                            // wire = KEYWORD; c1 c2 c3 = NAMES you chose, the carry wires between the columns

    fulladder fa0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1));  // fulladder = your chip, fa0 = NAME you chose (column 0); a[0] = bit 0 of a; its cout goes out on wire c1
    fulladder fa1 (.a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2)); // column 1: its cin comes from column 0's cout; its cout goes to the wire for column 2
    fulladder fa2 (.a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3)); // column 2: cin from column 1's cout; cout goes to the wire for column 3
    fulladder fa3 (.a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(cout)); // column 3: cin from column 2's cout; its cout is the final cout of the whole adder
endmodule                                       // endmodule = KEYWORD, ends the chip