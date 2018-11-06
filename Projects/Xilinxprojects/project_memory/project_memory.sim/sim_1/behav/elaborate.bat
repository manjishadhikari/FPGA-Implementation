@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 3564f6af88f54d3ab4e95248c9775835 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot memory_01_tb_behav xil_defaultlib.memory_01_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
