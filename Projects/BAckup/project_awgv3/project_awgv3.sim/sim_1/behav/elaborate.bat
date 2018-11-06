@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 3a74f61b177449089ee9f850dc297a52 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot awg_tb_behav xil_defaultlib.awg_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
