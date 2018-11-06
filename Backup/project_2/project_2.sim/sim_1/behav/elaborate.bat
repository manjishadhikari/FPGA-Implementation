@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 954cc1a6a64f4795962528d3e34c615d -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_awg_behav xil_defaultlib.tb_awg -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
