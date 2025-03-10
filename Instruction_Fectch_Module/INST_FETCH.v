// This module fetches the 32-bit instruction and also increments PC with 4 
module INST_FETCH(input clk, reset, output [31:0] instruction);

wire [31:0] PCW;

INSTRUCTION_MEM INST_MEM1(.reset(reset),.PCs(PCW),.instruction(instruction));

PC PC1(.clk(clk),.reset(reset),.PCs(PCW));

endmodule
