library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity runmodule_tb is
end;

architecture bench of runmodule_tb is

  component runmodule
      port(clk: in std_logic;
      play: in std_logic;
      done : in std_logic;
      run: out std_logic
      );
  end component;

  signal clk: std_logic;
  signal play: std_logic;
  signal done: std_logic;
  signal run: std_logic ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: runmodule port map ( clk  => clk,
                            play => play,
                            done => done,
                            run  => run );

  stimulus: process
  begin
     wait for 30 ns;
     play<='1';
            wait for 10 ns;
            play<='0';
            done<='0';
        wait for 10 ns;
        play<='1';
        done<='0';
        wait for 20 ns;
        play<='0';
        wait for 50 ns;
        done<='1';
        wait for 10 ns;
        done<='0';
        wait for 60 ns;
        play<='1';
        wait for 10 ns;
        play<='0';
        wait for 10 ns;
        play<='0';
        wait for 60 ns;
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