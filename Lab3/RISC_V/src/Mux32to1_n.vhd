library ieee;
use ieee.std_logic_1164.all;

entity Mux32to1_n is
    generic( n : positive );
    port (
        IN_1  : in std_logic_vector( n-1 downto 0 );
        IN_2  : in std_logic_vector( n-1 downto 0 );
        IN_3  : in std_logic_vector( n-1 downto 0 );
        IN_4  : in std_logic_vector( n-1 downto 0 );
        IN_5  : in std_logic_vector( n-1 downto 0 );
        IN_6  : in std_logic_vector( n-1 downto 0 );
        IN_7  : in std_logic_vector( n-1 downto 0 );
        IN_8  : in std_logic_vector( n-1 downto 0 );
        IN_9  : in std_logic_vector( n-1 downto 0 );
        IN_10 : in std_logic_vector( n-1 downto 0 );
        IN_11 : in std_logic_vector( n-1 downto 0 );
        IN_12 : in std_logic_vector( n-1 downto 0 );
        IN_13 : in std_logic_vector( n-1 downto 0 );
        IN_14 : in std_logic_vector( n-1 downto 0 );
        IN_15 : in std_logic_vector( n-1 downto 0 );
        IN_16 : in std_logic_vector( n-1 downto 0 );
        IN_17 : in std_logic_vector( n-1 downto 0 );
        IN_18 : in std_logic_vector( n-1 downto 0 );
        IN_19 : in std_logic_vector( n-1 downto 0 );
        IN_20 : in std_logic_vector( n-1 downto 0 );
        IN_21 : in std_logic_vector( n-1 downto 0 );
        IN_22 : in std_logic_vector( n-1 downto 0 );
        IN_23 : in std_logic_vector( n-1 downto 0 );
        IN_24 : in std_logic_vector( n-1 downto 0 );
        IN_25 : in std_logic_vector( n-1 downto 0 );
        IN_26 : in std_logic_vector( n-1 downto 0 );
        IN_27 : in std_logic_vector( n-1 downto 0 );
        IN_28 : in std_logic_vector( n-1 downto 0 );
        IN_29 : in std_logic_vector( n-1 downto 0 );
        IN_30 : in std_logic_vector( n-1 downto 0 );
        IN_31 : in std_logic_vector( n-1 downto 0 );
        IN_32 : in std_logic_vector( n-1 downto 0 );
        Sel : in std_logic_vector( 4 downto 0 );
        --------------------------------------------
        Y : out std_logic_vector( n-1 downto 0 )
    );
end Mux32to1_n;

architecture beh of Mux32to1_n is

    begin

        Y <= IN_1  when Sel = "00000" else
             IN_2  when Sel = "00001" else
             IN_3  when Sel = "00010" else
             IN_4  when Sel = "00011" else
             IN_5  when Sel = "00100" else
             IN_6  when Sel = "00101" else
             IN_7  when Sel = "00110" else
             IN_8  when Sel = "00111" else
             IN_9  when Sel = "01000" else
             IN_10 when Sel = "01001" else
             IN_11 when Sel = "01010" else
             IN_12 when Sel = "01011" else
             IN_13 when Sel = "01100" else
             IN_14 when Sel = "01101" else
             IN_15 when Sel = "01110" else
             IN_16 when Sel = "01111" else
             IN_17 when Sel = "10000" else
             IN_18 when Sel = "10001" else
             IN_19 when Sel = "10010" else
             IN_20 when Sel = "10011" else
             IN_21 when Sel = "10100" else
             IN_22 when Sel = "10101" else
             IN_23 when Sel = "10110" else
             IN_24 when Sel = "10111" else
             IN_25 when Sel = "11000" else
             IN_26 when Sel = "11001" else
             IN_27 when Sel = "11010" else
             IN_28 when Sel = "11011" else
             IN_29 when Sel = "11100" else
             IN_30 when Sel = "11101" else
             IN_31 when Sel = "11110" else
             IN_32;

end architecture;