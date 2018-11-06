


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity serialiser1 is
    Port ( clock : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
         --  par_ensig: in std_logic;
           ser_ensig: in std_logic;
           shift: out STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC);
end serialiser1;

architecture Behavioral of serialiser1 is
signal shiftreg: std_logic_vector(15 downto 0):=(others=>'0'); 
begin
process(clock)
begin
 if rising_edge(clock) then
--    if par_ensig='1' then
--           shiftreg<=data_in;
--    end if;
       shiftreg<=data_in;  
    if ser_ensig='1' then
            shiftreg<=shiftreg(0) & shiftreg(15 downto 1);
            data_out<=shiftreg(0);
           else shiftreg<=shiftreg;
    end if;
  
end if;
end process;
 
shift<=shiftreg;


end Behavioral;
