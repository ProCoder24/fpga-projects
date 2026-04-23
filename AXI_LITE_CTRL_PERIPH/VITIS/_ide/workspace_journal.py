# 2026-04-20T21:28:20.679748600
import vitis

client = vitis.create_client()
client.set_workspace(path="VITIS")

platform = client.get_component(name="Uart_lite_pltfm2")
status = platform.build()

status = platform.build()

comp = client.get_component(name="uartlite_app2")
comp.build()

