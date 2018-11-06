

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity dft is
    Port ( clock: in std_logic;
            data_r : in signed (15 downto 0);
           data_i : in signed (15 downto 0);
         --  twiddle_r : in signed (15 downto 0);
        --    twiddle_i : in signed (15 downto 0);
       -- factor: in signed(15 downto 0);
         ffti1 : out signed(15 downto 0);
           fftr1 : out signed(15 downto 0);
           ffti2 : out signed(15 downto 0);
             fftr2 : out signed(15 downto 0);
             ffti3 : out signed(15 downto 0);
              fftr3 : out signed(15 downto 0);
            ffti4 : out signed(15 downto 0);
              fftr4 : out signed(15 downto 0);
                    ffti5 : out signed(15 downto 0);
                      fftr5 : out signed(15 downto 0)
           );
           
end dft;

architecture Behavioral of dft is
--signal temp_r: signed(15 downto 0):=(others=>'0');
--signal temp_i: signed(15 downto 0):=(others=>'0');

--Accumulators
signal acum_r1: signed(15 downto 0):=(others=>'0');
signal acum_i1: signed(15 downto 0):=(others=>'0');

signal acum_r2: signed(15 downto 0):=(others=>'0');
signal acum_i2: signed(15 downto 0):=(others=>'0');

signal acum_r3: signed(15 downto 0):=(others=>'0');
signal acum_i3: signed(15 downto 0):=(others=>'0');

signal acum_r4: signed(15 downto 0):=(others=>'0');
signal acum_i4: signed(15 downto 0):=(others=>'0');

signal acum_r5: signed(15 downto 0):=(others=>'0');
signal acum_i5: signed(15 downto 0):=(others=>'0');

--signal mult_r: signed(15 downto 0):=(others=>'0');
--signal mult_i: signed(15 downto 0):=(others=>'0');

--Multiply
signal temp_multr1: signed(31 downto 0):=(others=>'0');
signal temp_multi1: signed(31 downto 0):=(others=>'0');

signal temp_multr2: signed(31 downto 0):=(others=>'0');
signal temp_multi2: signed(31 downto 0):=(others=>'0');

signal temp_multr3: signed(31 downto 0):=(others=>'0');
signal temp_multi3: signed(31 downto 0):=(others=>'0');

signal temp_multr4: signed(31 downto 0):=(others=>'0');
signal temp_multi4: signed(31 downto 0):=(others=>'0');

signal temp_multr5: signed(31 downto 0):=(others=>'0');
signal temp_multi5: signed(31 downto 0):=(others=>'0');


--signal div_r:signed(31 downto 0):=(others=>'0');
--signal div_i:signed(31 downto 0):=(others=>'0');

signal twiddle1r: signed(15 downto 0):=X"0001";
signal twiddle1i: signed(15 downto 0):=X"0000";

signal twiddle2r: signed(15 downto 0):=X"000A";
signal twiddle2i: signed(15 downto 0):=X"FFFE";

signal twiddle3r: signed(15 downto 0):=X"000C";
signal twiddle3i: signed(15 downto 0):=X"FFFB";

signal twiddle4r: signed(15 downto 0):=X"000F";
signal twiddle4i: signed(15 downto 0):=X"FFF6";

signal twiddle5r: signed(15 downto 0):=X"0007";
signal twiddle5i: signed(15 downto 0):=X"FFF9";



--Factors
signal factor1: signed(15 downto 0):=X"0001";
signal factor2: signed(15 downto 0):=X"000A";
signal factor3: signed(15 downto 0):=X"000D";
signal factor4: signed(15 downto 0):=X"0012";
signal factor5: signed(15 downto 0):=X"000A";

signal i: unsigned(6 downto 0):=(others=>'0');
begin
      
     
process(clock)
begin
    if rising_edge(clock) then
         
            temp_multr1<=((((twiddle1r)*acum_r1)-((twiddle1i)*acum_i1)))/factor1;
             temp_multi1<=((((twiddle1r)*acum_i1)+((twiddle1i)*acum_r1)))/factor1;

  temp_multr2<=((((twiddle2r)*acum_r2)-((twiddle1i)*acum_i2)))/factor2;
             temp_multi2<=((((twiddle2r)*acum_i2)+((twiddle2i)*acum_r2)))/factor2;
             
    temp_multr3<=((((twiddle3r)*acum_r3)-((twiddle3i)*acum_i3)))/factor3;
                          temp_multi3<=((((twiddle3r)*acum_i3)+((twiddle3i)*acum_r3)))/factor3;         
             
             temp_multr4<=((((twiddle4r)*acum_r4)-((twiddle4i)*acum_i4)))/factor4;
                                       temp_multi4<=((((twiddle4r)*acum_i4)+((twiddle4i)*acum_r4)))/factor4;
                                       
           temp_multr5<=((((twiddle5r)*acum_r5)-((twiddle5i)*acum_i5)))/factor5;
                                                    temp_multi5<=((((twiddle5r)*acum_i5)+((twiddle5i)*acum_r5)))/factor5;
         
           acum_r1<=temp_multr1(15 downto 0)+(data_r);
           acum_i1<=temp_multi1(15 downto 0)+(data_i);
           
        acum_r2<=temp_multr2(15 downto 0)+(data_r);
                     acum_i2<=temp_multi2(15 downto 0)+(data_i);
                     
             acum_r3<=temp_multr3(15 downto 0)+(data_r);
                               acum_i3<=temp_multi3(15 downto 0)+(data_i);
                               
                                acum_r4<=temp_multr4(15 downto 0)+(data_r);
                                         acum_i4<=temp_multi4(15 downto 0)+(data_i);
                                          acum_r5<=temp_multr5(15 downto 0)+(data_r);
                                                   acum_i5<=temp_multi5(15 downto 0)+(data_i);
                                                            
         i<=i+1;
        if i="1000000" then
            i<="0000000";
            fftr1<=(acum_r1(15 downto 0));
            ffti1<=(acum_i1(15 downto 0));
            
              fftr2<=(acum_r2(15 downto 0));
                      ffti2<=(acum_i2(15 downto 0));
               
                 fftr3<=(acum_r3(15 downto 0));
                                ffti3<=(acum_i3(15 downto 0));
                                
                                  fftr4<=(acum_r4(15 downto 0));
                                          ffti4<=(acum_i4(15 downto 0));
                                          
                                            fftr5<=(acum_r5(15 downto 0));
                                                    ffti5<=(acum_i5(15 downto 0));
            
         
            temp_multr1<=(others=>'0');
             temp_multi1<=(others=>'0');
             temp_multr2<=(others=>'0');
             temp_multi2<=(others=>'0');
             temp_multr3<=(others=>'0');
                temp_multi3<=(others=>'0');
              temp_multr4<=(others=>'0');
              temp_multi4<=(others=>'0');
             temp_multr5<=(others=>'0');
               temp_multi5<=(others=>'0');
               
                acum_r1<=(others=>'0');
                acum_i1<=(others=>'0');
                acum_r2<=(others=>'0');
                  acum_i2<=(others=>'0');
               acum_r3<=(others=>'0');
                  acum_i3<=(others=>'0');
                     acum_r4<=(others=>'0');
                      acum_i4<=(others=>'0');
              acum_r5<=(others=>'0');
                 acum_i5<=(others=>'0');
         
                   
      
        end if;
    end if;
 end process;    

end Behavioral;
