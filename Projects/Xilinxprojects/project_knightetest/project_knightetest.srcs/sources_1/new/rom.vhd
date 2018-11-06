library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity rom is
port (clock : in std_logic;
addr : in std_logic_vector(4 downto 0);
data : out std_logic_vector(15 downto 0));
end rom;
architecture behavior of rom is
type mem_type is array (29 downto 0) of std_logic_vector (15 downto 0);
signal mem: mem_type := ( X"0002", X"0004", X"0008",
X"0010", X"0020", X"0040", X"0080",
X"0100", X"0200", X"0400", X"0800",
X"1000", X"2000", X"4000", X"8000",
X"4000", X"2000", X"1000",
X"0800", X"0400", X"0200", X"0100",
X"0080", X"0040", X"0020", X"0010",
X"0008", X"0004", X"0002", X"0001");
begin
process (clock)
begin
if (clock'event and clock = '1') then
data <= mem(conv_integer(addr)) ;
end if;
end process;
end behavior;