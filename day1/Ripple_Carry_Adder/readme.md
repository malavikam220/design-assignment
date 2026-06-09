# Ripple Carry Adder

## Overview

This project implements a Ripple Carry Adder (RCA) using digital logic design principles. A Ripple Carry Adder is a combinational circuit used to add two binary numbers. It consists of a series of full adders connected in cascade, where the carry output of one stage becomes the carry input of the next stage. The carry signal propagates through each stage, creating a ripple effect.

## Features

* Binary addition of two N-bit numbers
* Modular design using Full Adders
* Carry propagation between stages
* Suitable for FPGA, Verilog, VHDL, and Digital Logic simulations
* Educational implementation for Digital Electronics courses

## Theory

A Ripple Carry Adder is constructed by connecting multiple Full Adders in series. Each Full Adder adds:

* Input bit A
* Input bit B
* Carry input (Cin)

and produces:

* Sum output (S)
* Carry output (Cout)

The carry output from one stage is connected to the carry input of the next stage. Because the carry must travel through each stage before the final result is available, the propagation delay increases with the number of bits.

### Full Adder Equations

Sum:

S = A ⊕ B ⊕ Cin

Carry:

Cout = (A · B) + (Cin · (A ⊕ B))

## Working Example

Consider:

A = 1010

B = 1011

Cin = 0

The Ripple Carry Adder performs addition bit by bit from the least significant bit (LSB) to the most significant bit (MSB). The carry generated at each stage propagates to the next stage until the final carry output is obtained.

Result:

```text
  1010
+ 1011
------
 10101
```

## Simulation

### Inputs

* A[N-1:0]
* B[N-1:0]
* Cin

### Outputs

* Sum[N-1:0]
* Cout

### Expected Output

The output should match the binary addition of inputs A and B.

## Applications

* Arithmetic Logic Units (ALUs)
* Processors and Microcontrollers
* Digital Signal Processing Systems
* FPGA and ASIC Designs
* Educational Digital Logic Projects


