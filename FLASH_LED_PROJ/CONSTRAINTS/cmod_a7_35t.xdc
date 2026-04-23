## Clock
set_property PACKAGE_PIN L17 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
create_clock -name sysclk -period 83.33 [get_ports {clk}]

## Reset button
set_property PACKAGE_PIN A18 [get_ports {rst}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst}]

## LED
set_property PACKAGE_PIN A17 [get_ports {led}]
set_property IOSTANDARD LVCMOS33 [get_ports {led}]