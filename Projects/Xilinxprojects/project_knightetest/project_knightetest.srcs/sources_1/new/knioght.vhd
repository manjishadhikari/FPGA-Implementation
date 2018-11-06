library ieee;
use ieee.std_logic_1164.all; use ieee.std_logic_unsigned.all;
entity knight_rider is port (clock : in std_logic; enable : in std_logic; switch : in std_logic_vector(15 downto 0); led : out std_logic_vector(15 downto 0); tx : out std_logic); end knight_rider;
architecture behavior of knight_rider is
component counter
port (clock : in std_logic; enable : in std_logic; limit : in std_logic_vector(23 downto 0); count : out std_logic_vector(23 downto 0); wrap : out std_logic); end component;
component rom
port (clock : in std_logic; addr : in std_logic_vector(4 downto 0); data : out std_logic_vector(15 downto 0)); end component;
component uart_tx port (clock : in std_logic; reset : in std_logic; data : in std_logic_vector(7 downto 0); send : in std_logic; tx : out std_logic; busy : out std_logic); end component;
signal step : std_logic; signal send : std_logic; signal addr : std_logic_vector(23 downto 0); signal limit : std_logic_vector(23 downto 0);
begin
with switch(3 downto 0) select
limit <= "0000" & "1101" & "0010" & "0111" & "0111" & "0011" when "0001", --quarter second
"0001" & "1010" & "0100" & "1110" & "1110" & "1000" when "0011", --half second
"0011" & "0100" & "1001" & "1101" & "1101" & "0010" when "0101", --one second
"0110" & "1001" & "0011" & "1011" & "1010" & "0110" when "0111", --two seconds
"1001" & "1101" & "1101" & "1001" & "0111" & "1010" when "1001", --three seconds
"1101" & "0010" & "0111" & "0111" & "0100" & "1110" when "1011", --four seconds
"0000" & "0000" & "0000" & "0000" & "0000" & "0000" when others;
uart_stat : uart_tx port map (clock => clock,
reset => '0',
data => "0011" & "0011",
send => send,
tx => tx);
--busy => busy);
rate_counter : counter port map (clock => clock,
enable => switch(0),
--enable => '1',
limit => limit,
--limit => switch & "0000" & "0000",
--count => count,
wrap => step);
addr_counter : counter port map (clock => clock,
enable => step,
limit => "0000" & "0000" & "0000" & "0000" & "0001" & "1101",
count => addr,
wrap => send);
--wrap => wrap);
led_rom : rom port map (clock => clock,
addr => addr(4 downto 0),
data => led);
end behavior;