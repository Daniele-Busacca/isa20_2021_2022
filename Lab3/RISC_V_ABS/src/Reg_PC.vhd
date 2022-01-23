library ieee;
use ieee.std_logic_1164.all;

entity Reg_PC is
    port (
        CLK, RSTn, LD : in std_logic;
        D : in std_logic_vector( 31 downto 0 );
        ----------------------------------------
        Q : out std_logic_vector( 31 downto 0 )
    );
end Reg_PC;

architecture beh of Reg_PC is

    begin

        clock_process: process( RSTn, CLK )
        begin
            if RSTn = '0' then
                Q <= "00000000010000000000000000000000";
            elsif CLK'event and CLK = '1' and LD = '1' then
                Q <= D;
            end if;
        end process;

end architecture;