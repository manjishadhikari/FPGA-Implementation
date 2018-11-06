library ieee;
use ieee.std_logic_1164.all; use ieee.std_logic_unsigned.all;

entity knight_rider is 
port (clock : in std_logic; --enable : in std_logic; 
switch : in std_logic_vector(15 downto 0); 
led : out std_logic_vector(7 downto 0));
 end knight_rider;
 
architecture behavior of knight_rider is

component counter
port (clock : in std_logic; 
        enable : in std_logic; limit :
        in std_logic_vector(15 downto 0); 
        count : out std_logic_vector(15 downto 0); 
        wrap : out std_logic);
end component;
  
component memory_01
port (CLK : in std_logic;
     ADDR: in std_logic_vector(15 downto 0);
     DO : out std_logic_vector(7 downto 0));
end component;
   
signal step : std_logic; 
signal addr : std_logic_vector(15 downto 0); 
signal limit : std_logic_vector(15 downto 0);

begin
with switch(3 downto 0) select
limit <= "0000" & "1101" & "0010" & "0111"  when "0001", --quarter second
"0001" & "1010" & "0100" & "1110" when "0011", --half second
"0011" & "0100" & "1001" & "1101" when "0101", --one second
"0110" & "1001" & "0011" & "1011" when "0111", --two seconds
"1001" & "1101" & "1101" & "1001" when "1001", --three seconds
"1101" & "0010" & "0111" & "0111" when "1011", --four seconds
"0000" & "0000" & "0000" & "0000" when others;

rate_counter : counter port map (clock => clock,
enable => switch(0),
--enable => '1',
limit => limit,
--limit => switch & "0000" & "0000",
--count => count,
wrap => step);

addr_counter : counter port map (clock => clock,
enable => step,
limit => "1111" & "1111" & "1111" & "1111",
count => addr);
--wrap => wrap);
led_rom : memory_01 port map (CLK => clock,
ADDR => addr(0 to 7),
DO => led);

end behavior;