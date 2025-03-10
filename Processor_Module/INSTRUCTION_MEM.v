//This module reads the instruction from the INSt_MEM file

module INSTRUCTION_MEM( input reset,
                        input [31:0]PCs,
                        output reg [31:0] instruction);
reg [7:0] inst_mem[127:0];
reg [31:0] PCs_I;

    initial begin
        $readmemh("INST_MEM.mem",inst_mem,0,127);
    end

    always @(PCs) begin
        if (reset) begin 
            PCs_I <= 32'b0;  // Reset PCs to 0
        end else begin
            PCs_I <= PCs;  // Update PCs with input if not reset
        end 
    end

    always @(*) begin
        instruction ={inst_mem[PCs_I],inst_mem[PCs_I+1],inst_mem[PCs_I+2],inst_mem[PCs_I+3]}; //assign fetched instruction using concatenation       
    end
endmodule