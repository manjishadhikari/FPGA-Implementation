----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2017 10:07:21 PM
-- Design Name: 
-- Module Name: audioserzderz - Behavioral
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

entity audioloop is
    Port ( clock : in STD_LOGIC;
           mic_in : in STD_LOGIC;
            mic_clk: out std_logic;
           mic_sel: out std_logic;
           spk_out : out STD_LOGIC;
           data_16 : out STD_LOGIC_VECTOR (15 downto 0);
           sershift: out std_logic_vector(15 downto 0);
           ser_ena : out STD_LOGIC;
           par_ena : out STD_LOGIC);
end audioloop;

architecture Behavioral of audioloop is
component deserializer is
    Port ( clock : in STD_LOGIC;
           mic_in : in STD_LOGIC;
          mic_clk: out std_logic;
          -- sdata: out STD_LOGIC_VECTOR(15 downto 0);
           par_out: out STD_LOGIC;
           ser_out: out STD_LOGIC;
           data_16 : out STD_LOGIC_VECTOR(15 downto 0));
end component;

component serializer is
    Port ( clock : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
            sershiftregout: out std_logic_vector(15 downto 0);
           data_out : out STD_LOGIC);
end component;

signal temp: std_logic_vector(15 downto 0);
begin
deserializer1: deserializer port map(clock=>clock,mic_in=>mic_in,par_out=>par_ena,ser_out=>ser_ena,data_16=>temp,mic_clk=>mic_clk);
serializer1: serializer port map(clock=>clock,data_in=>temp,data_out=>spk_out,sershiftregout=>sershift);
mic_sel<='0';
data_16<=temp;
end Behavioral;
