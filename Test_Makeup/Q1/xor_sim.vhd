library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity lut_xor_tb is
end;

architecture bench of lut_xor_tb is

  component lut_xor
    Port (in1,in2: in std_logic;
       out1: out std_logic );
  end component;

  signal in1,in2: std_logic;
  signal out1: std_logic ;

begin

  uut: lut_xor port map ( in1  => in1,
                          in2  => in2,
                          out1 => out1 );

  stimulus: process
  begin
        in1<='0';
        in2<='1';
     
        
    -- Put initialisation code here


    -- Put test bench stimulus code here

    wait;
  end process;


end;
  