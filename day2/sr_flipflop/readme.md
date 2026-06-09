# SR Flip-Flop

## Overview

An SR (Set-Reset) Flip-Flop is a basic sequential logic circuit used to store one bit of data. It has two inputs, **Set (S)** and **Reset (R)**, and two outputs, **Q** and **Q̅** (complement of Q).

## Inputs and Outputs

### Inputs

* **S (Set)** – Sets the output Q to 1.
* **R (Reset)** – Resets the output Q to 0.

### Outputs

* **Q** – Current state.
* **Q̅** – Complement of Q.

## Truth Table

| S | R | Q (Next State) |
| - | - | -------------- |
| 0 | 0 | No Change      |
| 0 | 1 | 0 (Reset)      |
| 1 | 0 | 1 (Set)        |
| 1 | 1 | Invalid State  |

## Working

* When **S = 1** and **R = 0**, the flip-flop is set and Q becomes 1.
* When **S = 0** and **R = 1**, the flip-flop is reset and Q becomes 0.
* When **S = 0** and **R = 0**, the previous state is retained.
* When **S = 1** and **R = 1**, the state is invalid and should be avoided.

## Applications

* Memory storage circuits
* Digital registers
* Counters
* Sequential logic systems

