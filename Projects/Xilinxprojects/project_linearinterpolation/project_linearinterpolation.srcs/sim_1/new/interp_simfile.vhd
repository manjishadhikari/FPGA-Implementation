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
   uut: entity work.firfilter_5tap PORT MAP (
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
    
         Datain <= to_signed(1,8); wait for clk_period*1;
        Datain <= to_signed(0,8); wait for clk_period*1;
                Datain <= to_signed(0,8); wait for clk_period*1;
                Datain <= to_signed(4,8); wait for clk_period*1;
                Datain <= to_signed(0,8); wait for clk_period*1;
                Datain <= to_signed(0,8); wait for clk_period*1;
                Datain <= to_signed(7,8); wait for clk_period*1;
                   Datain <= to_signed(0,8); wait for clk_period*1;
                      Datain <= to_signed(0,8); wait for clk_period*1;
                         Datain <= to_signed(10,8); wait for clk_period*1;
                            Datain <= to_signed(0,8); wait for clk_period*1;
                               Datain <= to_signed(0,8); wait for clk_period*1;
                                Datain <= to_signed(13,8); wait for clk_period*1;
                                 Datain <= to_signed(0,8); wait for clk_period*1;
                                  Datain <= to_signed(0,8); wait for clk_period*1;
                
              
      wait for 1 us;
        
      wait;
   end process;

END;