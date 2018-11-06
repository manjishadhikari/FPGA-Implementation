library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
use ieee.math_real.ALL;
use ieee.std_logic_misc.ALL;
use std.textio.all;

--
-- Declarations used to define the array of ROM data.
entity rams_sp_rom is
port(
clk : in std_logic;
we : in std_logic;
addr : in std_logic_vector(2 downto 0);
din : in std_logic_vector(2 downto 0);
dout : out std_logic_vector(31 downto 0)
);
end rams_sp_rom;

architecture syn of rams_sp_rom is

type rom_array is array(7 downto 0) of std_logic_vector(31 downto 0);
 
impure function rom_init(filename : string) return rom_array is
  file rom_file : text open read_mode is filename;
  variable rom_line : line;
  variable rom_value : bit_vector(31 downto 0);
  variable temp : rom_array;
begin
  for rom_index in 0 to 2**7 loop
    readline(rom_file, rom_line);
    read(rom_line, rom_value);
    temp(rom_index) := to_stdlogicvector(rom_value);
  end loop;
  return temp;
end function;
 
constant rom : rom_array := rom_init(filename => "ramfile.txt");

begin
process(clk)
begin
if clk'event and clk = '1' then
if we = '1' then
rom(conv_integer(addr)) <= to_bitvector(din);
end if;
dout <= to_stdlogicvector(rom(conv_integer(addr)));
end if;
end process;
end syn;