module mux2to1 (
input wire d0,
input wire d1,
input wire s,
output wire y
);
assign y=s?d1:d0;
endmodule