# verilog-basics

Learning digital design in Verilog. Each project has a design file and a testbench, simulated with Icarus Verilog.

## 3:1 MUX
- `mux3to1.v`: 3-input multiplexer with a 2-bit select. Select 11 has no input, so the output defaults to 0.
- `tb_mux3to1.v`: basic testbench that prints each case.
- `tb_mux3to1_self.v`: self-checking testbench. It tries all 32 combinations and prints FAIL if the output is wrong.

I tested the testbench by breaking the design on purpose (select 10 picked d1 instead of d2). 4 of 32 tests failed, as they should. After the fix, all 32 passed.

## How to run
iverilog -o sim3s mux3to1.v tb_mux3to1_self.v
vvp sim3s
