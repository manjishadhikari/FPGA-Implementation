library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;
use std.textio.all;
use ieee.std_logic_unsigned.all;

entity memory_01 is
    port (CLK  : in std_logic;
          EN   : in std_logic;
          ADDR : in std_logic_vector(13 downto 0);
          DO   : out std_logic_vector(9 downto 0));
end memory_01;

architecture syn of memory_01 is

    type  mem_type is array (0 to 16384) of std_logic_vector (11 downto 0);
   
  impure function init_mem(mif_file_name : in string) return mem_type is
        file mif_file : text open read_mode is mif_file_name;
        variable mif_line : line;
        variable temp_bv : bit_vector(11 downto 0);
        variable temp_mem : mem_type;
    begin
        for i in mem_type'range loop
            readline(mif_file, mif_line);
            read(mif_line, temp_bv);
            temp_mem(i) := to_stdlogicvector(temp_bv);
        end loop;
        return temp_mem;
    end function;
    
    constant mem : mem_type := init_mem("waveform.txt");
   signal temp: std_logic_vector(11 downto 0):="000000000000";
   
begin
    process (CLK)
    begin
        if CLK'event and CLK = '1' then
            if EN = '1' then
                temp <= mem(conv_integer(ADDR)) ;
                DO<=temp(9 downto 0);
            end if;
        end if;
    end process;

end syn;
