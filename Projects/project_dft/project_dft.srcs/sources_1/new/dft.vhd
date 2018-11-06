

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity dft is
    Port ( clock: in std_logic;
            data_r : in signed (15 downto 0);
         --  data_i : in signed (15 downto 0);
           twiddle_r : in signed (15 downto 0);
            twiddle_i : in signed (15 downto 0);
        factor: in signed(15 downto 0);
         fft_i : out signed(15 downto 0);
           fft_r : out signed(15 downto 0));
           
end dft;

architecture Behavioral of dft is
--signal temp_r: signed(15 downto 0):=(others=>'0');
--signal temp_i: signed(15 downto 0):=(others=>'0');
signal sum_r: signed(15 downto 0):=(others=>'0');
signal sum_i: signed(15 downto 0):=(others=>'0');

--signal mult_r: signed(15 downto 0):=(others=>'0');
--signal mult_i: signed(15 downto 0):=(others=>'0');
signal temp_mult_r: signed(31 downto 0):=(others=>'0');
signal temp_mult_i: signed(31 downto 0):=(others=>'0');
--signal div_r:signed(31 downto 0):=(others=>'0');
--signal div_i:signed(31 downto 0):=(others=>'0');

signal i: unsigned(6 downto 0):=(others=>'0');
begin
      
     
process(clock)
begin
    if rising_edge(clock) then
         --  temp_r<=(sum_r);
          --  temp_i<=(sum_i);
            temp_mult_r<=((((twiddle_r)*sum_r)-((twiddle_i)*sum_i)))/factor;
             temp_mult_i<=((((twiddle_r)*sum_i)+((twiddle_i)*sum_r)))/factor;
 --t_temp_mult_r<=((((twiddle_r)*sum_r)-((twiddle_i)*sum_i)));
        --       t_temp_mult_i<=((((twiddle_r)*sum_i)+((twiddle_i)*sum_r)));
           sum_r<=temp_mult_r(15 downto 0)+(data_r);
           sum_i<=temp_mult_i(15 downto 0) ; --+(data_i);
       
         i<=i+1;
        if i="1000000" then
            i<="0000000";
            fft_r<=(sum_r(15 downto 0));
            fft_i<=(sum_i(15 downto 0));
         --   temp_r<=(others=>'0');
          --  temp_i<=(others=>'0');
            temp_mult_r<=(others=>'0');
             temp_mult_i<=(others=>'0');
         
                           --  sum_r<=(others=>'0');
                          --   sum_i<=(others=>'0');
      
        end if;
    end if;
 end process;    

end Behavioral;
