

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_STD.ALL;


entity mcs_top is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           tx : out STD_LOGIC;
           rx : in STD_LOGIC;
            switches: in std_logic_vector(15 downto 0);
           led: out std_logic_vector(15 downto 0)
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
signal ram_r_addr:std_logic_vector(7 downto 0);
signal ram_w_data:std_logic_vector(31 downto 0);
signal ram_r_data:std_logic_vector(31 downto 0);
signal write_en:std_logic;
signal read_en:std_logic;
signal data_out:std_logic_vector(31 downto 0);	

--MAC Operation
signal ar:  signed(15 downto 0);
		signal   ai:  signed(15 downto 0);
		   signal br:  signed(15 downto 0);
		   signal bi:  signed(15 downto 0);
		  signal cr:  signed(31 downto 0);
		  signal ci:  signed(31 downto 0);
		  signal di:  signed(31 downto 0);
		 signal  dr:  signed(31 downto 0);
		 



--FFTOP

signal tmpfftr1: signed(15 downto 0);
signal tmpffti1: signed(15 downto 0);	
signal tmpfftr2: signed(15 downto 0);
signal tmpffti2: signed(15 downto 0);
signal tmpfftr3: signed(15 downto 0);
signal tmpffti3: signed(15 downto 0);
signal tmpfftr4: signed(15 downto 0);
signal tmpffti4: signed(15 downto 0);
signal tmpfftr5: signed(15 downto 0);
signal tmpffti5: signed(15 downto 0);

begin


  processor1: microblaze_mcs_0 port map(Clk=>clock,Reset=>reset,IO_addr_strobe=>IO_addr_strobe,IO_address=>IO_address,
          IO_byte_enable=>IO_byte_enable,IO_read_data=>IO_read_data,IO_read_strobe=>IO_read_strobe,
          IO_ready=>IO_ready,IO_write_data=>IO_write_data,IO_write_strobe=>IO_write_strobe,
          UART_rxd=>rx,UART_txd=>tx);
          
    rom1: rom port map(clock=>clock,addr=>addr1,write_en=>write_en,read_en=>read_en,data_in=>ram_w_data,data_out=>ram_r_data);

dft1: dft port map(clock=>clock,data_r=>signed(ram_r_data(31 downto 16)),data_i=>signed(ram_r_data(15 downto 0)),fftr1=>tmpfftr1,ffti1=>tmpffti1,fftr2=>tmpfftr2,ffti2=>tmpffti2,fftr3=>tmpfftr3,ffti3=>tmpffti3,fftr4=>tmpfftr4,ffti4=>tmpffti4,fftr5=>tmpfftr5,ffti5=>tmpffti5);

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
                    --Switch to led
                     when X"C0000000" =>led<=IO_write_data(15 downto 0);
                   
                    --MAC Operation
                             when X"C0000010"=>ar<=SIGNED(IO_write_data(31 downto 16));
                                               ai<=SIGNED(IO_write_data(15 downto 0));
                               when X"C0000014"=>br<=SIGNED(IO_write_data(31 downto 16));
                                                bi<=signed(IO_write_data(15 downto 0));
                               when X"C0000018"=>cr<=SIGNED(IO_write_data);
                               when X"C000001C"=>ci<=SIGNED(IO_write_data);
                               when X"C0000020"=>dr<=signed(IO_write_data);
                               when X"C0000024"=>di<=SIGNED(IO_write_data);
                          
                               --DFT
                    when X"C000050"=>ram_r_addr<=IO_write_data(7 downto 0);
					when X"C0000058"=>addr1<=IO_write_data(7 downto 0);
					when X"C000005C"=>ram_w_data<=IO_write_data(31 downto 0);
                   when others=>
               end case;
           end if;
--		   
	--Read
if ( IO_read_strobe='1') then
         read_en<='1';
         write_en<='0';
            c1: case (IO_address) is
                   --read from switch
                     when X"C0000000" =>IO_read_data<=X"0000" & switches;
                    --MAC
                        when X"C0000010"=>IO_read_data<=STD_LOGIC_VECTOR(ar) & STD_LOGIC_VECTOR(ai);
                         when X"C0000014"=>IO_read_data<=STD_LOGIC_VECTOR(br) & std_logic_vector(bi);
                         when X"C0000018"=>IO_read_data<=STD_LOGIC_VECTOR(cr);
                           when X"C000001C"=>IO_read_data<=STD_LOGIC_VECTOR(ci);
                            when X"C0000020"=>IO_read_data<=STD_LOGIC_VECTOR(dr);
                           when X"C0000024"=>IO_read_data<=STD_LOGIC_VECTOR(di);
                                        
                                        --DFT
                                        
                    when X"C0000058"=>IO_read_data<=X"000000"&addr1;
                      when X"C0000054"=>IO_read_data<=ram_r_data;
				
                       when X"C0000060"=>IO_read_data<=std_logic_vector(tmpfftr1)& std_logic_vector(tmpffti1);
					 when X"C0000064"=>IO_read_data<=std_logic_vector(tmpfftr2)& std_logic_vector(tmpffti2);
					 when X"C0000068"=>IO_read_data<=std_logic_vector(tmpfftr3)& std_logic_vector(tmpffti3);
					 when X"C000006C"=>IO_read_data<=std_logic_vector(tmpfftr4)& std_logic_vector(tmpffti4);
					 when X"C0000070"=>IO_read_data<=std_logic_vector(tmpfftr5)& std_logic_vector(tmpffti5);
					  -- when X"C0000062"=>IO_read_data<=X"00000001";--std_logic_vector(fftr2)& std_logic_vector(ffti2);
                    when others=>
               end case;
           end if;
    

     
          end if;
  end if;

  
  dr<=ar*br-ai*bi+cr;
  di<=ar*bi+ai*br+ci;
  
end process;
  
end Behavioral;
