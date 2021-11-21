library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clk_gen is
  port (
    END_SIM : in  std_logic;
    CLK     : out std_logic;
    RST_n   : out std_logic);
end clk_gen;

architecture beh of clk_gen is

  constant Ts : time := 10.52 ns;	-- clock period (USED FOR SWITCHING ACTIVITY)
  -- constant Ts : time := 10 ns;		-- clock period (USED FOR A FIRST SIMULATION)
  
  signal CLK_i : std_logic;			-- signal used to create the clock signal
  
begin  -- beh

  process
  begin  -- process
    if (CLK_i = 'U') then		    -- at the beginning this signal has undefined value
      CLK_i <= '0';			        -- its value is therefore put to 0 (only initially)
    else
      CLK_i <= not(CLK_i);		    -- toggle every half of clock period
    end if;
    wait for Ts/2;
  end process;

  CLK <= CLK_i and not(END_SIM);	-- output clock signal toggles only when the "END_SIM" is not 1

  process
  begin  -- process
    RST_n <= '0';			        -- reset is active for one clock period and an half
    wait for 3*Ts/2;
    RST_n <= '1';
    wait;
  end process;

end beh;
