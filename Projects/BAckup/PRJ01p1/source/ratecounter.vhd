

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity ratecounter_source is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable: in STD_LOGIC;
           wrap: out STD_LOGIC
           --count : out STD_LOGIC_VECTOR(23 downto 0)
           
         );
end ratecounter_source;

architecture Behavioral of ratecounter_source is
signal temp: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal limit : STD_LOGIC_VECTOR(15 downto 0):= X"2000"; ----#X"2000"=> (8192)
begin
process(clk,reset)
begin
 
   if rising_edge(clk) then
       if reset='1' then
         temp<=(others=>'0');
         wrap<='0';
         else
            if enable='0' then  
                temp<=temp;
                wrap<='0';
            else
                if temp=limit then
                    temp<=(others=>'0');
                  wrap<='1' ;
                else
                    temp<=temp+1;
                    wrap<='0';
                end if;
             end if;
        end if;
      end if;
 end process;
    --count<=temp;
end Behavioral;
