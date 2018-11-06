

library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity tb_deserializer_tb is
end ;

architecture tb of tb_deserializer_tb is

    component deserializer
        port (clock   : in std_logic;
              mic_in  : in std_logic;
                mic_clk: out std_logic;
              par_out:out std_logic;
              ser_out: out std_logic;
              sdata:out std_logic_vector (15 downto 0);
              data_16 : out std_logic_vector (15 downto 0));
    end component;

    signal par_out:std_logic;
    signal ser_out: std_logic;
    signal clock   : std_logic;
    signal mic_in  : std_logic:='0';
    signal mic_clk: std_logic;
     signal sdata : std_logic_vector (15 downto 0);
    signal data_16 : std_logic_vector (15 downto 0);
    signal test: std_logic_vector(15 downto 0):="1111" & "1111" &"0000" &"0000";
    
begin

    dut : deserializer
    port map (clock   => clock,
    par_out=>par_out,
    ser_out=>ser_out,
    mic_clk=>mic_clk,
              mic_in  => mic_in,
              sdata=>sdata,
              data_16 => data_16);
              
              
     
    mic_in<=test(15);
    
     process begin
            clock <= '1';
            wait for 10 ns;
            clock <= '0';
            wait for 10 ns;
     end process; 
     
 stim:process 
    begin
        -- EDIT Adapt initialization as needed
        wait for 100 ns;
       test<=test(14 downto 0) & test(15);
        wait for 250 ns;
       
    end process;

end tb;