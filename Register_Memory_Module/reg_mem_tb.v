`timescale 1ns / 1ps

module reg_mem_tb();
reg [31:0] instruction;
reg [4:0] rs1,rs2,rd;
reg [11:0] imm_in;
reg [6:0] opcode;
reg reg_write,reset;
reg clk=0; 
reg [31:0]write_data;
wire [31:0]data1;
wire [31:0] data2;

REGISTER_MEM dut(.rs1(instruction[19:15]),.rs2(instruction[24:20]),.rd(instruction[11:7]),
                .imm_in(instruction[31:20]),.opcode(instruction[6:0]),.reg_write(reg_write),
                .clk(clk),.reset(reset),.write_data(write_data),.data1(data1),.data2(data2));

 always @(instruction) begin
 
rs1 = instruction[19:15];
rs2 = instruction[24:20];
rd = instruction[11:7];
imm_in = instruction[31:20];
opcode = instruction[6:0];

end

initial begin
forever #10 clk =~clk;
end

initial begin
        reset = 1;
        #10 reset = 0;
end

initial begin
$dumpfile("Reg_Mem.vcd");
$dumpvars(0,reg_mem_tb);
end


initial begin
reg_write=0;

#10 reg_write=1; 
    instruction=32'h00208033; write_data=10;
#10 instruction=32'h003110b3; write_data=11;
#10 instruction=32'h0041a133; write_data=13;
#10 instruction=32'h025201b3; write_data=21;
#10 instruction=32'h02629233; write_data=42;
#10 instruction=32'h027322b3; write_data=22;
#10 instruction=32'h0283b333; write_data=17;
#10 instruction=32'h049403b3; write_data=10;
#10 instruction=32'h00aa0993; write_data=13;
#10 instruction=32'hffba8a13; write_data=21;
#10 instruction=32'h017b1a93; write_data=42;
#10 instruction=32'h001bab13; write_data=22;
#10 instruction=32'h002c5b93; write_data=17;
end

initial begin
#150 $finish;
end
endmodule
