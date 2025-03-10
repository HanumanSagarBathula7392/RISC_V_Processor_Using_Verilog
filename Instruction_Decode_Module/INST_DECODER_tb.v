`timescale 1ns / 1ps

module INST_DECODER_tb();

reg [31:0] instruction;
wire reg_write; 
wire [4:0]rs1,rs2,rd; 
wire [6:0] opcode;
wire [3:0] Opsel;
wire [11:0]imm_out;

INST_DECODE INST_dut(.instruction(instruction),
                    .reg_write(reg_write),.rs1(rs1),.rs2(rs2),.rd(rd),
                    .opcode(opcode) ,.Opsel(Opsel),.imm_out(imm_out));
                 
initial begin
    $dumpfile("INST_DEC_out.vcd");
    $dumpvars(0, INST_DECODER_tb);    
end

initial begin

#10 instruction = 32'h00208033;
#10 instruction = 32'h003110B3;
#10 instruction = 32'h0041A133;
#10 instruction = 32'h025201B3;
#10 instruction = 32'h02629233;
#10 instruction = 332'h0283B333;
#10 instruction = 32'h049403B3;
#10 instruction = 32'h04A49433;

#10 instruction = 32'h00AA0993;
#10 instruction = 32'hFFDA8A13;
#10 instruction = 32'h017B1A93;
#10 instruction = 32'h001BAB13;
#10 instruction = 32'h002C5B93;
#10 instruction = 32'h001CFC13;

#10 instruction = 32'h06B504B3;
#10 instruction = 32'h06C59533;

end

initial begin
    #200 $finish;
end

endmodule
