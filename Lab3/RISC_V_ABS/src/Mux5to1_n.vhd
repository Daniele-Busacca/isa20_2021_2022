library ieee;
use ieee.std_logic_1164.all;

entity Mux5to1_n is
    generic ( n : positive );
    port (
        A, B, C, D, E : in std_logic_vector( n-1 downto 0 );
        Sel : in std_logic_vector( 2 downto 0 );
        ----------------------------------------------------
        Y : out std_logic_vector( n-1 downto 0 )
    );
end Mux5to1_n;

architecture beh of Mux5to1_n is

    begin

        Y <= A when Sel = "000" else
             B when Sel = "001" else
             C when Sel = "010" else
             D when Sel = "011" else
             E;

end architecture;