library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity serializer_tb is
end;

architecture bench of serializer_tb is

  component serializer
      Port ( clock : in STD_LOGIC;
             data_in : in STD_LOGIC_VECTOR (15 downto 0);
             data_out : out STD_LOGIC);
  end component;

  signal clock: STD_LOGIC;
  signal data_in: STD_LOGIC_VECTOR (15 downto 0);
  signal data_out: STD_LOGIC;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: serializer port map ( clock    => clock,
                             data_in  => data_in,
                             data_out => data_out );

  stimulus: process
  begin
  
    -- Put initialisation code here
     data_in<="1111"& "1111" &"0000" &"0000";
     wait for 50 ns;
     data_in<="0000" &"0000" &"0000" &"0000";
     wait for 50 ns;
    -- Put test bench stimulus code here

   
   
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clock <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
  