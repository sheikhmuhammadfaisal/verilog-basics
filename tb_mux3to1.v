`timescale 1ns/1ps
module tb_mux3to1;
    reg d0, d1, d2;
    reg [1:0] sel;
    wire y;

    mux3to1 dut (.d0(d0), .d1(d1), .d2(d2), .sel(sel), .y(y));

    initial begin
        $monitor("time=%0d d0=%b d1=%b d2=%b sel=%b y=%b", $time, d0, d1, d2, sel, y);
        d0 = 0; d1 = 1; d2 = 1;
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;
        d0 = 1; d1 = 0; d2 = 0;
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;
        $finish;
    end
endmodule