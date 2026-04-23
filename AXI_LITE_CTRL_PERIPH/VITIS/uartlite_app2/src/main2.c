#include "xil_printf.h"
#include "xparameters.h"
#include "xil_io.h"
#include "sleep.h"

#define LED_BASEADDR XPAR_MY_AXI_LED2_0_BASEADDR

int main(void)
{
    u32 val;

    xil_printf("Starting AXI LED readback test...\r\n");

    while (1)
    {
        Xil_Out32(LED_BASEADDR, 0x0);
        val = Xil_In32(LED_BASEADDR);
        xil_printf("Wrote 0x0, read back 0x%08lx\r\n", (unsigned long)val);
        sleep(1);

        Xil_Out32(LED_BASEADDR, 0x1);
        val = Xil_In32(LED_BASEADDR);
        xil_printf("Wrote 0x1, read back 0x%08lx\r\n", (unsigned long)val);
        sleep(1);
    }

    return 0;
}