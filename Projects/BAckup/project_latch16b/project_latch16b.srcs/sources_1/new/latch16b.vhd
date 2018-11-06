----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2017 06:16:13 PM
-- Design Name: 
-- Module Name: latch16b - Behavioral
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

entity latch16b is
    Port ( clock : in STD_LOGIC;
           par_en : in STD_LOGIC;
           data_in : in STD_LOGIC_vector(15 downto 0);
           data_out : out STD_LOGIC_vector(15 downto 0));
end latch16b;

architecture Behavioral of latch16b is

begin
process(clock,par_en)
begin
    if rising_edge(clock) then
         if par_en='1' then
                data_out<=data_in;
           end if;
     end if;
end process;
end Behavioral;
