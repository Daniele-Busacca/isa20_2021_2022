library ieee;
use ieee.std_logic_1164.all;

entity HA is
  port( A, B : in std_logic;
    -------------------------
    S, Cout : out std_logic);
end HA;

architecture behavior of HA is

  signal IN_HA : std_logic_vector( 1 downto 0 );      -- IN(1) = A; IN(0) = B;
  signal OUT_HA : std_logic_vector( 1 downto 0 );     -- OUT(1) = Cout; OUT(0) = S;

  begin

    -- A | B || Cout |  S
      --------------------
    -- 0 | 0 ||   0  |  0
    -- 0 | 1 ||   0  |  1
    -- 1 | 0 ||   0  |  1
    -- 1 | 1 ||   1  |  0


    IN_HA <= A & B;


    OUT_HA <= "00" when IN_HA = "00" else
           "01" when IN_HA = "01" else
           "01" when IN_HA = "10" else
           "10" when IN_HA = "11";

    S <= OUT_HA(0);
    Cout <= OUT_HA(1);

end architecture;
