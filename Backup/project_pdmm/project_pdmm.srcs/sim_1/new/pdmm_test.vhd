library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pdm_tb is

end pdm_tb;

architecture Behavioral1 of pdm_tb is

component pdm
    Port (  clk : in std_logic;
   reset: in std_logic;
   datain : in std_logic_vector (9 downto 0);
   dataout : out std_logic;
   error : out std_logic_vector (9 downto 0) := "0000000000");

end component;

---inputs
            signal clk :  std_logic ;
            signal reset :  std_logic :='0';
            signal datain : std_logic_vector (9 downto 0) := "1111100000" ;
            
---outputs
           signal  dataout :  std_logic;
           signal error :std_logic_vector (9 downto 0);


-- clock period 
            constant clk_period : time := 10 ns;



begin


-- instantiate UUT
                UUT : pdm PORT MAP (
                         clk => clk,
                         reset => reset,
                         datain => datain,
                         dataout => dataout,
                         error => error
                         ); 
-- clock process
            clk_process : process
                               begin
                                   clk <= '0';
                                   wait for clk_period/2;
                                   clk <= '1';
                                   wait for clk_period/2;
                               end process;
                                 
                         
-- stimulus process
             stim_proc : process
                                 begin
                                                --switch <= "000000";
                                                reset <= '1';
                                                wait for 200ns;
                                                reset <= '0'; 
                                                datain<="0000000000";
                                                 wait for 50 ns;
                                                 datain<="1111111111";  
                                                wait;
                                       
                                 end process; 


end;