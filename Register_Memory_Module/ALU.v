module ALU(input[31:0] A,B,
input [3:0]Opsel,
output reg [31:0] ALUop,
output zero_flag);

always @(*) begin
case (Opsel)
4'b0000: ALUop=A+B; // Addition
4'b0001: ALUop=A-B; // Subtraction
4'b0010: ALUop=A<<B; // Logical Shift Left 
4'b0011: ALUop=A>>B; // Logical Shift Right
4'b0100: ALUop=(A<B) ? 1:0; // Set if A less than B
4'b0101: ALUop=(A>B) ? 1:0; // Set if A grater than B
4'b0110: ALUop=A^B; // Bitwise XOR Operation
4'b0111: ALUop=A<<<B; // Arithmetic Shift Left
4'b1000: ALUop=A>>>B; // Arithmetic Shift Right
4'b1001: ALUop=A&B; // Bitwise AND Operation
4'b1010: ALUop=A|B; // Bitwise OR Operation
4'b1011: ALUop=~(A&B); // Bitwise NAND Operation
4'b1100: ALUop=~(A|B); //Bitwise NOR Operation
4'B1101: ALUop=A*B; // Multiplication
4'b1110: ALUop=A; // Load A Operation

default: ALUop =32'bx; // Default 32 bits x (Unknown or Undefined)
endcase
end 

assign zero_flag=(ALUop == 0)? 1'b1 : 1'b0; // Sets the Zero flag when the output is zero

endmodule
