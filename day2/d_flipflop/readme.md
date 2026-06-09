# D Flip-Flop (D FF)

## Overview

A D Flip-Flop (Data Flip-Flop) is a sequential digital circuit used to store one bit of data. It transfers the input value (`D`) to the output (`Q`) on the active edge of the clock signal.

## Features

* Stores one bit of data.
* Edge-triggered operation.
* Widely used in registers, counters, and memory circuits.

## Inputs

| Input | Description  |
| ----- | ------------ |
| D     | Data input   |
| CLK   | Clock signal |

## Outputs

| Output | Description     |
| ------ | --------------- |
| Q      | Stored output   |
| Q'     | Complement of Q |

## Working

* When the clock edge occurs, the value at the `D` input is copied to the `Q` output.
* The output remains unchanged until the next clock edge.

### Truth Table

| Clock Edge | D | Q (Next State) |
| ---------- | - | -------------- |
| ↑          | 0 | 0              |
| ↑          | 1 | 1              |

## Example

If:

* D = 1
* A clock edge occurs

Then:

* Q = 1

If D changes afterward, Q remains unchanged until the next clock edge.

## Applications

* Data storage
* Shift registers
* Counters
* Memory devices
* Digital systems


