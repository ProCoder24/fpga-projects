# FPGA LED Flash - Cmod A7-35T

Simple Verilog LED flashing project for the Digilent Cmod A7-35T using Vivado.


## Features

- Parameterized LED blink rate (ON/OFF time)
- Clock-driven design (12 MHz onboard clock)
- Synthesizable on Xilinx Artix-7 FPGA
- Fully simulated testbench

## Hardware

- Board: Digilent Cmod A7-35T
- FPGA: Xilinx Artix-7 (xc7a35t)
- Clock: 12 MHz onboard oscillator

## How It Works

The design uses a counter driven by the system clock to toggle the LED at a defined interval.

- Counter increments every clock cycle
- When threshold is reached → LED toggles
- Timing derived from clock frequency


## Project Structure

- `src/` : synthesizable HDL
- `sim/` : simulation testbenches
- `constraints/` : XDC constraints
- `scripts/` : Vivado TCL project recreation scripts

## Files

- `src/led_flash.v` : LED flash module
- `sim/led_flash_tb.v` : simulation testbench
- `constraints/cmod_a7_35t.xdc` : board pin constraints
- `scripts/recreate_project.tcl` : recreate Vivado project

## How to Recreate the Vivado Project

Open Vivado TCL console and run:

```tcl
cd "FLASH_LED_PROJ/SCRIPTS"
source recreate_flash_led_proj.tcl