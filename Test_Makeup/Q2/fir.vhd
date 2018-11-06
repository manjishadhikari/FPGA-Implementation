library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity firfilter_4tap is
port(   Clk : in std_logic; --clock signal
        Datain : in signed(7 downto 0); --input signal
        Filterout : out signed(15 downto 0)  --filter output
        );
end firfilter_4tap;

architecture Behavioral of firfilter_4tap is

component DFF is 
   port(
      Q : out signed(15 downto 0);      --output connected to the adder
      Clk :in std_logic;      -- Clock input
      D :in  signed(15 downto 0)      -- Data input from the MCM block.
   );
end component;  
    
signal coeff0,coeff1,coeff2,coeff3 : signed(7 downto 0) := (others => '0');
signal Multout0,Multout1,Multout2,Multout3,Adder_out1,Adder_out2,Adder_out3 : signed(15 downto 0) := (others => '0');
signal Q1,Q2,Q3 : signed(15 downto 0) := (others => '0');

begin

--FIR Filter coefficients
--H = [1 1 1 1].
coeff0 <= to_signed(1,8);
coeff1 <= to_signed(1,8);
coeff2 <= to_signed(1,8);
coeff3 <= to_signed(1,8);

--Multiple constant multiplications.
Multout3 <= coeff3*Datain;
Multout2 <= coeff2*Datain;
Multout1 <= coeff1*Datain;
Multout0 <= coeff0*Datain;

--adders
Adder_out1 <= Q1 + Multout2;
Adder_out2 <= Q2 + Multout1;
Adder_out3 <= Q3 + Multout0;

--flipflops(for introducing a delay).
Dff1 : DFF port map(Q1,Clk,Multout3);
Dff2 : DFF port map(Q2,Clk,Adder_out1);
Dff3 : DFF port map(Q3,Clk,Adder_out2);

--an output produced at every positive edge of clock cycle.
process(Clk)
begin
    if(rising_edge(Clk)) then
        Filterout <= Adder_out3;
    end if;
end process;
    
end Behavioral;
