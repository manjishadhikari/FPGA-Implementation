library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity dft_tb is
end;

architecture bench of dft_tb is

  component dft
      Port ( clock: in std_logic;
              datain : in STD_LOGIC_VECTOR (31 downto 0);
             twiddle : in STD_LOGIC_VECTOR (31 downto 0);
               -- sumout1:out std_logic_vector(31 downto 0);
               --   multout1:out std_logic_vector(31 downto 0);
                --  temp10: out std_logic_vector(31 downto 0);
             dataout : out STD_LOGIC_VECTOR (31 downto 0));
  end component;

  signal clock: std_logic;
  signal datain: STD_LOGIC_VECTOR (31 downto 0);
  signal twiddle: STD_LOGIC_VECTOR (31 downto 0);
  signal dataout: STD_LOGIC_VECTOR (31 downto 0);
  -- signal sumout1: std_logic_vector(31 downto 0);
  -- signal  multout1: std_logic_vector(31 downto 0);
  -- signal temp10:  std_logic_vector(31 downto 0);
  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: dft port map ( clock   => clock,
                      datain  => datain,
                      twiddle => twiddle,
                    --  sumout1=>sumout1,
                    --  multout1=>multout1,
                   --  temp10=>temp10,
                      dataout => dataout );

  stimulus: process
  begin
    
    twiddle<=X"00000001";
    datain<=X"00000001";
    wait for 10 ns;
     datain<=X"00000001";
       wait for 10 ns; datain<=X"00000001";
        wait for 10 ns; datain<=X"00000001";
          wait for 10 ns; datain<=X"00000001";
           wait for 10 ns; datain<=X"00000001";
             wait for 10 ns; datain<=X"00000001";
              wait for 10 ns; datain<=X"00000001";
                wait for 10 ns; datain<=X"00000001";
                 wait for 10 ns; datain<=X"00000001";
                   wait for 10 ns; datain<=X"00000001";
                    wait for 10 ns; datain<=X"00000001";
                      wait for 10 ns; datain<=X"00000001";
                       wait for 10 ns; datain<=X"00000001";
                         wait for 10 ns; datain<=X"00000001";
                          wait for 10 ns; datain<=X"00000001";
                            wait for 10 ns; datain<=X"00000001";
                             wait for 10 ns; datain<=X"00000001";
                               wait for 10 ns; datain<=X"00000001";
                                wait for 10 ns; datain<=X"00000001";
                                  wait for 10 ns; datain<=X"00000001";
                                   wait for 10 ns; datain<=X"00000001";
                                     wait for 10 ns; datain<=X"00000001";
                                      wait for 10 ns; datain<=X"00000001";
                                        wait for 10 ns; datain<=X"00000001";
                                         wait for 10 ns; datain<=X"00000001";
                                           wait for 10 ns; datain<=X"00000001";
                                            wait for 10 ns; datain<=X"00000001";
                                              wait for 10 ns; datain<=X"00000001";
                                               wait for 10 ns; datain<=X"00000001";
                                                 wait for 10 ns; datain<=X"00000001";
                                                  wait for 10 ns; datain<=X"00000001";
                                                    wait for 10 ns; datain<=X"00000001";
                                                     wait for 10 us;
    -- Put initialisation code here


    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clock <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
  