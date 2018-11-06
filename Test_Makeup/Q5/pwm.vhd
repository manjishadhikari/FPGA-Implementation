----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2017 10:22:47 PM
-- Design Name: 
-- Module Name: pwm - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity question_5 is
  Port ( clock: in std_logic;
  data_in :in std_logic_vector(7 downto 0);
  count1 : out std_logic_vector(7 downto 0);
  data_out: out std_logic);
end question_5;

architecture Behavioral of question_5 is
signal count: std_logic_vector(7 downto 0):="00000000";
begin
process(clock)
begin
 if (clock'event and clock='1') then
    if count="11111111" then
        count<="00000000";
        data_out<='0';
     elsif count<data_in then
        count<=count+1;
        data_out<='1';
     else
        count<=count+1;
        data_out<='0';
     end if;
     end if;
  end process;
   count1<=count; 
end Behavioral;
