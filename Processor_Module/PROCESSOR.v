/*This is a RISC-V multi-stage processor, can perform arithmetic, logical, shift, 
and comparison operations for both register and immediate instruction types
It is not designed for Load and Store operations, Those will be added soon*/

module PROCESSOR(input reset,clk, output reg zero_flag ,output reg [31:0]Write_data);

wire [31:0] instruction;
wire reg_write;
wire [4:0] rs1, rs2, rd;
wire [6:0] opcode;
wire [3:0]Opsel;
wire [11:0] imm_out;
wire [31:0]ALU_out;
wire zero_flags;

always @(*) begin 
    if (reset) begin
        Write_data <= 32'b0;
        zero_flag  <= 1;
    end
    else begin
        Write_data <= ALU_out;
        zero_flag  <= zero_flags;
//        if (ALU_out == 32'b0) begin
//            zero_flag  <= 1;
//        end
//        else begin
//            zero_flag <= 0; 
//        end  
    end 
end

// Instruction Fetch Stage
INST_FETCH INST_FETCH1(.clk(clk),.reset(reset),.instruction(instruction));

// Instruction Decode Stage
INST_DECODE INST_DECODE1(.instruction(instruction),.reg_write(reg_write),
                         .rs1(rs1),.rs2(rs2),.rd(rd),.opcode(opcode),.Opsel(Opsel),.imm_out(imm_out));
                         
// Execution and Write-back stage                        
DATA_MEMORY DATA_MEMORY1(.rs1(rs1),.rs2(rs2),.rd(rd),.opcode(opcode),.Opsel(Opsel),
                        .imm_in(imm_out),.reg_write(reg_write),.clk(clk),.reset(reset),
                        .zero_flag(zero_flags),.ALU_out(ALU_out));                 
endmodule
