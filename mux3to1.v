module mux3to1 (
    input  d0, d1, d2,
    input  [1:0] sel,
    output reg y
);
    always @(*) begin
        case (sel)
            2'b00:   y = d0;
            2'b01:   y = d1;
            2'b10:   y = d2;
            default: y = 1'b0;
        endcase
    end
endmodule