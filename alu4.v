// Code your design here
module alu4(
    input  [3:0] a,
    input  [3:0] b,
    input  [2:0] op,
    output reg [3:0] result,
    output reg carry,
    output zero
);

reg [4:0] temp;

always @(*) begin

    // Default values
    result = 4'b0000;
    carry  = 1'b0;
    temp   = 5'b00000;

    case(op)

        // 000 : Addition
        3'b000: begin
            temp   = {1'b0, a} + {1'b0, b};
            result = temp[3:0];
            carry  = temp[4];
        end

        // 001 : Subtraction (A + Two's Complement of B)
        3'b001: begin
            temp   = {1'b0, a} + {1'b0, (~b + 4'b0001)};
            result = temp[3:0];
            carry  = temp[4];
        end

        // 010 : AND
        3'b010: begin
            result = a & b;
        end

        // 011 : OR
        3'b011: begin
            result = a | b;
        end

        // 100 : XOR
        3'b100: begin
            result = a ^ b;
        end

        // 101 : NOT A
        3'b101: begin
            result = ~a;
        end

        default: begin
            result = 4'b0000;
            carry  = 1'b0;
        end

    endcase

end

assign zero = (result == 4'b0000);

endmodule
