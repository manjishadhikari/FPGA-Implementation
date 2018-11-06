library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity counter_sourcef_tb is
end;

architecture bench of counter_sourcef_tb is

  component counter_sourcef
      Port ( clk : in STD_LOGIC;
             reset : in STD_LOGIC;
             count : out STD_LOGIC_VECTOR(4 downto 0)
            );
  end component;

  signal clk: STD_LOGIC;
  signal reset: STD_LOGIC:='0';
  signal count: STD_LOGIC_VECTOR(4 downto 0):="00000";
  

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: counter_sourcef port map ( clk   => clk,
                                  reset => reset,
                                  count => count
                                  );

  stimulus: process
  begin
  
    -- Put initialisation code here
    wait for 20ns;
    reset<='1';
    wait for 20 ns;
    reset<='0';
    wait for 100 ns;
    

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