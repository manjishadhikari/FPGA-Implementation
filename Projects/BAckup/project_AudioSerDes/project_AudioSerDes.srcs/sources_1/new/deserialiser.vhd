----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2017 08:28:55 PM
-- Design Name: 
-- Module Name: deserializer - Behavioral
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
use IEEE.Numeric_Std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity deserializer is
    Port ( clock : in STD_LOGIC;
           mic_in : in STD_LOGIC;
           mic_clk: out std_logic;
           sdata: out STD_LOGIC_VECTOR(15 downto 0);
           par_out: out STD_LOGIC;
           ser_out: out STD_LOGIC;
           data_16 : out STD_LOGIC_VECTOR(15 downto 0));
end deserializer;

architecture Behavioral of deserializer is
component clockgenerator is
        port(clock: in std_logic;
        par_en: out std_logic;
        ser_en: out std_logic;
        mic_clk: out std_logic
        );
        
end component;
--component shiftregstr is
--        port( clock: in std_logic;
--      --  reset: in std_logic;
--        ser_en: in std_logic;
--        ser_data: in std_logic;
--        shift_out: out std_logic_vector(15 downto 0));
--end component;


--component latch16b is
--    Port ( clock : in STD_LOGIC;
--           par_en : in STD_LOGIC;
--           data_in : in STD_LOGIC_vector(15 downto 0);
--           data_out : out STD_LOGIC_vector(15 downto 0));
--end component;

signal par_ensig: STD_LOGIC;
signal ser_ensig: STD_LOGIC;
signal shiftreg: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal temp:STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
begin
clockgen: clockgenerator port map (clock=>clock,par_en=>par_ensig,ser_en=>ser_ensig,mic_clk=>mic_clk);

process(clock)
begin
 if rising_edge(clock) then
    
    if ser_ensig='1' then
           -- shiftreg<='0' & shiftreg(15 downto 1);
              shiftreg<=shiftreg(14 downto 0) & mic_in;

    end if;
    if par_ensig='1' then
              temp<=shiftreg;
        end if;
end if;
end process;
data_16<=temp;



--shiftreg: shiftregstr port map (clock=>clock,ser_en=>ser_ensig,ser_data=>mic_in,shift_out=>shiftdata);
--latch: latch16b port map(clock=>clock,par_en=>par_ensig,data_in=>shiftdata,data_out=>data_16);
sdata<=shiftreg;
par_out<=par_ensig;
ser_out<=ser_ensig;


end Behavioral;
