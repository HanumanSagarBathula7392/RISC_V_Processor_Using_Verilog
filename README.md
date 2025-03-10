# RISC-V Processor Design

This project implements a **RISC-V Processor** with a structured design, including instruction fetch, decode, execution, and memory access units. The design is structured using **Verilog** and tested on FPGA simulation tools.

## Features
- **5-Stage Pipeline**: Instruction Fetch, Decode, Execute, Memory Access, and Write-back.
- **32-bit Architecture**: Implements a subset of the RISC-V ISA.
- **Register File & ALU**: Essential components for processing arithmetic and logical operations.
- **Memory Interface**: Includes separate instruction and data memory.

## Design Hierarchy
The processor consists of multiple modules as shown below:
```
PROCESSOR (Top Level)
├── INST_FETCH (Instruction Fetch Unit)
│   ├── INSTRUCTION_MEM (Instruction Memory)
│   ├── PC (Program Counter)
├── INST_DECODE (Instruction Decode Unit)
│   ├── CONTROL_UNIT (Control Unit)
├── DATA_MEMORY (Data Memory Unit)
│   ├── REGISTER_MEM (Register File)
│   ├── IMM_GEN (Immediate Generator)
│   ├── ALU (Arithmetic Logic Unit)
```


## Running the Project
1. Clone the repository:
  ```sh
   git clone 
   https://github.com/HanumanSagarBathula7392/RISC_V_Processor_Using_Verilog.git
   ```
3. Open the project in **Vivado/Quartus ModelSim**.
4. Compile and run the testbench.
5. Simulate and analyze the results.

## References
For more details, refer to the **RISC-V Instruction Manual** (RISC_V_MANUAL.pdf) provided in the project.

---
**Developed by:** Hanuman Sagar Bathula |  **Tech Used:** Verilog, FPGA Tools

![Processor Design](https://github.com/HanumanSagarBathula7392/RISC_V_Processor_Using_Verilog/blob/master/Images/RISC_V_Design.jpeg)
![RTL Schematic](https://github.com/HanumanSagarBathula7392/RISC_V_Processor_Using_Verilog/blob/master/Images/RISC_V_Schematic.jpeg)
![Instruction Set](https://github.com/HanumanSagarBathula7392/RISC_V_Processor_Using_Verilog/blob/master/Images/RISC_V_INST.png)


