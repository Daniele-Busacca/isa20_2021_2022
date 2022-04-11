library ieee;
use ieee.std_logic_1164.all;

entity Mux8to1 is
  generic( n : positive );
  port( A, B, C, D, E, F, G, H : in std_logic_vector( n-1 downto 0 );
    Sel : in std_logic_vector( 2 downto 0 );
    -----------------------------------------------------------------
    Z : out std_logic_vector( n-1 downto 0 ));
end Mux8to1;

architecture behavior of Mux8to1 is

  begin

    -- Sel(2) = X(2j+1)
    -- Sel(1) = X(2j)
    -- Sel(0) = X(2j-1)

    Z <= A when Sel <= "000" else
         B when Sel <= "001" else
         C when Sel <= "010" else
         D when Sel <= "011" else
         E when Sel <= "100" else
         F when Sel <= "101" else
         G when Sel <= "110" else
         H when Sel <= "111";

end architecture;
