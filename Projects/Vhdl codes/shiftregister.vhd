----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2017 05:57:56 PM
-- Design Name: 
-- Module Name: shiftreg - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shiftregstr is
        port( clock: in std_logic;
      --  reset: in std_logic;
        ser_en: in std_logic;
        ser_data: in std_logic;
        shift_out: out std_logic_vector(15 downto 0));
end shiftregstr;

architecture Behavioral of shiftregstr is

signal temp: std_logic_vector(15 downto 0):=(others=>'0');

begin
process(clock)
begin
--if reset='0' then
    if rising_edge(clock) then
        if  ser_en='1' then
            temp<=temp(14 downto 0) & ser_data;
        else
            temp<=temp;
         end if;
    end if;
-- else  temp<=(others=>'0');
--end if;
end process;
shift_out<=temp;
end Behavioral;
