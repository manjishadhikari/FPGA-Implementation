----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2017 06:38:42 PM
-- Design Name: 
-- Module Name: complex_mult - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity complex_mult is
    Port ( a: in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           c : out STD_LOGIC_VECTOR (63 downto 0);
           clock : in STD_LOGIC);
end complex_mult;

architecture Behavioral of complex_mult is
signal temp1: std_logic_vector(31 downto 0) :=X"00000000";
signal temp2: std_logic_vector(31 downto 0) :=X"00000000";
begin
process(clock)
begin
       
      if  rising_edge(clock) then
        temp1<=std_logic_vector(signed(a(31 downto 16))*signed(b(31 downto 16))-signed(a(15 downto 0))*signed(b(15 downto 0)));
         temp2<=std_logic_vector(signed(a(31 downto 16))*signed(b(15 downto 0))+signed(a(15 downto 0))*signed(b(31 downto 16)));
     
      end if;
   end process;       
 c(63 downto 32)<=temp1(31 downto 0);
  c(31 downto 0)<=temp2(31 downto 0);

end Behavioral;
