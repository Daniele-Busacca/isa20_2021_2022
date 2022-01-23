library ieee;
use ieee.std_logic_1164.all;

entity clk_rst_gen is
	port( CLK  : out std_logic;
		  RSTn : out std_logic );
end clk_rst_gen;

architecture beh of clk_rst_gen is

	constant T : time := 17.04 ns;

	signal clk_i : std_logic := '1';

	begin

		clk_process : process is
			begin
				clk_i <= '0' after T/2, '1' after T;
				wait for T;
		end process;

		CLK <= clk_i;

		RSTn <= '0', '1' after 30 ns;

end architecture;
