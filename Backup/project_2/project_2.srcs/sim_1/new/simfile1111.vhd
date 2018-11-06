library ieee;
use ieee.std_logic_1164.all;

entity tb_awg is
end tb_awg;

architecture tb of tb_awg is

   component awg is
    Port ( clk1 : in STD_LOGIC;
           reset1 : in STD_LOGIC;
            play: in STD_LOGIC;
            volcontrol: in STD_LOGIC_VECTOR(3 downto 0);
           led : out STD_LOGIC_VECTOR(15 downto 0);
           data_out: out STD_LOGIC_VECTOR(11 downto 0);
           wrap_out: out std_logic;
            wrap_addr:out std_logic;
                     busy: out std_logic
           );
end component;

    signal clk1       : std_logic;
    signal reset1     : std_logic;
    signal play      : std_logic;
    signal volcontrol : std_logic_vector (3 downto 0);
    signal led        : std_logic_vector (15 downto 0);
  signal data_out: STD_LOGIC_VECTOR(11 downto 0);
  signal wrap_out: std_logic;
    constant TbPeriod : time := 10 ns;
   signal wrap_addr: std_logic;
    signal busy: std_logic;
    
    
     -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : awg
    port map (clk1       => clk1,
              reset1     => reset1,
             wrap_out=> wrap_out,
              play        => play,
              volcontrol => volcontrol,
                data_out=>data_out,
                wrap_addr=>wrap_addr,
                busy=>busy,
              led        => led);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk1 is really your main clock signal
    clk1 <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
         reset1 <= '0';
     
        play <= '1';
        volcontrol <= "0000";
    wait for 30 ns;
    volcontrol<="0001";
        -- Reset generation
        -- EDIT: Check that reset1 is really your reset signal
       
       
        wait for 100000 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;