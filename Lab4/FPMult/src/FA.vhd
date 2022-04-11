library ieee;
use ieee.std_logic_1164.all;

entity FA is
  port( A, B, Cin : in std_logic;
    -----------------------------
    S, Cout : out std_logic);
end FA;

architecture behavior of FA is

  signal IN_FA : std_logic_vector( 2 downto 0 );      -- IN(2) = A; IN(1) = B; IN(0) = Cin;
  signal OUT_FA : std_logic_vector( 1 downto 0 );     -- OUT(1) = Cout; OUT(0) = S;

  begin

    -- A | B | Cin || Cout |  S
      --------------------------
    -- 0 | 0 |  0  ||   0  |  0
    -- 0 | 0 |  1  ||   0  |  1
    -- 0 | 1 |  0  ||   0  |  1
    -- 0 | 1 |  1  ||   1  |  0
    -- 1 | 0 |  0  ||   0  |  1
    -- 1 | 0 |  1  ||   1  |  0
    -- 1 | 1 |  0  ||   1  |  0
    -- 1 | 1 |  1  ||   1  |  1


    IN_FA <= A & B & Cin;


    OUT_FA <= "00" when IN_FA = "000" else
           "01" when IN_FA = "001" else
           "01" when IN_FA = "010" else
           "10" when IN_FA = "011" else
           "01" when IN_FA = "100" else
           "10" when IN_FA = "101" else
           "10" when IN_FA = "110" else
           "11" when IN_FA = "111";

    S <= OUT_FA(0);
    Cout <= OUT_FA(1);

end architecture;
