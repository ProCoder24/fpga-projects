# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "C:\\FPGA\\AXI_LITE_CTRL_PERIPH\\VITIS\\Uart_lite_pltfm2\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\sleep.h"
  "C:\\FPGA\\AXI_LITE_CTRL_PERIPH\\VITIS\\Uart_lite_pltfm2\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\xiltimer.h"
  "C:\\FPGA\\AXI_LITE_CTRL_PERIPH\\VITIS\\Uart_lite_pltfm2\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\xtimer_config.h"
  "C:\\FPGA\\AXI_LITE_CTRL_PERIPH\\VITIS\\Uart_lite_pltfm2\\microblaze_0\\standalone_microblaze_0\\bsp\\lib\\libxiltimer.a"
  )
endif()
