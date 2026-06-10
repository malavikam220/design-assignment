# 1110 Sequence Detector (Overlapping) using Verilog

## Overview

This project implements a **Mealy Finite State Machine (FSM)** in Verilog to detect the binary sequence **1110** with **overlapping sequence detection** support.

When the input stream contains the sequence `1110`, the output `detected` becomes high (`1`) for one clock cycle.

---

## Features

- Detects the sequence **1110**
- Supports **overlapping detection**
- Implemented using a **Mealy FSM**
- Synchronous reset
- Verilog HDL implementation
- Includes a testbench for simulation

---

## State Diagram

```text
          1
      +------+
      |      v
+------+    +------+
| IDLE |--->|  S1  |
+------+    +------+
   ^           |
   |0          |1
   |           v
   |        +------+
   |        |  S2  |
   |        +------+
   |           |
   |           |1
   |           v
   |        +------+
   +--------|  S3  |
      0     +------+
               |
               |0 / detected=1
               v
              S1
```

---

## State Description

| State | Meaning |
|---------|---------|
| IDLE | Initial state, waiting for first `1` |
| S1 | Received `1` |
| S2 | Received `11` |
| S3 | Received `111` |

When the FSM is in **S3** and receives a `0`, the sequence **1110** is detected.

---

## State Encoding

```verilog
parameter idle = 2'b00;
parameter s1   = 2'b01;
parameter s2   = 2'b10;
parameter s3   = 2'b11;
```

---

## Sequence Detection Logic

Detected sequence:

```text
1110
```

Example:

```text
Input Stream:
1 1 1 0

Output:
0 0 0 1
```

---

## Overlapping Detection

The FSM supports overlapping detection by transitioning from `S3` to `S1` after a successful detection.

Example:

```text
Input:
11101110

Detected:
   ↑   ↑
```

The detector immediately continues searching for another occurrence without returning to the IDLE state.

---

## Module Interface

### Sequence Detector

```verilog
module seqdet2(
    input clk,
    input rst,
    input din,
    output reg detected
);
```

### Inputs

| Signal | Description |
|----------|------------|
| clk | System clock |
| rst | Active-high synchronous reset |
| din | Serial input data |

### Output

| Signal | Description |
|----------|------------|
| detected | Goes high when sequence `1110` is detected |

---

## Testbench

The testbench applies the following input sequence:

```text
1 → 1 → 1 → 0
```

Expected output:

```text
detected = 1
```

### Testbench Instantiation

```verilog
seqdet2 dut(
    clk_tb,
    rst_tb,
    din_tb,
    detected_tb
);
```

---

## Simulation Timing

Example stimulus:

```verilog
rst_tb = 1;
#10 rst_tb = 0;

#10 din_tb = 1;
#10 din_tb = 1;
#10 din_tb = 1;
#10 din_tb = 0;
```

Expected waveform:

```text
Clock Edge    Input(din)    State    Detected
------------------------------------------------
1             1             S1       0
2             1             S2       0
3             1             S3       0
4             0             S1       1
```

---

## Simulation

### Using Icarus Verilog

Compile:

```bash
iverilog -o seqdet2 seqdet2.v seqdet2_tb.v
```

Run:

```bash
vvp seqdet2
```

Generate waveform:

```bash
iverilog -o seqdet2 seqdet2.v seqdet2_tb.v
vvp seqdet2
gtkwave dump.vcd
```

---

## Project Structure

```text
1110-sequence-detector/
│
├── seqdet2.v
├── seqdet2_tb.v
├── README.md
└── waveforms/
```

---

## Applications

- Digital communication systems
- Pattern recognition circuits
- Serial data monitoring
- FPGA and ASIC design projects
- Digital logic design learning

---


