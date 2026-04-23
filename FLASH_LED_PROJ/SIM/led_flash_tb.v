`timescale 1ns / 1ps

module led_flash_tb;

    reg clk = 0;
    reg rst = 1;
    wire led;

    localparam integer CLK_PERIOD = 83;   // approx. 12 MHz
    localparam integer RST_COUNT  = 10;

    led_flash #(
        .CLK_RATE(12000000),
        .FLASH_RATE_ON_MS(10),
        .FLASH_RATE_OFF_MS(10)
    ) uut (
        .clk(clk),
        .rst(rst),
        .led(led)
    );

    always #(CLK_PERIOD/2) clk = ~clk;

    initial begin
        rst = 1;
        #(RST_COUNT * CLK_PERIOD);
        @(posedge clk);
        rst = 0;
    end

    initial begin
        #50000000;   // 50 ms
        $stop;
    end

endmodule