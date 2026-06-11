# 8-bit × 256 Block Memory Generator Using Vivado IP Integrator

## Overview

This project implements an 8-bit wide, 256-location Block RAM using the Xilinx Vivado Block Memory Generator IP. The design is created using IP Integrator (Block Design) and supports independent read and write addressing.

### Features

* Memory Depth: 256 locations
* Data Width: 8 bits
* Total Memory Size: 2048 bits
* Separate Read and Write Addresses
* Synchronous Read and Write Operations
* Active-Low Asynchronous Reset Input (`arstn`)
* Write Enable Control (`wrenb`)
* Implemented using Vivado Block Memory Generator IP

---

## Design Specifications

### Inputs

| Signal  | Width | Description                        |
| ------- | ----- | ---------------------------------- |
| clk     | 1     | System Clock                       |
| arstn   | 1     | Active-Low Asynchronous Reset      |
| wrenb   | 1     | Write Enable (1 = Write, 0 = Read) |
| wradd   | 8     | Write Address                      |
| rdadd   | 8     | Read Address                       |
| data_in | 8     | Input Data                         |

### Outputs

| Signal   | Width | Description |
| -------- | ----- | ----------- |
| data_out | 8     | Output Data |

---

## Memory Organization

The address width is 8 bits.

Number of memory locations:

[
2^8 = 256
]

Each location stores 8 bits.

Total memory size:

[
256 \times 8 = 2048 \text{ bits}
]

---


### Testbench Functionality

The testbench performs the following operations:

1. Apply reset.
2. Write `0x55` to address `10`.
3. Read address `10`.
4. Verify output is `0x55`.
5. Write `0xAA` to address `20`.
6. Read address `20`.
7. Verify output is `0xAA`.

---



## Results

### Test Case 1

| Operation | Address | Data |
| --------- | ------- | ---- |
| Write     | 10      | 0x55 |
| Read      | 10      | 0x55 |

### Test Case 2

| Operation | Address | Data |
| --------- | ------- | ---- |
| Write     | 20      | 0xAA |
| Read      | 20      | 0xAA |

Waveform observations:

```text
Address 10 → data_out = 55
Address 20 → data_out = AA
```

---

## Applications

* FPGA Memory Systems
* Data Buffering
* Embedded Systems
* Digital Signal Processing
* Communication Systems
* Processor Memory Interfaces

---


