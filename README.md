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

## Adders

- `halfadder.v` : adds two bits (sum = a XOR b, carry = a AND b).
- `tb_halfadder.v` : self-checking testbench, 4 tests.
- `fulladder.v` : adds a, b and a carry-in (cin). Built from two half adders and an OR gate.
- `tb_fulladder.v` : self-checking testbench, all 8 input combinations.
- `adder4.v` : 4-bit adder made of 4 full adders in a row. The carry-out of each column feeds the carry-in of the next one.
- `tb_adder4.v` : exhaustive self-checking testbench. 9 input bits (a[3:0], b[3:0], cin) give 512 tests, all passing.

I tested the 4-bit adder testbench by breaking the design on purpose (wired column 2 to the wrong carry). Tests failed, as they should. After the fix, all 512 passed.

## How to run (example: 3:1 MUX)
```
iverilog -o sim3s mux3to1.v tb_mux3to1_self.v
vvp sim3s
iverilog -o a4 adder4.v fulladder.v halfadder.v tb_adder4.v
vvp a4
```
