LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb IS
END tb;

ARCHITECTURE behavior OF tb IS 

   signal Clk : std_logic := '0';
   signal Datain : signed(7 downto 0) := (others => '0');
   signal Filterout : signed(15 downto 0) := (others => '0');
   constant Clk_period : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
   uut: entity work.firfilter_4tap PORT MAP (
          Clk => Clk,
          Datain => Datain,
          Filterout => Filterout
        );

   -- Clock process definitions
   Clk_process :process
   begin
        Clk <= '0';
        wait for Clk_period/2;
        Clk <= '1';
        wait for Clk_period/2;
   end process;
    
   -- Stimulus process
   stim_proc: process
   begin        
      wait for Clk_period*2;
        Datain <= to_signed(2,8); 
      wait for 1 us;
        
      wait;
   end process;

END;