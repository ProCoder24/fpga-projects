
`timescale 1ns / 1ps

module led_flash #(
    parameter integer CLK_RATE = 12000000,
    parameter integer FLASH_RATE_ON_MS = 500,
    parameter integer FLASH_RATE_OFF_MS = 500
)(
    input  wire clk,
    input  wire rst,
    output reg  led
);

    localparam integer ON_COUNT_MAX  = (CLK_RATE / 1000) * FLASH_RATE_ON_MS;
    localparam integer OFF_COUNT_MAX = (CLK_RATE / 1000) * FLASH_RATE_OFF_MS;

    reg [31:0] counter = 0;

    always @(posedge clk) begin
        if (rst) begin
            counter <= 0;
            led <= 1'b0;
        end else begin
            if (led == 1'b0) begin
                if (counter >= OFF_COUNT_MAX - 1) begin
                    counter <= 0;
                    led <= 1'b1;
                end else begin
                    counter <= counter + 1;
                end
            end else begin
                if (counter >= ON_COUNT_MAX - 1) begin
                    counter <= 0;
                    led <= 1'b0;
                end else begin
                    counter <= counter + 1;
                end
            end
        end
    end

endmodule