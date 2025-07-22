# Systolic_Array
Hardware implementation of Systolic Array Matrix Multiplication using Verilog/VHDL on Xilinx Vivado. Includes simulation, synthesis reports, and timing analysis.
# Systolic Array Based Matrix Multiplication (Vivado | Verilog)

This is a hardware design project that implements a 2x2 systolic array architecture for matrix multiplication using Verilog HDL. The entire design was developed and tested using Xilinx Vivado.

The systolic array is composed of modular Processing Elements (PEs) connected in a grid, where each PE performs multiply-and-accumulate (MAC) operations. This allows for pipelined and parallel computation, which is well-suited for FPGA-based acceleration.

---

## Features

- 3x3 systolic array architecture (easily scalable)
- Modular PE design for reusability
- Verilog-based RTL implementation
- Testbenches included for functional simulation
- Designed and tested in Vivado

---

## Tools Used

- Xilinx Vivado (Design Suite)
- Verilog HDL
- GTKWave (optional, for waveform viewing)

---

## Project Structure

systolic-array-vivado/
├── src/ # Verilog source files (PEs, array module)
├── tb/ # Testbenches for simulation
├── README.md # Project overview and instructions

## How to Use

1. Open Vivado and create a new project
2. Add all files from `src/` and `tb/`
3. Set the testbench file (e.g., `tb_pe.v`) as the top module
4. Run behavioral simulation to check correctness
5. Optionally, perform synthesis to analyze resource usage and timing

---

## Example: Processing Element (PE)

Each PE receives inputs from the left and top, performs a multiply-and-accumulate, and passes data to the right and bottom. This allows partial sums to propagate through the array in a pipelined manner.

---

## Simulation

A testbench is provided to verify functionality of the PE module. You can also extend the testbench to verify the entire array for custom matrices.

---

## To-Do / Future Improvements

- Generalize the array to NxN size
- Add support for real-time data input (UART/SPI)
- Deploy on DiMArch-DRRA and FPGA for hardware testing

---

## Acknowledgements
Developed as part of an academic assignment at NIT Trichy. Special thanks to Dr Sonal Gupta the faculty for guidance and review.
---


