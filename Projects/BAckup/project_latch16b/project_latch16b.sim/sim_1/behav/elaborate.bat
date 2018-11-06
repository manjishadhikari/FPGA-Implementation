@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 58486519c9cb405982b386cadacb3cfd -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot latch16b_tb_behav xil_defaultlib.latch16b_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
