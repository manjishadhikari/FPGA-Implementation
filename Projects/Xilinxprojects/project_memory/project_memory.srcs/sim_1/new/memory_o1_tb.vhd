library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity memory_01_tb is
end;

architecture bench of memory_01_tb is

  component memory_01
      port (CLK  : in std_logic;
            WE   : in std_logic;
            EN   : in std_logic;
            ADDR : in std_logic_vector(4 downto 0);
            DI   : in std_logic_vector(15 downto 0);
            DO   : out std_logic_vector(15 downto 0));
  end component;

  signal CLK: std_logic;
  signal WE: std_logic;
  signal EN: std_logic;
  signal ADDR: std_logic_vector(4 downto 0);
  signal DI: std_logic_vector(15 downto 0);
  signal DO: std_logic_vector(15 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: memory_01 port map ( CLK  => CLK,
                            WE   => WE,
                            EN   => EN,
                            ADDR => ADDR,
                            DI   => DI,
                            DO   => DO );

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      CLK <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;