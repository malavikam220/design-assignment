# BCD Adder

## Overview

A BCD (Binary Coded Decimal) Adder is a digital circuit used to add two decimal digits represented in BCD format.
The circuit first performs binary addition. If the sum is greater than 9 (1001 in binary) or produces a carry, a correction value of 6 (0110) is added to obtain a valid BCD result.

## Features

* Adds two BCD digits.
* Generates a valid BCD output.
* Produces carry output when required.
* Useful for decimal arithmetic in digital systems.

## Inputs

| Input  | Description      |
| ------ | ---------------- |
| A[3:0] | First BCD digit  |
| B[3:0] | Second BCD digit |
| Cin    | Carry input      |

## Outputs

| Output   | Description  |
| -------- | ------------ |
| Sum[3:0] | BCD sum      |
| Cout     | Carry output |

## Working

1. Add the two BCD digits and carry input.
2. Check whether the result is greater than 9 or a carry is generated.
3. If required, add 0110 (decimal 6) as correction.
4. Produce the final BCD sum and carry output.

## Example

A = 0101 (5)

B = 0111 (7)

Binary Sum = 1100 (12)

Since 12 is not a valid BCD digit, add 0110:

1100 + 0110 = 1 0010

Result:

* Sum = 0010 (2)
* Carry = 1

Therefore, 5 + 7 = 12.

## Applications

* Digital calculators
* Digital clocks
* Counters
* Arithmetic Logic Units (ALUs)


