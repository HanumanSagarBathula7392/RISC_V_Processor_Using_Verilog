`timescale 1ns / 1ps

module ALU_tb( );
reg [31:0] A,B;
reg [3:0] Opsel;
wire [31:0] ALUop;
wire zero_flag;

ALU DUT(.A(A), .B(B), .Opsel(Opsel),.ALUop(ALUop),.zero_flag(zero_flag));

initial begin
$dumpfile("ALU_waveform");
$dumpvars(0,ALU_tb);
end

initial begin
$monitor($time,"\nA=%b,\nB=%b,\nOPsel=%b,\nALUop=%b,\nZero_Flag=%b",A,B,Opsel,ALUop,zero_flag);
end

initial begin
        A = 22; B = 32;  
        Opsel = 4'b0000;
    #20 Opsel = 4'b0001;
    #20 Opsel = 4'b0010;
    #20 Opsel = 4'b0011;
    #20 Opsel = 4'b0100;
    #20 Opsel = 4'b0101;
    #20 Opsel = 4'b0110;
    #20 Opsel = 4'b0111;
    #20 Opsel = 4'b1000;
    #20 Opsel = 4'b1001;
    #20 Opsel = 4'b1010;
    #20 Opsel = 4'b1011;
    #20 Opsel = 4'b1100;
    #20 Opsel = 4'b1101;
    #20 Opsel = 4'b1110;
    #20 Opsel = 4'b1111;
    
end
initial begin
#340 $finish;
end
endmodule
