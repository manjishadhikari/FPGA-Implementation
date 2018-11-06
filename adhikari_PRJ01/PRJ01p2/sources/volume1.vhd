----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2017 10:16:47 PM
-- Design Name: 
-- Module Name: volume - Behavioral
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

entity volume is
 Port ( clk: in std_logic;
       reset: in std_logic;
          volcontrol: in std_logic_vector(3 downto 0);
          data_in : in std_logic_vector(9 downto 0);
          data_out: out std_logic_vector(9 downto 0)  );
end volume;

architecture Behavioral of volume is
signal temp: std_logic_vector(13 downto 0):="00000000000000";
begin
process(clk,reset)
begin
       if reset='0' then
              if rising_edge(clk) then
                    temp<=std_logic_vector((unsigned(volcontrol)*unsigned(data_in)));
                    data_out<=temp(13 downto 4);
              end if;
        else
                data_out<="0000000000";
        end if;

end process;

end Behavioral;
