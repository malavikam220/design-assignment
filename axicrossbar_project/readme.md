# AXI4 Crossbar with Adaptive Fairness Arbitration and Reliability Enhancements

## Overview

This project extends the open-source AXI4/AXI4-Lite Crossbar by introducing adaptive arbitration, request monitoring, response error tracking, and transaction timeout handling.

The original crossbar provides configurable M×N AXI interconnect functionality with round-robin arbitration, buffering, clock-domain crossing support, and memory-map based routing.

Features

* MxN master/slave interfaces, configurable with a wizard
* Master/slave buffering capability, configurable per interface

  * Outstanding request number and payload configurable
  * Seamless support of AXI4 vs AXI4-lite
* CDC support in master & slave interface, to convert an agent clock domain from/to the fabric clock domain
* Round-robin arbitration

  * Non-blocking arbitration between requesters, with fait-share granting
  * Priority configurable per master interface, up to 4 different levels, for request and completion stages
* AXI or AXI4-Lite mode:

  * LITE mode: route all signals described in AXI4-lite specification
  * FULL mode: route all signals described by AXI4 specification
  * The selected mode applies to the global infrastructure
* Routing table can be defined to restrict slaves access

  * Easily create enclosed and secured memory map
  * Dedicate sensitive slaves only to trusted master agents
* USER signal support

  * Configurable for each channel (AW, AR, W, B, R)
  * Common to all master/slave interfaces if activated

```
┌─────────────┬───┬──────────────────────────┬───┬─────────────┐
│             │ S │                          │ S │             │
│             └───┘                          └───┘             │
│ ┌───────────────────────────┐  ┌───────────────────────────┐ │
│ │      Slave Interface      │  │      Slave Interface      │ │
│ └───────────────────────────┘  └───────────────────────────┘ │
│               │                              │               │
│               ▼                              ▼               │
│ ┌──────────────────────────────────────────────────────────┐ │
│ │                         Crossbar                         │ │
│ └──────────────────────────────────────────────────────────┘ │
│               │                              │               │
│               ▼                              ▼               │
│ ┌───────────────────────────┐  ┌───────────────────────────┐ │
│ │     Master Interface      │  │     Master Interface      │ │
│ └───────────────────────────┘  └───────────────────────────┘ │
│             ┌───┐                          ┌───┐             │
│             │ M │                          │ M │             │
└─────────────┴───┴──────────────────────────┴───┴─────────────┘
```

Our enhancements focus on improving:

* Fairness between competing masters
* Visibility into system traffic
* Detection of transaction failures
* Protection against stalled slave devices
* Runtime monitoring and debugging capabilities

---

# Added Features

## 1. Request Logger (`axicb_req_logger.sv`)

The original crossbar had no mechanism to measure how frequently each master was accessing the fabric.

Without traffic statistics:

* Arbitration decisions are based only on static priorities.
* Busy masters can dominate the bus.
* Runtime traffic patterns remain invisible.

### Implementation

A new passive monitoring module was added: axicb_req_logger.sv

The logger observes:

* AWVALID && AWREADY handshakes
* ARVALID && ARREADY handshakes      for every master interface.

Whenever a successful address handshake occurs:  AWVALID & AWREADY or ARVALID & ARREADY , the corresponding master request counter is incremented.

### Outputs

For each master:

```text
req_count[i]
```

stores the number of completed request handshakes.

A periodic monitoring window can be started using:

```text
window_clear
```

which resets statistics and begins a fresh measurement interval.

### Benefits

* Provides real traffic statistics.
* Enables adaptive arbitration decisions.
* Identifies heavily loaded masters.
* Useful for performance analysis and debugging.

---

## 2. Response Monitor (`axicb_resp_monitor.sv`)

The original implementation forwarded AXI responses but provided no visibility into transaction failures.

Debugging failing transactions required waveform inspection.

### Implementation

A new response monitor passively observes:

### Write Response Channel

```text
BVALID       BREADY       BRESP
```

### Read Response Channel

```text
RVALID       RREADY       RRESP
```

Whenever a response contains:

```text
SLVERR (2'b10)
DECERR (2'b11)     an error event is recorded.
```

### Tracked Information

#### Write Channel

```text
b_error_count     b_error_flag
```

#### Read Channel

```text
r_error_count     r_error_flag
```

### Benefits

* Immediate visibility of failing transactions.
* Simplifies debug and verification.
* Provides runtime reliability statistics.
* Useful for performance monitoring dashboards.

---

## 3. Write Transaction Timeout Support

The original write switch exposed  TIMEOUT_ENABLE  as a configuration parameter but the feature was never implemented.

As a result:

* A stalled slave could block transactions indefinitely.
* Masters might wait forever for a write response.

### Implementation

Timeout logic was added to the write switch.

Operation:

1. Start a timeout counter when a write request is issued.
2. Wait for a valid B-channel response.
3. If no response arrives within N cycles:

   * Timeout is declared.
   * A synthetic DECERR response is generated.
   * Response is returned to the requesting master.

### Generated Response

```text
BRESP = DECERR
```

### Benefits

* Prevents deadlock situations.
* Protects against unresponsive slaves.
* Improves system robustness.
* Guarantees forward progress.

---

## 4. Read Transaction Timeout Support

Similar to the write path, the read switch contained a timeout configuration parameter that was not functional.

A slave that never returns data could permanently stall the master.

### Implementation

Timeout logic was implemented in the read switch.

Operation:

1. Start a timeout counter when a read request is accepted.
2. Wait for read data from the slave.
3. If no valid response arrives within N cycles:

   * Timeout condition is detected.
   * A synthetic error response is generated.

### Generated Response

```text
RRESP = SLVERR     RLAST = 1
```

### Benefits

* Prevents indefinite stalls.
* Allows software to detect failures.
* Improves fault tolerance.
* Ensures completion of outstanding transactions.

---

# Adaptive Fairness Arbiter

The original crossbar uses:

```text
Round-Robin + Static Priority arbitration.
```

Although round-robin provides fairness, highly active masters can still dominate bus access for extended periods under certain traffic conditions.

To improve fairness, an adaptive arbitration mechanism was developed. The arbiter wraps the existing axicb_round_robin module and adds fairness enforcement logic.

---

## Operating Modes

### Normal Mode

The system behaves exactly like the original design:

```text
Round-Robin + Priority Arbitration
```

Requests are forwarded directly to the existing arbiter.

---

### Fairness Mode

A master is considered dominant if it repeatedly wins arbitration while other masters remain pending.

The arbiter tracks:   dominance_cnt

When  dominance_cnt >= DOMINANCE_LIMIT,  the arbiter enters Fairness Mode.

The dominant master is temporarily blocked.

Remaining waiting masters are allowed to complete their transactions.

After all pending requesters have been served:  served_mask == requester_mask

the system returns to Normal Mode.

---

## Key Signals

### Dominance Tracking

```text
dominance_cnt    dominant_master
```

Tracks repeated grants to the same requester.

### Fairness Control

```text
fairness_mode    blocked_master   served_mask
```

Controls fairness operation and status visibility.

---

## Advantages

### Compared to Original Crossbar

| Feature                 | Original Design | Modified Design |
| ----------------------- | --------------- | --------------- |
| Round-Robin Arbitration | ✓               | ✓               |
| Static Priority Support | ✓               | ✓               |
| Request Monitoring      | ✗               | ✓               |
| Error Monitoring        | ✗               | ✓               |
| Write Timeout Recovery  | ✗               | ✓               |
| Read Timeout Recovery   | ✗               | ✓               |
| Fairness Enforcement    | ✗               | ✓               |
| Starvation Protection   | Limited         | Enhanced        |
| Runtime Statistics      | ✗               | ✓               |

---

# Integration

The following modules were integrated into the top-level crossbar architecture:

```text
axicb_req_logger.sv
axicb_resp_monitor.sv
axicb_fairness_arbiter.sv
```

### Data Flow

Master Requests
↓
Request Logger
↓
Adaptive Fairness Arbiter
↓
Crossbar Switching Logic
↓
Slave Devices
↓
Response Monitor
↓
Master Interfaces

The request logger provides traffic statistics to the arbiter.

The arbiter dynamically manages fairness.

The response monitor tracks transaction failures and timeout-generated errors.

---

# Verification

A sanity testbench was developed and executed using EDA Playground.

The testbench verifies:

### Fairness Validation

* One master continuously requests access.
* Multiple masters generate intermittent requests.
* Dominant master reaches dominance threshold.
* Fairness mode activates.
* Waiting masters are granted service.
* System returns to normal mode.

### Timeout Validation

#### Write Path

* Slave intentionally withholds BVALID.
* Timeout counter expires.
* DECERR response is generated.

#### Read Path

* Slave intentionally withholds RVALID.
* Timeout counter expires.
* SLVERR + RLAST are generated.

### Error Monitoring Validation

* Inject SLVERR and DECERR responses.
* Verify:

  * Error counters increment.
  * Error flags assert correctly.

---

# Impact

The modifications transform the crossbar from a purely routing-oriented interconnect into a monitored, fault-aware, and fairness-enhanced communication fabric.

The design now provides:

* Better fairness among masters
* Improved reliability
* Timeout-based fault recovery
* Runtime performance visibility
* Easier debugging and verification

These additions make the crossbar more suitable for complex SoC environments where traffic contention, slave failures, and long-running transactions must be handled gracefully.


# Output 



