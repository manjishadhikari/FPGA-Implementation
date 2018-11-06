library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
use std.textio.all;

entity memory_01 is
    generic (
        ADDR_WIDTH       : integer := 8;        
        DATA_WIDTH       : integer := 8
    );
    port (
        CLK    : in  std_logic;
        ADDR    : in  std_logic_vector(ADDR_WIDTH-1 downto 0);          
        DO    : out signed(DATA_WIDTH-1 downto 0)
    );
end memory_01;

architecture rtl of memory_01 is

constant MEM_DEPTH : integer := 2**ADDR_WIDTH;
type mem_type is array (0 to MEM_DEPTH-1) of signed(DATA_WIDTH-1 downto 0);

impure function init_mem(mif_file_name : in string) return mem_type is
    file mif_file : text open read_mode is mif_file_name;
    variable mif_line : line;
    variable temp_bv : bit_vector(DATA_WIDTH-1 downto 0);
    variable temp_mem : mem_type;
begin
    for i in mem_type'range loop
        readline(mif_file, mif_line);
        read(mif_line, temp_bv);
        temp_mem(i) := signed(to_stdlogicvector(temp_bv));
    end loop;
    return temp_mem;
end function;

constant mem : mem_type := init_mem("mem_init_vhd.mif");

begin

process (CLK)
begin
    if rising_edge(CLK) then
	     DO <= mem(to_integer(unsigned(ADDR)));
    end if;
end process;

end rtl;
