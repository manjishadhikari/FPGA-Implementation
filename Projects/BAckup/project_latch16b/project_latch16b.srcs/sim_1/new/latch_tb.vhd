
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity latch16b_tb is
end;

architecture bench of latch16b_tb is

  component latch16b
      Port ( clock : in STD_LOGIC;
             par_en : in STD_LOGIC;
             data_in : in STD_LOGIC_vector(15 downto 0);
             data_out : out STD_LOGIC_vector(15 downto 0));
  end component;

  signal clock: STD_LOGIC;
  signal par_en: STD_LOGIC;
  signal data_in: STD_LOGIC_vector(15 downto 0);
  signal data_out: STD_LOGIC_vector(15 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: latch16b port map ( clock    => clock,
                           par_en   => par_en,
                           data_in  => data_in,
                           data_out => data_out );

  stimulus: process
  begin
    par_en<='0';
    -- Put initialisation code here


    -- Put test bench stimulus code here
    wait for 30 ns;
    data_in<="1111111111111111";
    wait for 30 ns;
    par_en<='1';
    wait for 60 ns;
    stop_the_clock <= true;
    wait;
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