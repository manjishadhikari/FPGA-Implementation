

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mcs_top is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           tx : out STD_LOGIC;
           rx : in STD_LOGIC
         );
end mcs_top;



architecture Behavioral of mcs_top is
component microblaze_mcs_0 IS
  PORT (
    Clk : IN STD_LOGIC;
    Reset : IN STD_LOGIC;
    IO_addr_strobe : OUT STD_LOGIC;
    IO_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    IO_byte_enable : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    IO_read_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IO_read_strobe : OUT STD_LOGIC;
    IO_ready : IN STD_LOGIC;
    IO_write_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    IO_write_strobe : OUT STD_LOGIC;
    UART_rxd : IN STD_LOGIC;
    UART_txd : OUT STD_LOGIC
  );
END component;

component rom is
port (clock: in std_logic;
addr: in std_logic_vector(7 downto 0);
write_en: in std_logic;
read_en: in std_logic;
data_in: in std_logic_vector(31 downto 0);
data_out: out std_logic_vector(31 downto 0));
end component;

component dft is
    Port ( clock: in std_logic;
            data_r : in signed (15 downto 0);
           data_i : in signed (15 downto 0);
           twiddle_r : in signed (15 downto 0);
            twiddle_i : in signed (15 downto 0);
			factor: in signed(16 downto 0);
         --   t_temp_mult_r: out signed(31 downto 0);
          --    t_temp_mult_i: out signed(31 downto 0);
         fft_i : out signed(15 downto 0);
           fft_r : out signed(15 downto 0));
           
end component;

signal IO_addr_strobe: std_logic;
signal IO_read_strobe: std_logic;
signal IO_write_strobe: std_logic;
signal IO_address: std_logic_vector(31 downto 0);
signal IO_byte_enable: std_logic_vector(3 downto 0);
signal IO_write_data: std_logic_vector(31 downto 0);
signal IO_read_data: std_logic_vector(31 downto 0);
signal IO_ready:std_logic;
signal addr1:std_logic_vector(7 downto 0);
--signal ram_w_addr:std_logic_vector(7 downto 0);
signal ram_w_data:std_logic_vector(31 downto 0);
signal ram_r_data:std_logic_vector(31 downto 0);
signal write_en:std_logic;
signal read_en:std_logic;
signal data_out:std_logic_vector(31 downto 0);	

--TWIDDLE1
signal twd1: signed(15 downto 0):=X"0001";
signal twdi1: signed(15 downto 0):=X"0000";
signal fftr1: signed(15 downto 0);
signal ffti1: signed(15 downto 0);	
signal factor1: signed(15 downto 0):="0001"; 

--TWIDDLE2
signal twdr2: signed(15 downto 0):=X"0001";
signal twdi2: signed(15 downto 0):=X"0000";
signal fftr2: signed(15 downto 0);
signal ffti2: signed(15 downto 0);	
signal factor2: signed(15 downto 0):="0001"; 

begin


  processor1: microblaze_mcs_0 port map(Clk=>clock,Reset=>reset,IO_addr_strobe=>IO_addr_strobe,IO_address=>IO_address,
          IO_byte_enable=>IO_byte_enable,IO_read_data=>IO_read_data,IO_read_strobe=>IO_read_strobe,
          IO_ready=>IO_ready,IO_write_data=>IO_write_data,IO_write_strobe=>IO_write_strobe,
          UART_rxd=>rx,UART_txd=>tx);
          
    rom1: rom port map(clock=>clock,addr=>addr1,write_en=>write_en,read_en=>read_en,data_in=>ram_w_data,data_out=>ram_r_data);

dft1: dft port map(clock=>clock,data_r=>signed(ram_r_data(31 downto 16)),data_i=>signed(ram_r_data(15 downto 0)),twiddle_r=>twd1,twiddle_i=>twdi1,fft_r=>fftr1,fft_i=>ffti1,factor=>factor1);
dft2: dft port map((clock=>clock,data_r=>signed(ram_r_data(31 downto 16)),data_i=>signed(ram_r_data(15 downto 0)),twiddle_r=>twdr2,twiddle_i=>twdi2,fft_r=>fftr2,fft_i=>ffti2,factor=>factor2);

process(clock)
begin
     
         if rising_edge(clock)  then
            IO_ready<=IO_addr_strobe and (not(IO_ready));
   
     if (IO_addr_strobe='1' ) then
	 
	--Write 
if (IO_write_strobe='1') then
            write_en<='1';
            read_en<='0';
           c21: case (IO_address) is

					when X"C0000050"=>addr1<=IO_write_data(7 downto 0);
					when X"C0000058"=>ram_w_data<=IO_write_data(31 downto 0);
                   when others=>
               end case;
           end if;
--		   
	--Read
if ( IO_read_strobe='1') then
         read_en<='1';
         write_en<='0';
            c1: case (IO_address) is
     
                    when X"C0000050"=>IO_read_data<=X"000000"&addr1;
                      when X"C0000074"=>IO_read_data(31 downto 0)<=ram_r_data;
				
                       when X"C0000080"=>IO_read_data<=std_logic_vector(fftr1)& std_logic_vector(ffti1);
					   when X"C0000090"=>IO_read_data<=std_logic_vector(fftr2)& std_logic_vector(ffti2);
                    when others=>
               end case;
           end if;
    

     
          end if;
  end if;
  
  
  
  
end process;
  
end Behavioral;
