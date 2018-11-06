

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity playlistcounter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable_pl: in STD_LOGIC;   
            wrap_pc: out std_logic  );   
          -- count : out STD_LOGIC_VECTOR(11 downto 0));
          
end playlistcounter;

architecture Behavioral of playlistcounter is
signal temp: STD_LOGIC_VECTOR(27 downto 0):=(others=>'0');
begin
process(clk,reset)
begin
 
   if rising_edge(clk) then
       if reset='1' then
         temp<=(others=>'0');
        wrap_pc<='0';
         else
            if enable_pl='0' then  
                temp<=temp;
               wrap_pc<='0';
            else
                if temp=x"17D7840" then
                    temp<=(others=>'0');
                    wrap_pc<='1';
                else
                    temp<=temp+1;
                   wrap_pc<='0';
                end if;
             end if;
        end if;
      end if;
 end process;
  -- count<=temp;
end Behavioral;
