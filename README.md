# 🔢 8-Bit ALU UVM Verification Project

This repository contains a complete **UVM-based testbench** for an 8-bit Arithmetic Logic Unit (ALU), developed as part of a learning project in digital verification.

---

## 📌 Project Description

The **Design Under Test (DUT)** is a simple 8-bit ALU capable of performing four operations:

| Operation | sel[1:0] | Description                |
|-----------|-----------|----------------------------|
| ADD       | `2'b00`   | a + b                      |
| SUB       | `2'b01`   | a - b                      |
| MUL       | `2'b10`   | a × b                      |
| SLT       | `2'b11`   | Set if a < b (`1` or `0`)  |

---

## 🧪 Testbench Features

This UVM testbench verifies the ALU using a **constrained-random verification** flow:

- ✅ **Randomized Inputs**: Operands `a` and `b`, and operation select `sel`
- 🧠 **Scoreboard**: Compares DUT result with expected model
- 📡 **Monitor**: Captures DUT transactions from the interface
- 📬 **Driver**: Drives inputs to the DUT from the sequence
- 🔄 **Sequencer**: Coordinates sequences and transactions
- 🔄 **Sequence**: Generates randomized stimulus
- 🧱 **Agent**: Wraps monitor, driver, and sequencer
- 🧪 **Environment**: Instantiates the agent and scoreboard
- 🧫 **Test**: Top-level test class that starts the sequence

---

## 📁 File Structure

```bash
├── rtl/
│   └── alu.sv                  # ALU Design
├── tb/
│   ├── alu_transaction.svh     # Sequence item
│   ├── alu_sequence.svh        # Sequence
│   ├── alu_driver.svh          # Driver
│   ├── alu_monitor.svh         # Monitor
│   ├── alu_scoreboard.svh      # Scoreboard
│   ├── alu_agent.svh           # Agent
│   ├── alu_env.svh             # Environment
│   ├── alu_test.svh            # Test
│   └── alu_if.sv               # Interface
├── sim/
│   └── run.f                   # File list for simulation
```
## 🛠️ How to Run

### 🧾 Prerequisites

- ✅ SystemVerilog simulator (e.g., **QuestaSim**, **Synopsys VCS**, **Aldec Riviera-PRO**)
- ✅ UVM library (usually bundled with the simulator)

---

### ▶️ Simulation Steps (QuestaSim Example)

```bash
# Compile all design and testbench files
vlog -sv -f sim/run.f +incdir+tb

# Run the simulation using the top module
vsim -c work.top -do "run -all; quit"


