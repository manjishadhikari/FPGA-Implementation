

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity playlistaddrcounter is
    Port ( clk : in STD_LOGIC;
          
           pladdr_enable: in STD_LOGIC;
          -- wrap:out STD_LOGIC;
           count : out STD_LOGIC_VECTOR(5 downto 0)
         );
end playlistaddrcounter;

architecture Behavioral of playlistaddrcounter is
signal temp: STD_LOGIC_VECTOR(5 downto 0):=(others=>'0');

begin
process(clk)
begin
  
   if rising_edge(clk) then
     
            if pladdr_enable='0' then  
                temp<=temp;
              
            else
                if temp="111111" then
                    temp<=(others=>'0');
                   
                   
                else
                    temp<=temp+1;
                   
                   
                end if;
             end if;
        end if;
      
 end process;
    count<=temp;
   
end Behavioral;
