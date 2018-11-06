
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity awg_tb is
end;

architecture bench of awg_tb is

  component awg
      Port ( clk1 : in STD_LOGIC;
             reset1 : in STD_LOGIC;
              play: in STD_LOGIC;
              volcontrol: in STD_LOGIC_VECTOR(3 downto 0);
             pdmout : out STD_LOGIC;
             data_out: out STD_LOGIC_VECTOR(9 downto 0);
              Vol_out1: out STD_LOGIC_VECTOR(9 downto 0);
              Error: out STD_LOGIC_VECTOR(9 downto 0);
             wrap_out: out std_logic;
             wrap_addr:out std_logic;
             busy: out std_logic
             );
  end component;

  signal clk1: STD_LOGIC;
  signal reset1: STD_LOGIC;
  signal play: STD_LOGIC;
  signal volcontrol: STD_LOGIC_VECTOR(3 downto 0);
  signal pdmout: STD_LOGIC;
  signal data_out: STD_LOGIC_VECTOR(9 downto 0);
  signal Vol_out1: STD_LOGIC_VECTOR(9 downto 0);
  signal Error: STD_LOGIC_VECTOR(9 downto 0);
  signal wrap_out: std_logic;
  signal wrap_addr: std_logic;
  signal busy: std_logic ;

  constant clk_period : time := 10 ns;
  
begin

  uut: awg port map ( clk1       => clk1,
                      reset1     => reset1,
                      play       => play,
                      volcontrol => volcontrol,
                      pdmout        => pdmout,
                      data_out   => data_out,
                      Vol_out1=>Vol_out1,
                      Error=>Error,
                      wrap_out   => wrap_out,
                      wrap_addr  => wrap_addr,
                      busy       => busy );
                      
   clk_process : process
                        begin
                               clk1 <= '0';
                                 wait for clk_period/2;
                                clk1 <= '1';
                                  wait for clk_period/2;
                        end process;

  stimulus: process
  begin
    reset1<='1';
    play<='0';
    volcontrol<="0000";
    wait for 30 ns;
    reset1<='0';
    play<='1';
    volcontrol<="0001";
    -- Put initialisation code here


    -- Put test bench stimulus code here

    wait;
  end process;


end;