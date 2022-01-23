library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Sub_tb is
	port( PC : in std_logic_vector( 31 downto 0 );
		  ADD_IMEM : out std_logic_vector( 29 downto 0 ));
end Sub_tb;

architecture beh of Sub_tb is

	signal ADD_IMEM_32 : std_logic_vector( 31 downto 0 );

	begin

		ADD_IMEM_32 <= std_logic_vector(unsigned(PC) - "00000000010000000000000000000000");
		ADD_IMEM <= ADD_IMEM_32(31 downto 2);

end architecture;
