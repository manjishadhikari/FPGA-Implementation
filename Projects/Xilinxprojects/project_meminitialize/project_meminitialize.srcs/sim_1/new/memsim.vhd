library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity inst_memory_tb is
end;

architecture bench of inst_memory_tb is

  component inst_memory
  port
  (
  addr: IN std_logic_VECTOR(3 downto 0);
  inst: OUT std_logic_VECTOR(7 downto 0)
  );
  end component;

  signal addr: std_logic_VECTOR(3 downto 0);
  signal inst: std_logic_VECTOR(7 downto 0) ;

begin

  uut: inst_memory port map ( addr => addr,
                              inst => inst );

  stimulus: process
  begin
       addr<=0000;
       wait for 10 ns;
       addr<=0001;
       wait for 10 ns;
       addr<=0010;
       wait for 10 ns;
       addr<=1000;
       wait for 10 ns;
    -- Put initialisation code here


    -- Put test bench stimulus code here

    wait;
  end process;


end;
  