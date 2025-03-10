`timescale 1ns / 1ns

module INST_MEM_tb;
    reg reset ;
    //reg clk = 0;
    reg [31:0] PCs;
    wire [31:0] instruction;

    INSTRUCTION_MEM uut (
        .reset(reset),
        .PCs(PCs),
        .instruction(instruction)
    );
//always begin #10 clk = ~clk; end
initial begin
    $dumpfile("INST_MEM_out.vcd");
    $dumpvars(0, INST_MEM_tb);    
end

    initial begin       
        reset = 1;
        PCs = 32'b0;

        #10;
        reset = 0; 

        #10; PCs = 32'd0;  
        #10; PCs = 32'd4;
        #10; PCs = 32'd8;
        #10; PCs = 32'd12;
        #10; PCs = 32'd16;
	#10; PCs = 32'd20;
	#10; PCs = 32'd24;
	#10; PCs = 32'd28;
	#10; PCs = 32'd32;
     
    end

    initial begin
        $monitor("Time = %t, reset = %b, PCs = %d, instruction = %h", $time, reset, PCs, instruction);
    end
initial begin
   #120; $finish;  
end
endmodule
