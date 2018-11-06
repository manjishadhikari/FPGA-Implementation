library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity volume_tb is
end;

architecture voltestbench of volume_tb is

  component volume
   Port ( clk: in std_logic;
            volcontrol: in std_logic_vector(3 downto 0);
            data_in : in std_logic_vector(9 downto 0);
            data_out: out std_logic_vector(9 downto 0)  );
  end component;

  signal clk: std_logic;
  signal volcontrol: std_logic_vector(3 downto 0);
  signal data_in: std_logic_vector(9 downto 0);
  signal data_out: std_logic_vector(9 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: volume port map ( clk        => clk,
                         volcontrol => volcontrol,
                         data_in    => data_in,
                         data_out   => data_out );

  stimulus: process
  begin
     data_in<="11111111110000";
     volcontrol<="0001";
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