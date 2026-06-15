# FIFO Transaction Class in SystemVerilog

## Overview

This project demonstrates the creation and randomization of a FIFO (First-In First-Out) transaction class using SystemVerilog. The transaction class is commonly used in verification environments to model FIFO read and write operations.

The implementation generates randomized FIFO transactions while ensuring that read and write operations do not occur simultaneously.

---

## Features

* Randomized FIFO transactions
* Read and write enable signals
* 8-bit input data generation
* Constraint-driven randomization
* Transaction display method for debugging
* Simple testbench for simulation

---

## Transaction Class

### Signals

| Signal   | Type           | Description           |
| -------- | -------------- | --------------------- |
| wr_en    | rand bit       | Write enable          |
| rd_en    | rand bit       | Read enable           |
| data_in  | rand bit [7:0] | Input data to FIFO    |
| data_out | bit [7:0]      | Output data from FIFO |
| full     | bit            | FIFO full flag        |
| empty    | bit            | FIFO empty flag       |

---

## Constraint

```systemverilog
constraint wr_rd_c {
    wr_en != rd_en;
}
```
It ensures that:

* Only a read operation occurs, or
* Only a write operation occurs

The following combinations are generated:

| wr_en | rd_en | Operation |
| ----- | ----- | --------- |
| 1     | 0     | Write     |
| 0     | 1     | Read      |

The following combinations are not allowed:

| wr_en | rd_en | Reason                      |
| ----- | ----- | --------------------------- |
| 0     | 0     | No operation                |
| 1     | 1     | Simultaneous read and write |

---

## Display Method

```systemverilog
function void display(string s);
    $display("[%s] wr_en=%0b rd_en=%0b data_in=%0h data_out=%0h full=%0b empty=%0b",
             s, wr_en, rd_en, data_in, data_out, full, empty);
endfunction
```

## Simulation Flow

1. Create a transaction object using `new()`.
2. Randomize transaction variables using `randomize()`.
3. Apply constraints during randomization.
4. Display transaction information.
5. Repeat for multiple transactions.

---


