library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Adder_n is
    generic ( n : positive );
    port (
        A, B : in std_logic_vector( n-1 downto 0 );
        -------------------------------------------
        Z : out std_logic_vector( n-1 downto 0 )
    );
end Adder_n;

architecture beh of Adder_n is

    begin

        Z <= std_logic_vector( signed(A) + signed(B) );

end architecture;