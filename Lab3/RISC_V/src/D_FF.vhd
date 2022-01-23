library ieee;
use ieee.std_logic_1164.all;

entity D_FF is
    port (
        CLK, RSTn, LD : in std_logic;
        D : in std_logic;
        -----------------------------
        Q : out std_logic
    );
end D_FF;

architecture beh of D_FF is

    begin

        clock_process: process( RSTn, CLK )
        begin
            if RSTn = '0' then
                Q <= '0';
            elsif CLK'event and CLK = '1' and LD = '1' then
                Q <= D;
            end if;
        end process;

end architecture;