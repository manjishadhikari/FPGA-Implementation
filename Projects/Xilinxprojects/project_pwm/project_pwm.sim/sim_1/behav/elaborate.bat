@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 4be073f9046c405da29f8acab5fbf936 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_question_5_behav xil_defaultlib.tb_question_5 -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
