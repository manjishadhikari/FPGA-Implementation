----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2017 09:50:08 PM
-- Design Name: 
-- Module Name: serializer - Behavioral
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

entity serializer is
    Port ( clock : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
            sershiftregout: out std_logic_vector(15 downto 0);
           data_out : out STD_LOGIC);
end serializer;

architecture Behavioral of serializer is
component clockgenerator is
        port(clock: in std_logic;
        par_en: out std_logic;
        ser_en: out std_logic
       
        );       
end component;
signal par_ensig: std_logic;
signal ser_ensig: std_logic;
--signal reg: std_logic_vector(15 downto 0);
signal shiftreg: std_logic_vector(15 downto 0):=(others=>'0');
--signal temp_dataout: std_logic:='0';
begin
clockgen2: clockgenerator port map(clock=>clock,par_en=>par_ensig,ser_en=>ser_ensig);
process(clock)
begin
 if rising_edge(clock) then
   
    if ser_ensig='1' then
            data_out<=shiftreg(0);
            shiftreg<=shiftreg(14 downto 0)& shiftreg(15);
          
             if par_ensig='1' then
                      shiftreg<=data_in;
               end if;
    end if;
   
end if;
end process;
sershiftregout<=shiftreg;


end Behavioral;
