library ieee;
use ieee.std_logic_1164.all;

entity AND_n is
    generic ( n : positive );
    port (
        A, B : in std_logic_vector( n-1 downto 0 );
        -------------------------------------------
        Y : out std_logic_vector( n-1 downto 0 )
    );
end AND_n;

architecture struct of AND_n is

    begin

        AND_GATES : for i in 0 to n-1 generate
            Y(i) <= A(i) and B(i);
        end generate;

end architecture;