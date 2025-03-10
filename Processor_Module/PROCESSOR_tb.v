`timescale 1ns / 1ps

module PROCESSOR_tb();
reg clk=0;
reg reset;
wire zero_flag;
wire [31:0] Write_data;


PROCESSOR PROCESSOR_DUT(.clk(clk),.reset(reset),.zero_flag(zero_flag),.Write_data(Write_data));

initial begin
    $dumpfile("PROCESSOR_Out.vcd");
    $dumpvars(0,PROCESSOR_tb);
end

initial begin
forever #10 clk = ~clk;
end

initial begin
    reset = 1;
#15 reset = 0;
end

initial begin
#250 $finish;
end

endmodule
