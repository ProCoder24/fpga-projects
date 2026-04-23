`timescale 1ns / 1ps

module tb_my_axi_led2_slave_lite_v1_0_S00_AXI;

    localparam integer C_S_AXI_DATA_WIDTH = 32;
    localparam integer C_S_AXI_ADDR_WIDTH = 4;

    reg                                 S_AXI_ACLK;
    reg                                 S_AXI_ARESETN;
    reg  [C_S_AXI_ADDR_WIDTH-1:0]       S_AXI_AWADDR;
    reg  [2:0]                          S_AXI_AWPROT;
    reg                                 S_AXI_AWVALID;
    wire                                S_AXI_AWREADY;
    reg  [C_S_AXI_DATA_WIDTH-1:0]       S_AXI_WDATA;
    reg  [(C_S_AXI_DATA_WIDTH/8)-1:0]   S_AXI_WSTRB;
    reg                                 S_AXI_WVALID;
    wire                                S_AXI_WREADY;
    wire [1:0]                          S_AXI_BRESP;
    wire                                S_AXI_BVALID;
    reg                                 S_AXI_BREADY;
    reg  [C_S_AXI_ADDR_WIDTH-1:0]       S_AXI_ARADDR;
    reg  [2:0]                          S_AXI_ARPROT;
    reg                                 S_AXI_ARVALID;
    wire                                S_AXI_ARREADY;
    wire [C_S_AXI_DATA_WIDTH-1:0]       S_AXI_RDATA;
    wire [1:0]                          S_AXI_RRESP;
    wire                                S_AXI_RVALID;
    reg                                 S_AXI_RREADY;
    wire                                led_out;

    reg [31:0] read_data;

    // DUT
    my_axi_led2_slave_lite_v1_0_S00_AXI #(
        .C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
        .C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
    ) dut (
        .led_out(led_out),
        .S_AXI_ACLK(S_AXI_ACLK),
        .S_AXI_ARESETN(S_AXI_ARESETN),
        .S_AXI_AWADDR(S_AXI_AWADDR),
        .S_AXI_AWPROT(S_AXI_AWPROT),
        .S_AXI_AWVALID(S_AXI_AWVALID),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .S_AXI_WDATA(S_AXI_WDATA),
        .S_AXI_WSTRB(S_AXI_WSTRB),
        .S_AXI_WVALID(S_AXI_WVALID),
        .S_AXI_WREADY(S_AXI_WREADY),
        .S_AXI_BRESP(S_AXI_BRESP),
        .S_AXI_BVALID(S_AXI_BVALID),
        .S_AXI_BREADY(S_AXI_BREADY),
        .S_AXI_ARADDR(S_AXI_ARADDR),
        .S_AXI_ARPROT(S_AXI_ARPROT),
        .S_AXI_ARVALID(S_AXI_ARVALID),
        .S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_RDATA(S_AXI_RDATA),
        .S_AXI_RRESP(S_AXI_RRESP),
        .S_AXI_RVALID(S_AXI_RVALID),
        .S_AXI_RREADY(S_AXI_RREADY)
    );

    // 100 MHz clock
    initial begin
        S_AXI_ACLK = 1'b0;
        forever #5 S_AXI_ACLK = ~S_AXI_ACLK;
    end

    // AXI write task
    task axi_write;
        input [C_S_AXI_ADDR_WIDTH-1:0] addr;
        input [C_S_AXI_DATA_WIDTH-1:0] data;
        begin
            @(posedge S_AXI_ACLK);
            S_AXI_AWADDR  <= addr;
            S_AXI_AWVALID <= 1'b1;
            S_AXI_WDATA   <= data;
            S_AXI_WSTRB   <= 4'b1111;
            S_AXI_WVALID  <= 1'b1;
            S_AXI_BREADY  <= 1'b1;

            wait (S_AXI_AWREADY && S_AXI_WREADY);
            @(posedge S_AXI_ACLK);
            S_AXI_AWVALID <= 1'b0;
            S_AXI_WVALID  <= 1'b0;

            wait (S_AXI_BVALID);
            @(posedge S_AXI_ACLK);
            S_AXI_BREADY  <= 1'b0;
        end
    endtask

    // AXI read task
    task axi_read;
        input  [C_S_AXI_ADDR_WIDTH-1:0] addr;
        output [C_S_AXI_DATA_WIDTH-1:0] data;
        begin
            @(posedge S_AXI_ACLK);
            S_AXI_ARADDR  <= addr;
            S_AXI_ARVALID <= 1'b1;
            S_AXI_RREADY  <= 1'b1;

            wait (S_AXI_ARREADY);
            @(posedge S_AXI_ACLK);
            S_AXI_ARVALID <= 1'b0;

            wait (S_AXI_RVALID);
            data = S_AXI_RDATA;
            @(posedge S_AXI_ACLK);
            S_AXI_RREADY <= 1'b0;
        end
    endtask

    initial begin
        // init
        S_AXI_ARESETN = 1'b0;
        S_AXI_AWADDR  = 4'b0000;
        S_AXI_AWPROT  = 3'b000;
        S_AXI_AWVALID = 1'b0;
        S_AXI_WDATA   = 32'h00000000;
        S_AXI_WSTRB   = 4'b0000;
        S_AXI_WVALID  = 1'b0;
        S_AXI_BREADY  = 1'b0;
        S_AXI_ARADDR  = 4'b0000;
        S_AXI_ARPROT  = 3'b000;
        S_AXI_ARVALID = 1'b0;
        S_AXI_RREADY  = 1'b0;

        // hold reset
        repeat (5) @(posedge S_AXI_ACLK);
        S_AXI_ARESETN = 1'b1;
        repeat (2) @(posedge S_AXI_ACLK);

        // Write 0 to register 0 -> LED should be 0
        $display("---- WRITE 0x00000000 TO REG0 ----");
        axi_write(4'h0, 32'h00000000);
        axi_read(4'h0, read_data);
        $display("READ BACK REG0 = 0x%08h, led_out = %0d", read_data, led_out);

        if (read_data !== 32'h00000000)
            $display("ERROR: expected REG0 = 0x00000000");
        if (led_out !== 1'b0)
            $display("ERROR: expected led_out = 0");

        repeat (2) @(posedge S_AXI_ACLK);

        // Write 1 to register 0 -> LED should be 1
        $display("---- WRITE 0x00000001 TO REG0 ----");
        axi_write(4'h0, 32'h00000001);
        axi_read(4'h0, read_data);
        $display("READ BACK REG0 = 0x%08h, led_out = %0d", read_data, led_out);

        if (read_data !== 32'h00000001)
            $display("ERROR: expected REG0 = 0x00000001");
        if (led_out !== 1'b1)
            $display("ERROR: expected led_out = 1");

        repeat (2) @(posedge S_AXI_ACLK);

        // Write a pattern to register 1
        $display("---- WRITE 0xAAAAAAAA TO REG1 ----");
        axi_write(4'h4, 32'hAAAAAAAA);
        axi_read(4'h4, read_data);
        $display("READ BACK REG1 = 0x%08h", read_data);

        if (read_data !== 32'hAAAAAAAA)
            $display("ERROR: expected REG1 = 0xAAAAAAAA");

        $display("Simulation finished.");
        #50;
        $finish;
    end

endmodule