library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ratecounter_sourcef_tb is
end ratecounter_sourcef_tb;

architecture bench of ratecounter_sourcef_tb is

  component ratecounter_source
      Port ( clk : in STD_LOGIC;
             reset : in STD_LOGIC;
             enable: in STD_LOGIC;
              ended: out STD_LOGIC;
             count : out STD_LOGIC_VECTOR(23 downto 0)
           );
  end component;

  signal clk: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal enable: STD_LOGIC;
  signal ended: STD_LOGIC;
  signal count: STD_LOGIC_VECTOR(23 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: ratecounter_source port map ( clk    => clk,
                                  reset  => reset,
                                  enable => enable,
                                  ended  => ended,
                                  count  => count );

  stimulus: process
  begin
     wait for 100 ns;
     reset<='1';
     wait for 30 ns;
     reset<='0';
     enable<='1';
     wait for 400 ns;
    -- Put initialisation code here
    
    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;