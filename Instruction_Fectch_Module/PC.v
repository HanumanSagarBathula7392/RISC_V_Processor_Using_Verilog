//Program Counter initializes to zero when reset is activated; otherwise, it increments by 4.
module PC(input clk,reset, output reg [31:0] PCs =32'b0);

always @(posedge clk or posedge reset) begin
    if (reset == 1) 
        PCs<=32'b0; //Resetting PC 
    else
        if (PCs>=81)
            PCs<=32'b0; //Resetting PC, If the PC is higher than locations in instruction memory 
        else
            PCs<=PCs+4; //Increment PC by 4
    end
    
endmodule
