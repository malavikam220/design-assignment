# FIFO Design and Verification Using SystemVerilog Interface

## Overview

This project implements a **Synchronous FIFO (First-In First-Out)** using SystemVerilog and verifies its functionality through a testbench connected via a SystemVerilog Interface.

The design demonstrates fundamental digital design concepts such as:

* FIFO memory architecture
* Read and Write operations
* Full and Empty flag generation
* SystemVerilog Interfaces
* Testbench-based verification

---

## What is a FIFO?

FIFO stands for **First-In First-Out**.

The first data written into the FIFO is the first data read out.

### Example

```text
Write Order : 10 → 20 → 30
Read Order  : 10 → 20 → 30
```

This behavior is commonly used in:

* Data buffering
* Communication systems
* UARTs
* Network routers
* Embedded systems
* Processor pipelines

---


## FIFO Specifications

| Parameter     | Value        |
| ------------- | ------------ |
| Data Width    | 8 bits       |
| FIFO Depth    | 8 locations  |
| Write Pointer | 3 bits       |
| Read Pointer  | 3 bits       |
| Full Flag     | Supported    |
| Empty Flag    | Supported    |
| Clock Type    | Synchronous  |
| Reset Type    | Asynchronous |

---


### Interface Signals

| Signal | Description          |
| ------ | -------------------- |
| clk    | System clock         |
| rst    | Reset signal         |
| wr_en  | Write enable         |
| rd_en  | Read enable          |
| din    | Input data           |
| dout   | Output data          |
| full   | FIFO full indicator  |
| empty  | FIFO empty indicator |

---

## FIFO Architecture

The FIFO consists of:

* Memory Array (`mem[0:7]`)
* Write Pointer (`wr_ptr`)
* Read Pointer (`rd_ptr`)
* Occupancy Counter (`count`)

### Write Operation

Data is written when:

```text
wr_en = 1 and full = 0
```

The write pointer advances after storing the data.

### Read Operation

Data is read when:

```text
rd_en = 1 and empty = 0
```

The read pointer advances after reading the data.

### Full Condition

```text
count == 8
```

### Empty Condition

```text
count == 0
```

---

## Verification Strategy

The testbench performs the following sequence:

### Step 1: Reset

```text
FIFO Reset
```

### Step 2: Write Data

```text
Write 10
Write 20
Write 30
```

### Step 3: Read Data

```text
Read 10
Read 20
Read 30
```
---

## Sample Simulation Output

```text
WRITE : 10
WRITE : 20
WRITE : 30

READ  : 10
READ  : 20
READ  : 30
```

This confirms correct FIFO operation.

---







