`timescale 1ns / 1ps
module systolic_array #(
    parameter N = 3
)(
    input  wire        clk,
    input  wire        reset,
    input  wire [N*N*32-1:0] A_flat,
    input  wire [N*N*32-1:0] B_flat,
    output wire [N*N*32-1:0] C_flat,
    output reg         valid
);

    // Internal unpacked 2D arrays
    wire [31:0] a_data [0:N-1][0:N];
    wire [31:0] b_data [0:N][0:N-1];
    wire [31:0] acc_out [0:N-1][0:N-1];

    // Cycle counter
    reg [$clog2(3*N):0] cycle;

    always @(posedge clk or posedge reset) begin
        if (reset)
            cycle <= 0;
        else
            cycle <= cycle + 1;
    end

    // Set valid when enough cycles have passed
    always @(posedge clk or posedge reset) begin
        if (reset)
            valid <= 0;
        else if (cycle >= 2*N - 1)
            valid <= 1;
    end

    genvar i, j;
    generate
        for (i = 0; i < N; i = i + 1) begin: row
            for (j = 0; j < N; j = j + 1) begin: col
                wire [31:0] a_in = a_data[i][j];
                wire [31:0] b_in = b_data[i][j];
                wire [31:0] acc_in = (reset) ? 32'd0 : acc_out[i][j];

                mac_unit mac (
                    .clk(clk),
                    .reset(reset),
                    .a_in(a_in),
                    .b_in(b_in),
                    .acc_in(acc_in),
                    .a_out(a_data[i][j+1]),
                    .b_out(b_data[i+1][j]),
                    .acc_out(acc_out[i][j])
                );

                assign C_flat[(i*N + j)*32 +: 32] = acc_out[i][j];
            end
        end
    endgenerate

    // Feed left and top inputs
    genvar k;
    generate
        for (k = 0; k < N; k = k + 1) begin: load_inputs
            wire [31:0] a_val = A_flat[(k*N + (cycle - k))*32 +: 32];
            wire [31:0] b_val = B_flat[((cycle - k)*N + k)*32 +: 32];

            assign a_data[k][0] = (cycle >= k && (cycle - k) < N) ? a_val : 32'd0;
            assign b_data[0][k] = (cycle >= k && (cycle - k) < N) ? b_val : 32'd0;
        end
    endgenerate

endmodule
