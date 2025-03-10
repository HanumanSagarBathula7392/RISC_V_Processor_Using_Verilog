module INST_DECODE(input[31:0] instruction,
                   output reg_write, 
                   output [4:0]rs1,rs2,rd, 
                   output [6:0] opcode,
                   output [3:0] Opsel,
                   output [11:0]imm_out
                   );
                   
wire [2:0]funct3;
wire [6:0]funct7;                   
                   
assign funct7 = instruction[31:25]; // Decoding funct7 from an instruction
assign rs2 = instruction[24:20]; // Decoding rs2 from an instruction
assign rs1 = instruction[19:15]; // Decoding rs1 from an instruction
assign funct3 = instruction[14:12]; // Decoding funct3 from an instruction
assign rd = instruction[11:7]; // Decoding rd from an instruction
assign opcode = instruction[6:0]; // Decoding opcode from an instruction

/* The folloeinf is decoding 12 bits immediate data from an instruction
   It loads into the data2 in register memory if only the opcode is 0010011 */
assign imm_out = instruction[31:20]; 

CONTROL_UNIT CONTROL_UNIT1(.funct7(funct7),.funct3(funct3),.opcode(opcode),.reg_write(reg_write),.Opsel(Opsel));

endmodule
