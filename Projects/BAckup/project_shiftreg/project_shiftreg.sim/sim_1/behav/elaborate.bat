@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 7b1e9cf739c94392940c867e7f1f9d62 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot shiftregstr_tb_behav xil_defaultlib.shiftregstr_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
