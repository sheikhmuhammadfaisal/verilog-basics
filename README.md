# verilog-basics

Learning digital design in Verilog. Each project has a design file and a testbench, simulated with Icarus Verilog.

## 2:1 MUX
- `mux2to1.v`: 2-input multiplexer.
- `tb_mux2to1_v4.v`: self-checking testbench. A loop tries all 4 data patterns with both select values, and prints PASS or FAIL for each.

## 3:1 MUX
- `mux3to1.v`: 3-input multiplexer with a 2-bit select. Select 11 has no input, so the output defaults to 0.
- `tb_mux3to1.v`: basic testbench that prints each case.
- `tb_mux3to1_self.v`: self-checking testbench. It tries all 32 combinations and prints FAIL if the output is wrong.

I tested the testbench by breaking the design on purpose (select 10 picked d1 instead of d2). 4 of 32 tests failed, as they should. After the fix, all 32 passed.

## 4:1 MUX
- `mux4to1.v`: 4-input multiplexer with a 2-bit select.
- `tb_mux4to1_self.v`: exhaustive self-checking testbench with 64 tests.

My first version had a width bug (`sel` was declared 1 bit instead of 2). A weak test with one data pattern passed it. The exhaustive test caught it with 16 failures out of 64.

## How to run (example: 3:1 MUX)
```
iverilog -o sim3s mux3to1.v tb_mux3to1_self.v
vvp sim3s
```
