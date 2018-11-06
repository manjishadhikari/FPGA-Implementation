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

#define LED_REG 0xC0000000

#define a_reg 0xC0000010
#define b_reg 0xC0000014
#define cr_reg 0xC0000018
#define ci_reg 0xC000001C
#define dr_reg 0xC0000020
#define di_reg 0xC0000024

#define wr_adr 0xC0000058
#define wr_data 0xC000005C
#define rd_data 0xC0000054
#define fir_data 0xC0000060
#define fir_data2 0xC0000070
#define fir_data3 0xC0000080
#define fir_data4 0xC0000090
#define fir_data5 0xC00000A0

unsigned long data;
unsigned long rd_a,rd_b,rd_cr,rd_ci,rd_dr,rd_di;
unsigned long rd_adr,rd_fir,rd_fir2,rd_fir3,rd_fir4,rd_fir5;
unsigned long rd_data1;

int main()
{
    init_platform();



    int i;


    print("EECS 700  Project 2  Manjish\r\n");
    print("Spring 2017 \n\r");

    //Switch to LED

    		data = in32(LED_REG);

    		out32(LED_REG,data);
    		xil_printf(" \nReading from switch to Led= 0x%X\r\n\n", data);
    		xil_printf("\nPut whileloop for instantaneous change\n");


    	//MAC Operation
    		xil_printf("MAC Operation: d=a*b+c\r\n");
    	out32(a_reg,0X00010002);
    	    rd_a=in32(a_reg);
    	    xil_printf("a: 0x%X\r\n",rd_a);

    	    out32(b_reg,0X00020000);
    	    rd_b=in32(b_reg);
    	    xil_printf("b: 0x%X\r\n",rd_b);

    	    out32(cr_reg,0X00000002);
    	        rd_cr=in32(cr_reg);
    	        xil_printf("Cr: 0x%X\r\n",rd_cr);

    	        out32(ci_reg,0x00000000);
    	         rd_ci=in32(ci_reg);
    	       xil_printf("ci: 0x%X\r\n",rd_ci);


    	      rd_dr=in32(dr_reg);
    	     xil_printf("dr: 0x%X\r\n",rd_dr);


    	           rd_di=in32(di_reg);
    	          xil_printf("di: 0x%X\r\n\n\n",rd_di);

    	 //DFT Operation

    for (i=0;i<=32;i++)   {

    out32(wr_adr,i);
    rd_adr=in32(wr_adr);
	out32(wr_data,0X00010000);  //Data values for performingDFT
     rd_data1=in32(rd_data);

    xil_printf("\nWrite Address: 0x%X   Data Read from memory 0x%X\r\n",rd_adr,rd_data1);


    }

    	xil_printf("\n\nDFT Values\n");
    	rd_fir=in32(fir_data);
         xil_printf("Fir X(0): 0x%X\n",rd_fir);

        rd_fir2=in32(fir_data2);
         xil_printf("FIR X(1): 0X%X\r\n",rd_fir2);

   	  rd_fir3=in32(fir_data3);
         xil_printf("FIR X(2): 0X%X\r\n",rd_fir3);

         rd_fir4=in32(fir_data4);
              xil_printf("FIR X(3): 0X%X\r\n",rd_fir4);

              rd_fir5=in32(fir_data5);
                   xil_printf("FIR X(4): 0X%X\r\n\n\n",rd_fir5);
    cleanup_platform();
    return 0;
}
