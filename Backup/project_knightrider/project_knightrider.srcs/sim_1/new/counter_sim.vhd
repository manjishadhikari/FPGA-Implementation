library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Addrr_counter_tb is
end;

architecture bench of Addrr_counter_tb is

  component Addrr_counter
      Port ( clk : in STD_LOGIC;
             rst : in STD_LOGIC;
             ce : in STD_LOGIC;
             countout : out STD_LOGIC_VECTOR (15 downto 0)
             );
  end component;

  signal clk: STD_LOGIC;
  signal rst: STD_LOGIC;
  signal ce: STD_LOGIC;
  signal countout: STD_LOGIC_VECTOR (15 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: Addrr_counter port map ( clk      => clk,
                                rst      => rst,
                                ce       => ce,
                                countout => countout );

  stimulus: process
  begin
    wait for 100 ns
    
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