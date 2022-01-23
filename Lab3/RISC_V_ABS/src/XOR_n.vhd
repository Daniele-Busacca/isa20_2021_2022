library ieee;
use ieee.std_logic_1164.all;

entity XOR_n is
    generic ( n : positive );
    port (
        A, B : in std_logic_vector( n-1 downto 0 );
        -------------------------------------------
        Y : out std_logic_vector( n-1 downto 0 )
    );
end XOR_n;

architecture struct of XOR_n is

    begin

        EXOR_GATES : for i in 0 to n-1 generate
            Y(i) <= A(i) xor B(i);
        end generate;

end architecture;