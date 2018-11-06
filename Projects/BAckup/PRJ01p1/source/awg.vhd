

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity awg is
    Port ( clk1 : in STD_LOGIC;
           reset1 : in STD_LOGIC;
            play: in STD_LOGIC;
            volcontrol: in STD_LOGIC_VECTOR(3 downto 0);
           pdmout : out STD_LOGIC;
           busy: out std_logic
           );
end awg;

architecture Behavioral of awg is
component runmodule is
          Port ( 
                  clk: in std_logic;
                  play: in std_logic;
                  done: in std_logic;
                  run: out std_logic );
end component;

component ratecounter_source is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable: in STD_LOGIC;
           wrap: out STD_LOGIC
           --count : out STD_LOGIC_VECTOR(23 downto 0)
         );
end component;

component addrcounter_source is
    Port ( clk : in STD_LOGIC;
        
          enable: in STD_LOGIC;
          wrap:out STD_LOGIC;
          count : out STD_LOGIC_VECTOR(13 downto 0)
        );
end component;

component memory_01 is
    port (CLK  : in std_logic;
         
          EN   : in std_logic;
          ADDR : in std_logic_vector(13 downto 0);
   
          DO   : out std_logic_vector(9 downto 0));
end component;


component volume is
 Port ( clk: in std_logic;
         reset: in std_logic;
          volcontrol: in std_logic_vector(3 downto 0);
          data_in : in std_logic_vector(9 downto 0);
          data_out: out std_logic_vector(9 downto 0)  );
end component;


component pdm is
  port (
   clk : in std_logic;
   reset: in std_logic;
   datain : in std_logic_vector (9 downto 0);
   dataout : out std_logic
  --error : out std_logic_vector (9 downto 0) 
  );
end component;


signal addr_en: STD_LOGIC;
signal addr_last: STD_LOGIC;
signal addr:  std_logic_vector(13 downto 0);
signal data:  std_logic_vector(9 downto 0);
signal vol_out: std_logic_vector(9 downto 0);
signal ratecounter_en: std_logic;

begin

runmodule1: runmodule port map(clk=>clk1,play=>play,done=>addr_last,run=>ratecounter_en);
ratecounter: ratecounter_source port map(clk=>clk1,reset=>reset1,enable=>ratecounter_en,wrap=>addr_en); 
addrcounter: addrcounter_source port map(clk=>clk1,enable=>addr_en,wrap=>addr_last,count=>addr);
mem: memory_01 port map(CLK=>clk1,EN=>'1',ADDR=>addr,DO=>data);
volumecontrol: volume port map(clk=>clk1,reset=>reset1,volcontrol=>volcontrol,data_in=>data,data_out=>vol_out);
pdm1: pdm port map(clk=>clk1,reset=>reset1,datain=>vol_out,dataout=>pdmout);

busy<=ratecounter_en;

end Behavioral;
