----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2017 11:46:46 AM
-- Design Name: 
-- Module Name: dft - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dft is
    Port ( clock: in std_logic;
            datain : in STD_LOGIC_VECTOR (31 downto 0);
           twiddle : in STD_LOGIC_VECTOR (31 downto 0);
          -- sumout1:out std_logic_vector(31 downto 0);
          -- multout1:out std_logic_vector(31 downto 0);
        --   temp10: out std_logic_vector(31 downto 0);
           dataout : out STD_LOGIC_VECTOR (31 downto 0));
end dft;

architecture Behavioral of dft is
signal temp1: signed(31 downto 0):=(others=>'0');
signal sumout: signed(31 downto 0):=(others=>'0');
signal multout: signed(31 downto 0):=(others=>'0');
signal temp2: signed(63 downto 0):=(others=>'0');
signal i: unsigned(7 downto 0):=(others=>'0');
begin
process(clock)
begin
    if rising_edge(clock) then
        sumout<=signed(datain)+(multout);
       -- sumout1<=sumout;
        temp1<=sumout;
      --  temp10<=temp1;
        temp2<=(signed(twiddle)*(sumout));
       multout<=(temp2(31 downto 0));
   --    multout1<=multout;
        i<=i+1;
        if i="10000000" then
            i<="00000000";
            dataout<=std_logic_vector(sumout);
            temp1<=(others=>'0');
            multout<=(others=>'0');
           sumout<=(others=>'0');
        end if;
    end if;
 end process;    

end Behavioral;
