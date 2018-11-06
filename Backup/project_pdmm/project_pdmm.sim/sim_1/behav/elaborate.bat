@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 3f82f66e0a5745518722ecffa8a2fc81 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot pdm_tb_behav xil_defaultlib.pdm_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
