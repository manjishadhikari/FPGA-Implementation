library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity clockgenerator_tb is
end;

architecture bench of clockgenerator_tb is

  component clockgenerator
          port(clock: in std_logic;
          par_en: out std_logic;
          ser_en: out std_logic
          );
  end component;

  signal clock: std_logic;
  signal par_en: std_logic;
  signal ser_en: std_logic ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: clockgenerator port map ( clock  => clock,
                                 par_en => par_en,
                                 ser_en => ser_en );

  stimulus: process
  begin
        wait for 10 us;
    -- Put initialisation code here


    -- Put test bench stimulus code here

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