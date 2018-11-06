library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity knightrider_tb is
end knightrider_tb;

architecture bench of knightrider_tb is

  component knightrider is
      Port ( clk1 : in STD_LOGIC;
             reset1 : in STD_LOGIC;
             step1: in std_logic;
                        step2: in std_logic;
                        step3: in std_logic;
                        step4: in std_logic;
             ce : in STD_LOGIC;
             led : out STD_LOGIC_VECTOR(15 downto 0)
             );
  end component;

  signal clk1: STD_LOGIC;
  signal reset1: STD_LOGIC;
  signal ce: STD_LOGIC;
  signal step1:  std_logic;
            signal step2: std_logic;
             signal step3: std_logic;
             signal step4: std_logic;
  signal led: STD_LOGIC_VECTOR(15 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: knightrider port map ( clk1    => clk1,
                                  reset1  => reset1,
                                 step1=>step1,
                                 step2=>step2,
                                 ste3=>step3,
                                 step4=>step4,
                                  
                                  ce  => ce,
                                  led  => led );

  stimulus: process
  begin
    
--    reset1<='0';
--     ce<='1';
--    step<='1'
   
--    wait for 100 ns;
--    step2<='1';
--    wait for 100 ns;
--    step3<='1';
--    -- Put initialisation code here
--wait for 300 ns;

--    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk1 <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;