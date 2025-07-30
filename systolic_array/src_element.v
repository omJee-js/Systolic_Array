// pe.v
// Single Processing Element for Systolic Array

module mac_unit (
    input  wire        clk,
    input  wire        reset,
    input  wire [31:0] a_in,
    input  wire [31:0] b_in,
    input  wire [31:0] acc_in,
    output reg  [31:0] a_out,
    output reg  [31:0] b_out,
    output reg  [31:0] acc_out
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            acc_out <= 0;
            a_out <= 0;
            b_out <= 0;
        end else begin
            acc_out <= acc_in + a_in * b_in;
            a_out <= a_in;
            b_out <= b_in;
        end
    end
endmodule
