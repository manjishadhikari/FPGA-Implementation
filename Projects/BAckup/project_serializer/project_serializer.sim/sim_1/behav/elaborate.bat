@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 0d2f0eb7a8164d81a1b71af707f98505 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot serializer_tb_behav xil_defaultlib.serializer_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
