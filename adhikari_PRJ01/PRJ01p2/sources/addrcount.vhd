

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity addrcounter_source is
    Port ( clk : in STD_LOGIC;
          
           addr_enable: in STD_LOGIC;
          -- wrap:out STD_LOGIC;
           count : out STD_LOGIC_VECTOR(13 downto 0)
         );
end addrcounter_source;

architecture Behavioral of addrcounter_source is
signal temp: STD_LOGIC_VECTOR(13 downto 0):=(others=>'0');

begin
process(clk)
begin
  
   if rising_edge(clk) then
     
            if addr_enable='0' then  
                temp<=temp;
              
            else
                if temp="1111111111111" then
                    temp<=(others=>'0');
                   
                   
                else
                    temp<=temp+1;
                   
                   
                end if;
             end if;
        end if;
      
 end process;
    count<=temp;
   
end Behavioral;
