`timescale 1ns/1ps

module tb_alu4;

reg  [3:0] a;
reg  [3:0] b;
reg  [2:0] op;

wire [3:0] result;
wire carry;
wire zero;

// Instantiate ALU
alu4 uut (
    .a(a),
    .b(b),
    .op(op),
    .result(result),
    .carry(carry),
    .zero(zero)
);

initial begin

    $display("========================================");
    $display("        4-BIT ALU TEST START");
    $display("========================================");

    // Test 1 : ADD
    a = 4'd5;
    b = 4'd3;
    op = 3'b000;
    #10;

    if(result == 4'd8)
        $display("ADD PASS");
    else
        $display("ADD FAIL");

    // Test 2 : SUB
    a = 4'd7;
    b = 4'd2;
    op = 3'b001;
    #10;

    if(result == 4'd5)
        $display("SUB PASS");
    else
        $display("SUB FAIL");

    // Test 3 : Negative Result (2-5)
    a = 4'd2;
    b = 4'd5;
    op = 3'b001;
    #10;

    $display("2-5 Result = %b", result);

    // Test 4 : AND
    a = 4'b1100;
    b = 4'b1010;
    op = 3'b010;
    #10;

    if(result == 4'b1000)
        $display("AND PASS");
    else
        $display("AND FAIL");

    // Test 5 : OR
    op = 3'b011;
    #10;

    if(result == 4'b1110)
        $display("OR PASS");
    else
        $display("OR FAIL");

    // Test 6 : XOR
    op = 3'b100;
    #10;

    if(result == 4'b0110)
        $display("XOR PASS");
    else
        $display("XOR FAIL");

    // Test 7 : NOT
    a = 4'b1010;
    op = 3'b101;
    #10;

    if(result == 4'b0101)
        $display("NOT PASS");
    else
        $display("NOT FAIL");

    // Test 8 : Zero Flag
    a = 4'd5;
    b = 4'd5;
    op = 3'b001;
    #10;

    if(zero)
        $display("ZERO FLAG PASS");
    else
        $display("ZERO FLAG FAIL");

    // Test 9 : Overflow
    a = 4'd15;
    b = 4'd1;
    op = 3'b000;
    #10;

    $display("Overflow Test");
    $display("Result = %d", result);
    $display("Carry  = %b", carry);

    $display("========================================");
    $display("ALL TESTS COMPLETED");
    $display("========================================");

    $finish;

end

endmodule
