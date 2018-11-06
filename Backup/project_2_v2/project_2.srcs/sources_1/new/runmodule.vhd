----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2017 05:13:06 PM
-- Design Name: 
-- Module Name: runmodule - Behavioral
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

entity runmodule is
          Port ( 
                  clk: in std_logic;
                  play: in std_logic;
                  done: in std_logic;
                  run: out std_logic );
end runmodule;

architecture Behavioral of runmodule is

begin
process(clk)
begin
     if rising_edge(clk) then
        if play='1' then
            if done='1' then
                run<='0';
            else
                run<='1';
            end if;
         else
            run<='0';
         end if;
    end if;
   end process;       
       
  

end Behavioral;
