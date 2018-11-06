

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity dds is
    Port ( clk1 : in STD_LOGIC;
           reset1 : in STD_LOGIC;
        
            volcontrol: in STD_LOGIC_VECTOR(3 downto 0);
            tone: in STD_LOGIC_VECTOR(3 downto 0);
           pdmout : out STD_LOGIC;
          -- check: out std_logic;
--           data_out: out STD_LOGIC_VECTOR(9 downto 0);
--           Vol_out1: out STD_LOGIC_VECTOR(9 downto 0);
--           Error: out STD_LOGIC_VECTOR(9 downto 0);
--           wrap_out: out std_logic;
--           wrap_addr:out std_logic;
           busy: out std_logic
           );
end dds;

architecture Behavioral of dds is

component playlistcounter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable_pl: in STD_LOGIC;   
            wrap_pc: out std_logic  );   
          -- count : out STD_LOGIC_VECTOR(11 downto 0));
          
end component;

component playlistaddrcounter is
    Port ( clk : in STD_LOGIC;
          
           pladdr_enable: in STD_LOGIC;
          -- wrap:out STD_LOGIC;
           count : out STD_LOGIC_VECTOR(5 downto 0)
         );
end component;

component playlistmemory is
    port (CLK  : in std_logic;
          pm_en   : in std_logic;
          pm_addr : in std_logic_vector(5 downto 0);
          pm_do   : out std_logic_vector(7 downto 0));
end component;

component decoder is
        port( clk: in std_logic;
        tone:in std_logic_vector(3 downto 0);
        limit: out std_logic_vector(7 downto 0);
        run: out std_logic      
        );
end component;

component ratecounter_source is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable: in STD_LOGIC;
           limit_en: in std_logic_vector(7 downto 0);
           wrap: out STD_LOGIC
           --count : out STD_LOGIC_VECTOR(23 downto 0)
         );
end component;

component addrcounter_source is
    Port ( clk : in STD_LOGIC;
        
          addr_enable: in STD_LOGIC;
        --  wrap:out STD_LOGIC;
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

signal limit1: std_logic_vector(7 downto 0);
signal addr_en: STD_LOGIC;
signal addr_last: STD_LOGIC;
signal addr:  std_logic_vector(13 downto 0);
signal data:  std_logic_vector(9 downto 0);
signal vol_out: std_logic_vector(9 downto 0);
signal ratecounter_en: std_logic;

begin

decoder1: decoder port map(clk=>clk1,tone=>tone,limit=>limit1,run=>ratecounter_en);
ratecounter: ratecounter_source port map(clk=>clk1,reset=>reset1,enable=>ratecounter_en,wrap=>addr_en,limit_en=>limit1); 
addrcounter: addrcounter_source port map(clk=>clk1,addr_enable=>addr_en,count=>addr);
mem: memory_01 port map(CLK=>clk1,EN=>'1',ADDR=>addr,DO=>data);
volumecontrol: volume port map(clk=>clk1,reset=>reset1,volcontrol=>volcontrol,data_in=>data,data_out=>vol_out);
pdm1: pdm port map(clk=>clk1,reset=>reset1,datain=>vol_out,dataout=>pdmout);

busy<=ratecounter_en;
--check<=ratecounter_en;
--wrap_out<=addr_en;
--wrap_addr<=addr_last;
--data_out<=data;
--Vol_out1<=vol_out;
end Behavioral;
