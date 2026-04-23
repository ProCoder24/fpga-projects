# 2026-04-20T15:57:17.606042500
import vitis

client = vitis.create_client()
client.set_workspace(path="VITIS")

platform = client.create_platform_component(name = "Uart_lite_pltfm2",hw_design = "$COMPONENT_LOCATION/../../HW/design_1_wrapper.xsa",os = "standalone",cpu = "microblaze_0",domain_name = "standalone_microblaze_0",compiler = "gcc")

platform = client.get_component(name="Uart_lite_pltfm2")
status = platform.build()

comp = client.create_app_component(name="uartlite_app2",platform = "$COMPONENT_LOCATION/../Uart_lite_pltfm2/export/Uart_lite_pltfm2/Uart_lite_pltfm2.xpfm",domain = "standalone_microblaze_0")

status = platform.build()

comp = client.get_component(name="uartlite_app2")
comp.build()

vitis.dispose()

