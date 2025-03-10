module IMM_GEN(input [11:0] imm_in,output [31:0]imm_out); 

    assign imm_out = {{20{imm_in[11]}},imm_in[11:0]}; // Signed Extension of Immediate value

endmodule
