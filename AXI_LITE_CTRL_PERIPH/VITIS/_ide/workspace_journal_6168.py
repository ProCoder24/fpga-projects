# 2026-04-20T20:04:58.483853800
import vitis

client = vitis.create_client()
client.set_workspace(path="VITIS")

platform = client.get_component(name="Uart_lite_pltfm2")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../HW/design_1_wrapper.xsa")

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../HW/design_1_wrapper.xsa")

status = platform.build()

status = platform.build()

comp = client.get_component(name="uartlite_app2")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../HW/design_1_wrapper.xsa")

status = platform.build()

status = platform.build()

comp.build()

