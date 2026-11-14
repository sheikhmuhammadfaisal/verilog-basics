module tb_halfadder;
reg a,b;
wire sum,carry;
reg expected_sum,expected_carry;
integer i;

halfadder dut (.a(a),.b(b),.sum(sum),.carry(carry));

initial begin

for (i=0; i<4; i=i+1)begin
   {a,b}=i;
  {expected_carry,expected_sum} = a+b;
   #10;
if (sum!==expected_sum || carry!== expected_carry)
$display("Fail:a=%b,b=%b,sum=%b,carry=%b",a,b,sum,carry);
else 
$display("Pass: a=%b,b=%b,sum=%b,carry=%b",a,b,sum,carry);
end
$finish;
end
endmodule