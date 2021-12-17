library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Sel_PP is
    port (
        X : in std_logic_vector( 23 downto 0 );
        -----------------------------------------
        Sel : out std_logic_vector( 38 downto 0 )
    );
end Sel_PP;

architecture structure of Sel_PP is

    begin

        Sel(38 downto 36) <= '0' & '0' & X(23);
        Sel(35 downto 33) <= X(23 downto 21);
        Sel(32 downto 30) <= X(21 downto 19);
        Sel(29 downto 27) <= X(19 downto 17);
        Sel(26 downto 24) <= X(17 downto 15);
        Sel(23 downto 21) <= X(15 downto 13);
        Sel(20 downto 18) <= X(13 downto 11);
        Sel(17 downto 15) <= X(11 downto 9);
        Sel(14 downto 12) <= X(9 downto 7);
        Sel(11 downto 9)  <= X(7 downto 5);
        Sel(8 downto 6)   <= X(5 downto 3);
        Sel(5 downto 3)   <= X(3 downto 1);
        Sel(2 downto 0)   <= X(1 downto 0) & '0';

end architecture;