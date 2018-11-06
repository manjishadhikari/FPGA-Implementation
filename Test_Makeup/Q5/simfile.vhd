library ieee;
use ieee.std_logic_1164.all;

entity tb_question_5 is
end tb_question_5;

architecture tb of tb_question_5 is

    component question_5
        port (clock    : in std_logic;
        data_in :in std_logic_vector(7 downto 0);
        count1: out std_logic_vector(7 downto 0);
              data_out : out std_logic);
    end component;

    signal clock    : std_logic;
    signal data_out : std_logic;
    signal data_in:  std_logic_vector(7 downto 0);
    signal count1:  std_logic_vector(7 downto 0);
    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : question_5
    port map (clock    => clock,
              data_in=>data_in,
              count1=>count1,
              data_out => data_out);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clock is really your main clock signal
    clock <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed

        -- Reset generation
        --  EDIT: Replace YOURRESETSIGNAL below by the name of your reset as I haven't guessed it
     
       data_in<="00001111";
       wait for 60 ns;
       data_in<="11110000";
       wait for 100 ns;
       data_in<="11111110";
       wait for 50 ns;
       data_in<="11110001" ;
       wait for 100 ns;
       data_in<="11111111";
        -- EDIT Add stimuli here
        wait for 100000 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;