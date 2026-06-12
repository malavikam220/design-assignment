# BCD Adder Using SystemVerilog Interface

## Overview

This project demonstrates the implementation of a **BCD (Binary Coded Decimal) Adder** using **SystemVerilog Interfaces**. The design adds two 4-bit BCD digits and applies BCD correction whenever the sum exceeds 9.

The project is intended for beginners learning:

* SystemVerilog modules
* Interfaces
* DUT (Design Under Test) connections
* Testbench development
* Basic digital design concepts

---

## Project Structure

```text
bcd_adder.sv       -> BCD Adder Design
interface_tb.sv    -> Testbench using Interface
README.md          -> Documentation
```

---

## Design Description

### BCD Adder

A BCD digit can represent decimal values from 0 to 9.

When two BCD digits are added:

1. Perform normal binary addition.
2. If the result is greater than 9, add 6 (0110) as a correction factor.
3. The corrected result becomes a valid BCD representation.

Example:

```text
8 + 3 = 11
```

Binary addition:

```text
1000
0011
----
1011 (11 decimal)
```

Since 11 > 9, add 6:

```text
1011
0110
----
10001
```

BCD Result:

```text
0001 0001
  1    1
```

which represents decimal 11.

---

## Interface

```systemverilog
interface bcd_if;
    logic [3:0] a, b;
    logic [4:0] s;
endinterface
```

The interface is used to connect the DUT and testbench signals.

| Signal | Width | Description          |
| ------ | ----- | -------------------- |
| a      | 4-bit | First BCD input      |
| b      | 4-bit | Second BCD input     |
| s      | 5-bit | Corrected BCD output |

---

## Testbench

The testbench:

* Instantiates the interface.
* Connects the DUT through the interface.
* Applies different test vectors.
* Displays results using `$monitor`.

Example test cases:

| A | B | Result |
| - | - | ------ |
| 4 | 5 | 9      |
| 7 | 2 | 9      |
| 8 | 3 | 11     |

---

## Simulation Output

```text
BCD Addition: 4 + 5 = 1001
BCD Addition: 7 + 2 = 1001
BCD Addition: 8 + 3 = 10001
```








