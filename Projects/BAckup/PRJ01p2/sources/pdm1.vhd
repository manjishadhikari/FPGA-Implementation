library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pdm is
  port (
   clk : in std_logic;
   reset: in std_logic;
   datain : in std_logic_vector (9 downto 0);
   dataout : out std_logic
  -- error : out std_logic_vector (9 downto 0) 
  );
end pdm;

architecture Behavioral of pdm is

  signal datain_temp : std_logic_vector (9 downto 0) ;
  signal error_0 : std_logic_vector (9 downto 0) ;
  signal error_1 : std_logic_vector (9 downto 0) ;
  signal error_sig : std_logic_vector (9 downto 0) := "0000000000";
begin
  process(clk)
  begin
    if rising_edge(clk) then      
        datain_temp <= datain;
        error_1 <= error_sig + "1111111111" - datain_temp;
        error_0 <= error_sig - datain_temp;
        
        
        
        if reset = '1' then
              dataout <= '0';
              error_sig <= "0000000000";
       elsif (datain_temp >= error_sig) then
              dataout <= '1';
              error_sig <= error_1;
       else 
              dataout <= '0';
              error_sig <= error_0;
       end if;

    end if;
    
 
  end process;
--error <= error_sig;
end Behavioral;