`timescale 1ns / 1ps

module CONTROL_UNIT_tb();


reg [6:0] funct7;
reg [2:0] funct3;
reg [6:0]opcode;
wire reg_write;
wire [3:0]Opsel;

CONTROL_UNIT dut(.funct3(funct3),.funct7(funct7),.opcode(opcode),.reg_write(reg_write),.Opsel(Opsel));

initial begin
$dumpfile("CU_out.vcd");
$dumpvars(0,CONTROL_UNIT_tb);
end

initial begin

    funct7=7'b0000000 ; funct3=3'b000; opcode = 7'b0110011;
#10 funct7=7'b0000000 ; funct3=3'b001; opcode = 7'b0110011; 
#10 funct7=7'b0000000 ; funct3=3'b010; opcode = 7'b0110011;
#10 funct7=7'b0000001 ; funct3=3'b000; opcode = 7'b0110011;
#10 funct7=7'b0000001 ; funct3=3'b001; opcode = 7'b0110011;
#10 funct7=7'b0000001 ; funct3=3'b010; opcode = 7'b0110011;
#10 funct7=7'b0000001 ; funct3=3'b011; opcode = 7'b0110011;
#10 funct7=7'b0000010 ; funct3=3'b000; opcode = 7'b0110011;
#10 funct7=7'b0000010 ; funct3=3'b001; opcode = 7'b0110011;
#10 funct7=7'b0000011 ; funct3=3'b000; opcode = 7'b0110011;
#10 funct7=7'b0000011 ; funct3=3'b001; opcode = 7'b0110011;
#10 funct7=7'b0000011 ; funct3=3'b010; opcode = 7'b0110011;
#10 funct7=7'b0000011 ; funct3=3'b011; opcode = 7'b0110011;
#10 funct7=7'b0000011 ; funct3=3'b100; opcode = 7'b0110011;
#10 funct7=7'b0000101 ; funct3=3'b100; opcode = 7'b0110011;
#10 funct7=7'b0000011 ; funct3=3'b101; opcode = 7'b0110011;

#10  funct3=3'b000; opcode = 7'b0010011;
#10  funct3=3'b001; opcode = 7'b0010011;
#10  funct3=3'b010; opcode = 7'b0010011;
#10  funct3=3'b011; opcode = 7'b0010011;
#10  funct3=3'b100; opcode = 7'b0010011;
#10  funct3=3'b101; opcode = 7'b0010011;
#10  funct3=3'b110; opcode = 7'b0010011;
#10  funct3=3'b111; opcode = 7'b0010011;
#10  funct3=3'b111; opcode = 7'b0011011;

end

initial begin
#300 $finish;
end

endmodule
