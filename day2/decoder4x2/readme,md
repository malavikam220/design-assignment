# 4-to-2 Encoder

## Overview

A 4-to-2 Encoder is a combinational logic circuit that converts one active input out of four inputs into a 2-bit binary output.

## Truth Table

| Input       | Output |
| ----------- | ------ |
| D3 D2 D1 D0 | Y1 Y0  |
| 0 0 0 1     | 0 0    |
| 0 0 1 0     | 0 1    |
| 0 1 0 0     | 1 0    |
| 1 0 0 0     | 1 1    |

## Inputs

* D0, D1, D2, D3 – Input lines

## Outputs

* Y1, Y0 – Binary encoded output

## Logic Equations

```text
Y1 = D2 + D3
Y0 = D1 + D3
```

## Working

* If D0 is active, the output is `00`.
* If D1 is active, the output is `01`.
* If D2 is active, the output is `10`.
* If D3 is active, the output is `11`.

Only one input should be active at a time for correct operation.

## Applications

* Data compression
* Keyboard encoding
* Digital communication systems
* Interrupt handling systems


