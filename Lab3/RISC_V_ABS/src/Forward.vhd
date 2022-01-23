library ieee;
use ieee.std_logic_1164.all;

entity Forward is
    port ( 
        A, B, C, D : in std_logic;
        --------------------------------------
        Y : out std_logic_vector( 1 downto 0 )
    );
end Forward;

architecture beh of Forward is

    signal COMB : std_logic_vector( 3 downto 0 );

    begin

        COMB <= A & B & C & D;              -- Rs<x>_Rd_MEM_Equal & Rs<x>_Rd_WB_Equal & RF_W_MEM & RF_W_WB

        Y <= "00" when COMB = "0000" else
             "00" when COMB = "0001" else
             "00" when COMB = "0010" else
             "00" when COMB = "0011" else
             "00" when COMB = "0100" else
             "10" when COMB = "0101" else
             "00" when COMB = "0110" else
             "10" when COMB = "0111" else
             "00" when COMB = "1000" else
             "00" when COMB = "1001" else
             "01" when COMB = "1010" else
             "01" when COMB = "1011" else
             "00" when COMB = "1100" else
             "10" when COMB = "1101" else
             "01" when COMB = "1110" else
             "01";
 
end architecture;