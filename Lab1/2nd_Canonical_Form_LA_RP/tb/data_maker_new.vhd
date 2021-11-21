library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity data_maker is  
  port (
    CLK     : in  std_logic;
    RST_n   : in  std_logic;
    VOUT    : out std_logic;				          -- this value is VIN of top level entity "IIR_Filter.vhd"
    DOUT    : out std_logic_vector(12 downto 0);	  -- this value is DIN of top level entity "IIR_Filter.vhd"
    A1      : out std_logic_vector(12 downto 0);
    A2      : out std_logic_vector(12 downto 0);    
    B0      : out std_logic_vector(12 downto 0);
    B1      : out std_logic_vector(12 downto 0);
    B2      : out std_logic_vector(12 downto 0);
	B3      : out std_logic_vector(12 downto 0);
    END_SIM : out std_logic);
end data_maker;

architecture beh of data_maker is

  constant tco : time := 1 ns;

  signal sEndSim : std_logic;
  signal END_SIM_i : std_logic_vector(0 to 10);  

begin  -- beh

  A1 <= conv_std_logic_vector(-242,13);
  A2 <= conv_std_logic_vector(-242,13);
  B0 <= conv_std_logic_vector(846,13);
  B1 <= conv_std_logic_vector(2004,13);
  B2 <= conv_std_logic_vector(1471,13);
  B3 <= conv_std_logic_vector(-312,13);

  process (CLK, RST_n)								                    -- READING THE FILE...
    file fp_in : text open READ_MODE is "../tb/samples.txt";		-- file to open
    variable line_in : line;
    variable x : integer;
  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      DOUT <= (others => '0') after tco;      					-- when the reset is active, the output goes to 0 after a delay value
      VOUT <= '0' after tco;
      sEndSim <= '0' after tco;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if not endfile(fp_in) then						     -- until EOF is not reached
        readline(fp_in, line_in);							 -- read every line of the file ...
        read(line_in, x);							    	 -- ... costitued by integers number in decimal notation
        DOUT <= conv_std_logic_vector(x,13) after tco;		 -- conversion from decimal notation to 16bit-binary one after a delay value
		VOUT <= '1' after tco;								 -- VOUT goes to 1 with the same timing of DOUT
        sEndSim <= '0' after tco;							 -- sEndSim has the opposite value of VOUT
      else
        VOUT <= '0' after tco;        						 -- when EOF is reached, VOUT goes to 0 and sEndSim goes to 1
        sEndSim <= '1' after tco;
      end if;
    end if;
  end process;

  process (CLK, RST_n)
  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      END_SIM_i <= (others => '0') after tco; 
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      END_SIM_i(0) <= sEndSim after tco;
      END_SIM_i(1 to 10) <= END_SIM_i(0 to 9) after tco;			-- data shifting every clock period
    end if;
  end process;

  END_SIM <= END_SIM_i(10);				-- according to what is writter above, when the file pointer reaches the EOF, ...
										-- ... the signal sEndSim goes to 1, but the signal END_SIM goes to 1 after 10 clock cycles ...
										-- ... because of the data shifting of the signal END_SIM_i (END_SIM is in fact the bit #10 of
										-- ... END_SIM_i)

end beh;
