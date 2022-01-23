library ieee;
use ieee.std_logic_1164.all;

entity Reg_n is
    generic( n : positive );
    port (
        CLK, RSTn, LD : in std_logic;
        D : in std_logic_vector( n-1 downto 0 );
        ----------------------------------------
        Q : out std_logic_vector( n-1 downto 0 )
    );
end Reg_n;

architecture beh of Reg_n is

    begin

        clock_process: process( RSTn, CLK )
        begin
            if RSTn = '0' then
                Q <= (others => '0');
            elsif CLK'event and CLK = '1' and LD = '1' then
                Q <= D;
            end if;
        end process;

end architecture;