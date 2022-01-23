library ieee;
use ieee.std_logic_1164.all;

entity Mux4to1_OB is
    port (
        A, B, C, D : in std_logic;
        Sel : in std_logic_vector( 1 downto 0 );
        ----------------------------------------
        Y : out std_logic
    );
end Mux4to1_OB;

architecture struct of Mux4to1_OB is

    begin

        Y <= A when Sel = "00" else
             B when Sel = "01" else
             C when Sel = "10" else
             D;

end architecture;