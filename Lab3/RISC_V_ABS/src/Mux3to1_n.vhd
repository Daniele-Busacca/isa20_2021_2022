library ieee;
use ieee.std_logic_1164.all;

entity Mux3to1_n is
    generic ( n : positive );
    port (
        A, B, C : in std_logic_vector( n-1 downto 0 );
        Sel : in std_logic_vector( 1 downto 0 );
        ----------------------------------------------
        Y : out std_logic_vector( n-1 downto 0 )
    );
end Mux3to1_n;

architecture beh of Mux3to1_n is

    begin

        Y <= A when Sel = "00" else
             B when Sel = "01" else
             C;

end architecture;