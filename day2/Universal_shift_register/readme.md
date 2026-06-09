# Universal Shift Register

## Overview

A Universal Shift Register is a digital circuit that can perform multiple operations on binary data. It can store data, shift data to the left, shift data to the right, and load data in parallel.

It is called "universal" because it supports all basic shift register operations.

## Features

* Parallel Load
* Shift Left
* Shift Right
* Data Storage (Hold)
* Clock Controlled Operation

## Inputs

| Input           | Description                     |
| --------------- | ------------------------------- |
| Clock           | Synchronizes operations         |
| Reset           | Clears the register             |
| Serial In Left  | Input for right shift operation |
| Serial In Right | Input for left shift operation  |
| Parallel Input  | Data loaded simultaneously      |
| Select Lines    | Choose the operation mode       |

## Outputs

| Output | Description          |
| ------ | -------------------- |
| Q[n:0] | Register output data |

## Operations

| Select Lines | Operation        |
| ------------ | ---------------- |
| 00           | Hold (No Change) |
| 01           | Shift Right      |
| 10           | Shift Left       |
| 11           | Parallel Load    |

## Working

1. The operation is selected using the select lines.
2. On each clock pulse, the register performs the selected operation.
3. Data can be shifted left, shifted right, loaded in parallel, or retained.
4. The output is updated after every clock cycle.

## Example

Initial Data: `1010`

### Shift Right

`1010 → 0101`

### Shift Left

`1010 → 0100`

### Parallel Load

Input Data: `1101`

Output: `1101`

## Applications

* Data storage
* Data transfer
* Serial-to-parallel conversion
* Parallel-to-serial conversion
* Digital communication systems
* Microprocessor and controller systems


