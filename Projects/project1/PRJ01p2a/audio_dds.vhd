library ieee;
use ieee.std_logic_1164.all;

entity audio_dds is
  port (clock   : in  std_logic;
        switch  : in  std_logic_vector(7 downto 0);
  		  amp_pdm : out std_logic;
	  	  amp_ena : out std_logic); --busy from the project
end audio_dds;

architecture structural of audio_dds is

  component run_code
    port (tone    : in  std_logic_vector(3 downto 0);
          limit   : out std_logic_vector(23 downto 0);
  		    run     : out std_logic);
  end component;

  component counter
    port (clock  : in std_logic;
          enable : in std_logic;
          limit  : in std_logic_vector(23 downto 0);
          count  : out std_logic_vector(23 downto 0);
          wrap   : out std_logic);
  end component;

  component rom
    port (clock  : in std_logic;
          addr   : in std_logic_vector(13 downto 0);
          data   : out std_logic_vector(9 downto 0));
  end component;

  component gain
    port (clock    : in  std_logic;
          level    : in  std_logic_vector(3 downto 0);
          data_in  : in  std_logic_vector(9 downto 0);
  		    data_out : out std_logic_vector(13 downto 0));
  end component;
  
  component pdm
    port (clock   : in std_logic;
          data_in : in std_logic_vector(9 downto 0);
          tx      : out std_logic);
  end component;

  signal step  : std_logic; --rate counter wrap
  signal done  : std_logic; --addr counter wrap
  signal run   : std_logic; --busy signal
  signal addr  : std_logic_vector(23 downto 0);
  signal limit : std_logic_vector(23 downto 0);
  signal adata : std_logic_vector(09 downto 0) := "00" & "0000" & "0000";
  signal mdata : std_logic_vector(13 downto 0) := "00" & "0000" & "0000" & "0000";

begin

  amp_ena <= run;

  decode : run_code
    port map (tone => switch(3 downto 0), 
              limit => limit,
              run => run);

  rate_counter : counter
    port map (clock => clock,
              enable => run,
              limit => limit,
              wrap => step);

  addr_counter : counter
    port map (clock => clock,
              enable => step,
              limit => "0000" & "0000" & "0011" & "1111" & "1111" & "1111", --16384
              count => addr,
              wrap => done);

  audio_rom : rom
    port map (clock => clock,
              addr => addr(13 downto 0),
              data => adata);

  audio_gain : gain
    port map (clock => clock,
              level => switch(7 downto 4),
              data_in => adata,
              data_out => mdata);

  audio_pdm : pdm
    port map (clock => clock,
				      data_in => mdata(13 downto 4),
				      tx => amp_pdm);

end structural;