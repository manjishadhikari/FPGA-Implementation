@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 4ac14460703647a3ab0df5489c77acc2 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot lut_xor_tb_behav xil_defaultlib.lut_xor_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
