module CONTROL_UNIT(input [6:0] funct7,
                    input [2:0] funct3,
                    input [6:0]opcode,
                    output reg reg_write,
                    output reg [3:0]Opsel);


always @(funct7 or funct3 or opcode) begin

//Below are the operations for I-Type Instructions

    if (opcode==7'b0110011) begin
        reg_write=1;
        case (funct7)
            0:begin
                if (funct3==0)
                    Opsel=4'b0000; //ADD
                else if (funct3==1)
                    Opsel=4'b0001; //SUB
                else if (funct3==2)
                    Opsel=4'b1101; // MUL
                else
                    Opsel=4'b0000; //ADD Default
                end
            1:begin
                if (funct3==0)
                    Opsel=4'b0010; //SLL
                else if (funct3==1)
                    Opsel=4'b0011; //SRL
                else if (funct3==2) 
                    Opsel=4'b0111; //SLA
                else if (funct3==3)
                    Opsel=4'b1000; //SRA
                else
                    Opsel=4'b0000; //ADD Default
                end
            2:begin
                if (funct3==0)
                    Opsel=4'b0100; //SLT
                else if (funct3==1)
                    Opsel=4'b0101; //SGT   
                else
                    Opsel=4'b0000; //ADD Default
                end
            3:begin
                if (funct3==0)
                    Opsel=4'b0110; //XOR
                else if (funct3==1)
                    Opsel=4'b1001; //AND
                else if (funct3==2)
                    Opsel=4'b1010; //OR
                else if (funct3==3)
                    Opsel=4'b1011; //NAND
                else if (funct3==4)
                    Opsel=4'b1100; //NOR
                else
                    Opsel=4'b0000; //ADD Default
                end
            default Opsel=4'b0000; //ADD Default
        endcase
    end

//Below are the operations for I-Type Instructions

    else if (opcode==7'b0010011) begin
        reg_write=1;
        case (funct3)
            0:begin
                Opsel=4'b0000; //ADDI
              end
            1:begin
                Opsel=4'b0100;//SLTI
              end
            2:begin
                Opsel=4'b1001;//ANDI
              end
            3:begin
                Opsel=4'b1010;//ORI
              end 
            4:begin
                Opsel=4'b0110;//XORI
              end
            5:begin
                Opsel=4'b0010;//SLLI
              end
            6:begin
                Opsel=4'b0011;//SRLI
              end
            7:begin
                Opsel=4'b1000;//SRAI
              end          
            default Opsel=4'b0000;//ADD Default
        endcase
     end
     
     else begin
        Opsel=4'b1110; //MOV A for all the other opcode types
     end
end
endmodule
