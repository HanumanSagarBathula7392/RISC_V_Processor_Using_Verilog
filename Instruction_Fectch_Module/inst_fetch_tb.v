`timescale 1ns / 1ps
module inst_fetch_tb();
reg reset;
reg clk=0;
wire [31:0]instruction;

INST_FETCH inst_fetch1(.reset(reset),.clk(clk),.instruction(instruction));

initial begin
    $dumpfile("inst_fetch_output.vcd");
    $dumpvars(0,inst_fetch_tb);
end

initial begin
    forever #10 clk=~clk;
end

initial begin
reset = 1;
#10 reset =0;
end

initial begin
#400 $finish;
end

endmodule
