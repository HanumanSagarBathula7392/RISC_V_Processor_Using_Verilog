module DATA_MEMORY(input clk,reset,reg_write,
                   input [4:0] rs1,rs2,rd,
                   input [6:0] opcode,
                   input [3:0]Opsel,
                   input [11:0] imm_in,
                   output reg zero_flag,
                   output reg [31:0] ALU_out);
                    
wire [31:0] data1,data2,write_data,zero_flags;                   

REGISTER_MEM reg_mem1(.rs1(rs1),.rs2(rs2),.imm_in(imm_in),.rd(rd),.opcode(opcode),.reg_write(reg_write),.clk(clk),
                        .reset(reset),.write_data(write_data),.data1(data1),.data2(data2));
                         
ALU ALU1(.A(data1),.B(data2),.Opsel(Opsel),.ALUop(write_data),.zero_flag(zero_flags));

always @(posedge clk) begin
        ALU_out <= write_data;
        zero_flag<= zero_flags; 
    end
endmodule
