`timescale 1ns/1ps
module tb_mux4to1_self;
    reg d0, d1, d2, d3;
    reg [1:0] sel;
    wire y;
    reg expected;
    integer errors, tests, i, j;

    mux4to1 dut (.d0(d0), .d1(d1), .d2(d2), .d3(d3), .sel(sel), .y(y));

    initial begin
        errors = 0;
        tests  = 0;
        for (i = 0; i < 16 ; i = i + 1) begin
            {d0, d1, d2, d3} = i;
            for (j = 0; j < 4; j = j + 1) begin
                sel = j;
                case (sel)
                    2'b00: expected = d0;
                    2'b01: expected = d1;
                    2'b10: expected = d2;
                    2'b11: expected = d3;
                endcase
                #10;
                tests = tests + 1;
                if (y !== expected) begin
                    errors = errors + 1;
                    $display("FAIL: d=%b%b%b%b sel=%b y=%b expected=%b", d0, d1, d2, d3, sel, y, expected);
                end
            end
        end
        if (errors == 0)
            $display("ALL %0d TESTS PASSED", tests);
        else
            $display("%0d of %0d TESTS FAILED", errors, tests);
        $finish;
    end
endmodule