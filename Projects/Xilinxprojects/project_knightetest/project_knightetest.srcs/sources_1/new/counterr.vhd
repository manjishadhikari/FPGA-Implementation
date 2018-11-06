library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity counter is
port (clock : in std_logic;
enable : in std_logic;
limit : in std_logic_vector(23 downto 0);
count : out std_logic_vector(23 downto 0);
wrap : out std_logic);
end counter;
architecture behavior of counter is
signal count_temp : std_logic_vector(23 downto 0);
begin
count <= count_temp;
process (clock)
begin
if (clock'event and clock = '1') then
if (enable = '1') then
if (count_temp = limit) then
count_temp <= "0000" & "0000" & "0000" & "0000" & "0000" & "0000";
wrap <= '1';
else --not limit
count_temp <= count_temp + '1';
wrap <= '0';
end if; --limit
else --not enable
count_temp <= count_temp;
wrap <= '0';
end if; --enable
end if; --rising edge
end process;
end behavior;