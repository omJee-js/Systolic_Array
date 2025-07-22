`timescale 1ns / 1ps

module tb_systolic_array;
    parameter N = 3;

    reg clk, reset;
    reg  [N*N*32-1:0] A_flat;
    reg  [N*N*32-1:0] B_flat;
    wire [N*N*32-1:0] C_flat;
    wire valid;

    reg  [31:0] C_matrix [0:N*N-1];

    // Instantiate DUT
    systolic_array #(N) dut (
        .clk(clk),
        .reset(reset),
        .A_flat(A_flat),
        .B_flat(B_flat),
        .C_flat(C_flat),
        .valid(valid)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    integer i, j, cycle;

    initial begin
        $dumpfile("systolic_array.vcd");
        $dumpvars(0, tb_systolic_array);

        clk = 0;
        reset = 1;
        cycle = 0;

        #10 reset = 0;

        // Matrix A (row-major): [ [1 2 3], [4 5 6], [7 8 9] ]
        A_flat = {
            32'd9, 32'd8, 32'd7,
            32'd6, 32'd5, 32'd4,
            32'd3, 32'd2, 32'd1
        };

        // Matrix B (row-major): [ [9 8 7], [6 5 4], [3 2 1] ]
        B_flat = {
            32'd1, 32'd2, 32'd3,
            32'd4, 32'd5, 32'd6,
            32'd7, 32'd8, 32'd9
        };

        // Start monitoring every clock cycle
        for (cycle = 0; cycle < 20; cycle = cycle + 1) begin
            @(posedge clk);

            // Read and print C_flat at each cycle
            for (i = 0; i < N*N; i = i + 1)
                C_matrix[i] = C_flat[i*32 +: 32];

            $display("Cycle %0d: C =", cycle);
            for (i = 0; i < N; i = i + 1) begin
                for (j = 0; j < N; j = j + 1)
                    $write("%0d\t", C_matrix[i*N + j]);
                $write("\n");
            end
            $display("");
        end

        $finish;
    end
endmodule
