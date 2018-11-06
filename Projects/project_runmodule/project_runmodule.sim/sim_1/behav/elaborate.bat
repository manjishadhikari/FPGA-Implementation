@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 43150019dde74213ac2cc8f5dd0e639b -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot runmodule_tb_behav xil_defaultlib.runmodule_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
