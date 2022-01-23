library ieee;
use ieee.std_logic_1164.all;

entity Left_Shift_1_n is
    generic( n : positive );
    port (
        A : in std_logic_vector( n-1 downto 0 );
        ----------------------------------------
        Y : out std_logic_vector( n-1 downto 0 )
    );
end Left_Shift_1_n;

architecture struct of Left_Shift_1_n is

    begin

        Y <= A( n-2 downto 0 ) & '0';

end architecture;