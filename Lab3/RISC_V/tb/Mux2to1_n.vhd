library ieee;
use ieee.std_logic_1164.all;

entity Mux2to1_n is
    generic ( n : positive );
    port (
        A, B : in std_logic_vector( n-1 downto 0 );
        Sel : in std_logic;
        -------------------------------------------
        Y : out std_logic_vector( n-1 downto 0 )
    );
end Mux2to1_n;

architecture beh of Mux2to1_n is

    begin

        Y <= A when Sel = '0' else
             B;

end architecture;