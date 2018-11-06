----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2017 04:35:54 PM
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
    port(clk: in std_logic;
    play: in std_logic;
    done : in std_logic;
    run: out std_logic
    );
end runmodule;

architecture Behavioral of runmodule is
signal temp: std_logic;
begin
process(clk)
begin
if rising_edge(clk) then
    if play='1' then 
        temp<='1';
    end if;
    if temp='1' then
        if done='1' then
            run<='0';
            temp<='0';
        else 
            run<='1';
      end if;
  end if;
  end if;
   end process;      
     
    

end Behavioral;
