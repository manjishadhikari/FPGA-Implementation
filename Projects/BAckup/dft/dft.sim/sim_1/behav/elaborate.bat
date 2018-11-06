@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 9a79ae4e0fa84f1aa134e945d26e6e2a -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot dft_tb_behav xil_defaultlib.dft_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
