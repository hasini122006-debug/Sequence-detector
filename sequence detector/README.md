# Sequence Detector Using Verilog HDL

## 📌 Project Title

**1011 Sequence Detector Using Verilog**

## 📖 Introduction

A sequence detector is a digital circuit used to detect a specific pattern of binary bits in a serial input stream. In this project, a **Finite State Machine (FSM)** is designed using **Verilog HDL** to detect the binary sequence **1011**.

Whenever the input sequence `1011` is received, the circuit generates a **HIGH (`1`) detection output for one clock cycle**. The design supports **overlapping sequence detection**.

---

## 🎯 Objectives

The main objectives of this project are:

* To design a sequence detector using Verilog HDL.
* To detect the binary sequence `1011`.
* To implement the design using a Finite State Machine.
* To write a Verilog testbench for functional verification.
* To simulate the design and verify the output.
* To understand FSM-based digital circuit design.

---

## 🛠️ Tools and Technologies

| Tool / Technology | Purpose                             |
| ----------------- | ----------------------------------- |
| Verilog HDL       | Hardware description and RTL design |
| VS Code           | Writing and editing Verilog files   |
| Icarus Verilog    | Compilation and simulation          |
| GTKWave           | Viewing simulation waveforms        |
| GitHub            | Project storage and version control |

---

## ⚙️ Design Description

The sequence detector continuously monitors the `data_in` signal at every rising edge of the clock.

The detector uses four states:

* **S0** – No matching bits detected.
* **S1** – First bit `1` detected.
* **S10** – Sequence `10` detected.
* **S101** – Sequence `101` detected.

When the next input bit is `1` in state `S101`, the complete sequence `1011` is detected and the `detected` output becomes `1`.

### State Flow

```text
             1
        ┌──────────┐
        │          ▼
      ┌────┐     ┌────┐
      │ S0 │ ──► │ S1 │
      └────┘  1  └────┘
        ▲          │
        │          │ 0
        │          ▼
        │        ┌─────┐
        └── 0 ── │ S10 │
                 └─────┘
                    │
                    │ 1
                    ▼
                 ┌──────┐
                 │ S101 │
                 └──────┘
                    │
                    │ 1
                    ▼
               Sequence 1011
               detected = 1
```

---

## 🔌 Input and Output

| Signal     | Direction | Description                          |
| ---------- | --------- | ------------------------------------ |
| `clk`      | Input     | Clock signal                         |
| `reset`    | Input     | Resets the FSM to the initial state  |
| `data_in`  | Input     | Serial binary input                  |
| `detected` | Output    | Becomes HIGH when `1011` is detected |

---

## 📂 Project Structure

```text
sequence-detector-verilog/
│
├── README.md
├── sequence_detector.v
├── sequence_detector_tb.v
├── simulation_output.txt
└── waveform.png
```

### File Description

**`sequence_detector.v`**
Contains the RTL implementation of the 1011 sequence detector.

**`sequence_detector_tb.v`**
Contains the testbench used to apply different input patterns and verify the detector.

**`simulation_output.txt`**
Contains the output obtained from the simulation.

**`waveform.png`**
Contains the simulation waveform generated using GTKWave.

---

## 🧪 Testbench

The testbench applies the following serial input sequence:

```text
101101011
```

The required pattern is:

```text
1011
```

The pattern occurs twice in the input stream.

Therefore, the `detected` output becomes HIGH whenever the complete `1011` sequence is received.

### Test Case

| Input Sequence | Expected Detection |
| -------------- | ------------------ |
| `1011`         | `1`                |
| `1010`         | `0`                |
| `1101`         | `0`                |
| `101101011`    | `2 detections`     |

---

## 💻 Simulation

### Compile Using Icarus Verilog

Open the project folder in VS Code terminal and run:

```bash
iverilog -o sequence_detector_sim sequence_detector.v sequence_detector_tb.v
```

Run the compiled simulation:

```bash
vvp sequence_detector_sim
```

To generate a waveform file, add `$dumpfile` and `$dumpvars` to the testbench and run:

```bash
vvp sequence_detector_sim
```

Then open the generated `.vcd` file using GTKWave:

```bash
gtkwave sequence_detector.vcd
```

---

## 📊 Expected Simulation Output

For the input stream:

```text
101101011
```

the sequence `1011` is detected twice.

Expected output behavior:

```text
Input    : 1 0 1 1 0 1 0 1 1
                     ↑       ↑
Detected : 0 0 0 1 0 0 0 0 1
```

The `detected` signal becomes `1` when the fourth bit of `1011` is received.

---

## 📈 Simulation Result

The simulation verifies that the FSM correctly identifies the required sequence.

```text
Sequence to Detect : 1011
Input Stream       : 101101011
Number of Matches  : 2
Detection Output   : 000100001
```

The simulation result confirms that the design successfully detects the `1011` pattern.

---

## 🔄 Overlapping Detection

This project supports **overlapping sequence detection**.

For example:

```text
Input:  1011011
        1011
           1011
```

The FSM does not need to return completely to the initial state after a detection. This allows it to detect another occurrence of the sequence when appropriate.

---

## 🚀 Applications

Sequence detectors are used in many digital systems, including:

* Serial communication systems
* Digital communication
* Pattern recognition
* Data stream monitoring
* Protocol detection
* Control systems
* Digital signal processing
* FPGA-based digital systems

---

## 📚 Learning Outcomes

After completing this project, the following concepts can be understood:

* Verilog HDL programming
* RTL design
* Finite State Machines
* Sequential and combinational logic
* State transitions
* Testbench development
* Functional simulation
* Waveform analysis
* GitHub project management

---

## 🔮 Future Improvements

The project can be extended by:

* Adding detection for different sequences.
* Designing both overlapping and non-overlapping detectors.
* Making the sequence programmable.
* Implementing the design on an FPGA board.
* Adding multiple sequence detection.
* Creating a parameterized sequence detector.

---

## ✅ Conclusion

The **1011 Sequence Detector** is successfully designed and verified using **Verilog HDL**. The FSM-based design detects the required binary sequence from a serial input stream and generates a HIGH detection signal when the pattern is identified.

The project provides practical experience in **Verilog coding, FSM design, testbench creation, simulation, waveform analysis, and GitHub-based project development**.

---

## 👩‍💻 Author

**Verilog HDL Digital Design Project**

---

## 📜 License

This project is created for **educational and academic purposes**.
