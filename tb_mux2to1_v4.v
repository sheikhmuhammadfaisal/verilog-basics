//step 1: Make module
module tb_mux2to1;

reg d0, d1,sel;   //reg (we set the value)
wire y;        //wire (we js watch the value)
reg expected;    //again reg because we set the value & expected cause we can use any name for the right value we put in
integer i;                 //New for loop 

//step:2 Plug in the chip


mux2to1 dut (.d0(d0), .d1(d1), .s(sel), .y(y));



// start the script

initial begin
for (i=0;i<4;i=i+1) begin
 {d0,d1}=i;
sel=0; expected=d0; #10;

if (y!==expected)
    $display("Test Fail: d0=%b,d1=%b,sel=%b,y=%b,expected=%b",d0,d1,sel,y,expected);
else 
$display ("Test Pass:  d0=%b,d1=%b,sel=%b,y=%b", d0,d1,sel,y);


sel = 1; expected = d1;#10;
if (y!==expected)
    $display("Fail: d0=%b,d1=%b,sel=%b, y=%b, expected=%b",d0,d1,sel,y,expected);
    else 
     $display("Pass: d0=%b,d1=%b,sel=%b, y=%b", d0,d1,sel,y);
end
$finish;
end
endmodule
