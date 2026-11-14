module tb_adder4;                               // module = KEYWORD, tb_adder4 = NAME you chose (no pins)
    reg  [3:0] a, b;                            // reg = KEYWORD; we SET these; [3:0] = 4 bits each
    reg        cin;                             // we SET this single bit
    wire [3:0] sum;                             // wire = KEYWORD; we only WATCH these 4 bits
    wire       cout;                            // we only WATCH this bit
    reg  [4:0] expected;                        // 5 bits wide: 4 sum digits + 1 cout digit (the right answer we work out ourselves)
    integer i;                                  // integer = KEYWORD; i counts 0 to 511

    adder4 dut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout)); // adder4 = your chip, dut = NAME you chose; plugs the chip in

    initial begin                               // initial, begin = KEYWORDS (runs once)
        for (i=0; i<512; i=i+1) begin           // for = KEYWORD; 512 rounds, because 9 input bits = 2^9 = 512
            {a,b,cin} = i;                      // splits the number i into a (4 bits), b (4 bits) and cin (1 bit)
            expected = a+b+cin ;                   // the right answer: add the three inputs (it fits in 5 bits)
            #10;                                // wait 10 time units
            if ({cout,sum} !== expected)        // if = KEYWORD; {cout,sum} glues the 5 output digits together; !== means "not equal"
                $display("Fail: a=%d b=%d cin=%b sum=%d cout=%b", a, b, cin, sum, cout); // $display = KEYWORD; %d prints a normal number
            else                                // else = KEYWORD
                $display("Pass: a=%d b=%d cin=%b sum=%d cout=%b", a, b, cin, sum, cout); // prints Pass
        end                                     // ends the for loop
        $finish;                                // $finish = KEYWORD, stops the simulation
    end                                         // ends initial
endmodule                                       // ends the test bench