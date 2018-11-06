----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2017 08:58:22 PM
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity decoder is
        port( clk: in std_logic;
        tone:in std_logic_vector(3 downto 0);
        limit: out std_logic_vector(7 downto 0);
        run: out std_logic      
        );
end decoder;

architecture Behavioral of decoder is

begin
process(clk)
begin
  if rising_edge(clk) then
          if tone="0000" then
              limit<=X"00";
          end if;
        if tone="0001" then
            limit<=X"2F";
        end if;
        if tone="0010" then
            limit<=X"2A";
         end if;
         if tone="0011" then
               limit<=X"25";
          end if;
         if tone="0100" then
                limit<=X"23";
           end if;
           if tone="0101" then
               limit<=X"1F";
             end if;
             if tone="0110" then
                  limit<=X"1C";
              end if;
                if tone="0111" then
                   limit<=X"19";
                  end if;
            if tone="1000" then
                     limit<=X"17";
              end if;
              if tone="1001" then
                 limit<=X"15";
             end if;    
             if tone="1010" then
                  limit<=X"13";
              end if; 
              if tone="1011" then
                  limit<=X"12";
              end if;
              if tone="1100" then
                    limit<=X"10";
               end if;
               if tone="1101" then
                      limit<=X"0E";
                  end if;
                  if tone="1110" then
                          limit<=X"0C";
                 end if;
                 if tone="1111" then
                        limit<=X"0B";
                 end if;
                 
               run<='1';
        end if;
        end process;


end Behavioral;
