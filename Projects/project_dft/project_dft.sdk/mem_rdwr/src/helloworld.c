/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xbasic_types.h"
#include "xil_types.h"

#define in32(addr) (*(volatile unsigned long *)(addr))
#define out32(addr,data) (*(volatile unsigned long *)(addr)=(data))


#define wr_adr 0xC0000050
#define wr_data 0xC0000058
#define rd_data 0xC0000074
#define fir_data 0xC0000080


int main()
{
    init_platform();


    unsigned long rd_a,rd_b,rd_cr,rd_ci,rd_dr,rd_di,rd_fir;
    int i;

    print("EECS 700   Manjish\r\n\n");
    print("DFT \n\r");

    for (i=0;i<=31;i++){

    out32(wr_adr,i);
    rd_a=in32(wr_adr);
    xil_printf("Write Address: 0x%X\r\n",rd_a);

    out32(wr_data,0X00000002);

         rd_ci=in32(rd_data);
       xil_printf("Data read from memory at that address: 0x%X\r\n\n\n",rd_ci);

       rd_fir=in32(fir_data);
      xil_printf("Fir X(0): 0X%X/r/n",rd_fir);

       xil_printf("why?\n");
    }

    cleanup_platform();
    return 0;
}
