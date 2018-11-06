library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;
use std.textio.all;
use ieee.std_logic_unsigned.all;

entity playlistmemory is
    port (CLK  : in std_logic;
          pm_en   : in std_logic;
          pm_addr : in std_logic_vector(5 downto 0);
          pm_do   : out std_logic_vector(7 downto 0));
end playlistmemory;

architecture syn of playlistmemory is

    type  mem_type is array (0 to 63) of std_logic_vector (7 downto 0);
   
  impure function init_mem(mif_file_name : in string) return mem_type is
        file mif_file : text open read_mode is mif_file_name;
        variable mif_line : line;
        variable temp_bv : bit_vector(7 downto 0);
        variable temp_mem : mem_type;
    begin
        for i in mem_type'range loop
            readline(mif_file, mif_line);
            read(mif_line, temp_bv);
            temp_mem(i) := to_stdlogicvector(temp_bv);
        end loop;
        return temp_mem;
    end function;
    
    constant mem : mem_type := init_mem("H:\song1.txt");
   signal temp: std_logic_vector(7 downto 0):="00000000";
   
begin
    process (CLK)
    begin
        if CLK'event and CLK = '1' then
            if pm_en = '1' then
                temp <= mem(conv_integer(pm_addr)) ;
                pm_do<=temp(7 downto 0);
            end if;
        end if;
    end process;

end syn;
