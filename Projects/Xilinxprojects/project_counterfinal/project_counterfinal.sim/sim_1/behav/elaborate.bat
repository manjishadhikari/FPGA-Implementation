@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 338c36092a914caca8861412d2bddd65 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot ratecounter_sourcef_tb_behav xil_defaultlib.ratecounter_sourcef_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
