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
    A       : out std_logic_vector(31 downto 0); 
    B       : out std_logic_vector(31 downto 0));
end data_maker;

architecture beh of data_maker is

  constant tco : time := 1 ns;

begin  -- beh

  process (CLK)								                    -- READING THE FILE...
    file fp_in : text open READ_MODE is "../tb/fp_samples.txt";		-- file to open
    variable line_in : line;
    variable x : integer;
  begin  -- process
    if CLK'event and CLK = '1' then  -- rising clock edge
      if not endfile(fp_in) then						     -- until EOF is not reached
        readline(fp_in, line_in);							 -- read every line of the file ...
        read(line_in, x);							    	 -- ... costitued by integers number in decimal notation
        A <= conv_std_logic_vector(x,32) after tco;		     -- conversion from integer notation to 32bit-binary one after a delay value
	B <= conv_std_logic_vector(x,32) after tco;
	  end if;
    end if;
  end process;

end beh;
