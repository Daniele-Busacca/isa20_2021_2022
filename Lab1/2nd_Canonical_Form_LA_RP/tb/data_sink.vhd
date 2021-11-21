library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity data_sink is
  port (
    CLK   : in std_logic;
    RST_n : in std_logic;
    VIN   : in std_logic;							-- this value is VOUT of the top level entity "IIR_Filter.vhd"
    DIN   : in std_logic_vector(12 downto 0));		-- this value is DOUT of the top level entity "IIR_Filter.vhd"
end data_sink;

architecture beh of data_sink is

begin  -- beh

  process (CLK, RST_n)
    file res_fp : text open WRITE_MODE is "./results_VHDL.txt";			-- file to be written
    variable line_out : line;    
  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      null;
    elsif CLK'event and CLK = '1' then  -- rising clock edge			-- every clock period, the DIN value is written into the file ...
      if (VIN = '1') then												-- ... only when VIN = 1
        write(line_out, conv_integer(signed(DIN)));
        writeline(res_fp, line_out);
      end if;
    end if;
  end process;

end beh;
