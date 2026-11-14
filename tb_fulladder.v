module tb_fulladder;
reg a,b,cin;
wire sum,cout;
reg expected_sum, expected_cout;
integer i;

fulladder dut (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

initial begin

for (i=0; i<8; i=i+1) begin

{a,b,cin} = i;
{expected_cout,expected_sum} = a+b+cin;
#10;

if (sum !== expected_sum || cout !== expected_cout)
$display("Fail: a=%b,b=%b, cin = %b, sum=%b, cout=%b",a,b,cin,sum,cout);
else
$display (" Pass : a=%b,b=%b, cin = %b, sum=%b, cout=%b",a,b,cin,sum,cout);
end
$finish;
end
endmodule
