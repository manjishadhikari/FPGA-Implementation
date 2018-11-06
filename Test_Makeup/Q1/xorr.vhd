----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2017 07:21:05 PM
-- Design Name: 
-- Module Name: xorr - Behavioral
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
library unisim;
use unisim.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lut_xor is
  Port (
  in1,in2: in std_logic;
     out1: out std_logic );

end lut_xor;

architecture Behavioral of lut_xor is
 component LUT2
        generic(INIT: bit_vector(3 downto 0):="0110");
        port (O: out std_logic;
        I0,I1: in std_logic);
 end component;
begin


  U2: LUT2 --generic map (INIT=>"0110");
    port map(O=>out1,I1=>in2,I0=>in1);
end Behavioral;
