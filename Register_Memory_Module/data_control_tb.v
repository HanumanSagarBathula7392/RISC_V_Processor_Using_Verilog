`timescale 1ns / 1ps

module data_control_tb();
reg [31:0] instruction;
reg [4:0]rs1,rs2,rd;
reg [6:0] opcode;
reg [11:0] imm_in;
reg [3:0]Opsel;
reg reg_write,reset;
reg clk=0;
wire zero_flag;
wire [31:0]ALU_out;

DATA_MEMORY DATA_MEM1(.rs1(instruction[19:15]),.rs2(instruction[24:20]),.rd(instruction[11:7]),
                      .opcode(instruction[6:0]),.Opsel(Opsel),.imm_in(instruction[31:20]),
                      .reg_write(reg_write),.clk(clk),.reset(reset),.zero_flag(zero_flag)
                      ,.ALU_out(ALU_out));
                                
initial begin
$dumpfile("DATA_Control_Output.vcd");
$dumpvars(0,data_control_tb);
end

initial begin
forever #10 clk=~clk;
end

initial begin
 assign rs1 = (instruction[19:15]);
 assign rs2 = (instruction[24:20]);
 assign rd = (instruction[11:7]);
 assign opcode = (instruction[6:0]);
 assign imm_in = instruction[31:20];
end

initial begin
reg_write=0;
reset=1;
#10 reg_write=1;
#10 reset=0;
end

initial begin
     
#10 Opsel=4'b0000; instruction=32'h00208033;
#10 Opsel=4'b0001; instruction=32'h01088933;
#10 Opsel=4'b0100; instruction=32'h003110b3;
#10 Opsel=4'b0101; instruction=32'h06c59533;
#10 Opsel=4'b1001; instruction=32'h049403b3;
#10 Opsel=4'b0110; instruction=32'h04a49433;
#10 Opsel=4'b0000; instruction=32'h00aa0993;
#10 Opsel=4'b0000; instruction=32'hffba8a13;
#10 Opsel=4'b0010; instruction=32'h002c5b93;

end

initial begin
#100 $finish;
end                              
endmodule
