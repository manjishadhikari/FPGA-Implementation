library IEEE;
use IEEE.Std_logic_1164.all;


entity audioserzderz_tb is
end audioserzderz_tb;

architecture bench of audioserzderz_tb is

  component audioloop
      Port ( clock : in STD_LOGIC;
             mic_in : in STD_LOGIC;
             mic_sel: out std_logic;
             mic_clk: out std_logic;
             spk_out : out STD_LOGIC;
             data_16 : out STD_LOGIC_VECTOR (15 downto 0);
             ser_ena : out STD_LOGIC;
             par_ena : out STD_LOGIC);
  end component;

  signal clock: STD_LOGIC;
  signal mic_in: STD_LOGIC;
  signal mic_sel:  std_logic;
  signal mic_clk:  std_logic;
  signal spk_out: STD_LOGIC;
  signal data_16: STD_LOGIC_VECTOR (15 downto 0);
  signal ser_ena: STD_LOGIC;
  signal par_ena: STD_LOGIC;
  signal test: std_logic_vector(47 downto 0):="1111" & "1111" &"0000" &"0000" &
                                               "1100" & "1100" & "0011" & "0011" &
                                               "1010"& "1010" & "0101" & "0101";
begin

  uut: audioloop port map ( clock    => clock,
                                mic_in   => mic_in,
                                mic_sel=>mic_sel,
                                mic_clk=>mic_clk,
                                spk_out  => spk_out,
                                data_16 => data_16,
                                ser_ena   => ser_ena,
                                par_ena   => par_ena );

            mic_in<=test(47);
                                     process begin
                                            clock <= '1';
                                            wait for 5 ns;
                                            clock <= '0';
                                            wait for 5 ns;
                                     end process; 
  stimulus: process
  begin
  
    -- Put initialisation code here
    wait for 250 ns;
    test<=test(46 downto 0) & test(47);
    wait for 250 ns;

    -- Put test bench stimulus code here

   
  end process;


end bench;