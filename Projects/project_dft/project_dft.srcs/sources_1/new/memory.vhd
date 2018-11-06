library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
Library UNISIM;
use UNISIM.vcomponents.all;

entity rom is
port (clock: in std_logic;
addr: in std_logic_vector(7 downto 0);
write_en: in std_logic;
read_en: in std_logic;
data_in: in std_logic_vector(31 downto 0);
data_out: out std_logic_vector(31 downto 0));

end rom;


architecture behavior of rom is
type mem_type is array (256 downto 0) of std_logic_vector (31 downto 0);
signal mem:mem_type;
begin
process (clock)
begin
if (clock'event and clock = '1') then
if (write_en<='1') then
    mem(conv_integer(addr))<=data_in;
end if;
if (read_en='1') then
    data_out <= mem(conv_integer(addr)) ;
end if;
end if;
end process;
end behavior;