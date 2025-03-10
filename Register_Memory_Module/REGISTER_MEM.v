module REGISTER_MEM(input reg_write,clk,reset,
                    input [4:0] rs1,rs2,rd,
                    input [11:0] imm_in,
                    input [6:0] opcode,
                    input [31:0]write_data,
                    output [31:0]data1,
                    output [31:0] data2);

reg [31:0] reg_mem[31:0];
wire [31:0] imm_out;

IMM_GEN IMM_GEN1(.imm_in(imm_in),.imm_out(imm_out));

integer i=0;

//always @(posedge reset) begin
//for (i = 0; i < 32; i = i + 1) begin
//        reg_mem[i] <= i;  end
//end

//always @(posedge clk) begin
//    if (reg_write) 
//        reg_mem[rd] <= write_data;
//end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        for (i = 0; i < 32; i = i + 1) begin //Initialize register memory from 0 to 31.
            reg_mem[i] <= i;
        end
    end 
    else if (reg_write) begin
        reg_mem[rd] <= write_data; // Storing the ALU output to the rd location.
    end
end

assign data1=reg_mem[rs1];

 /* Depending on the instruction type, data2 may be a value 
 from register memory or an immediate value.*/

assign  data2 = (opcode==7'b0110011) ? reg_mem[rs2] : imm_out ;             

endmodule
