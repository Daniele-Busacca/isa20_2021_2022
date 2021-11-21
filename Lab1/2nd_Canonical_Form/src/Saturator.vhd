library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Saturator is
	port( A : in signed( 7 downto 0 );
		------------------------------
		Y : out signed( 6 downto 0 ));
end Saturator;

architecture Behaviour of Saturator is

	signal Sel : std_logic_vector( 1 downto 0 );
	
	begin

		Sel <= A(7) & A(6);

		Y <= A(6 downto 0) when Sel = "00" else
		     "0111111" when Sel = "01" else
		     "1000000" when Sel = "10" else
		     A(6 downto 0) when Sel = "11";

end architecture;
