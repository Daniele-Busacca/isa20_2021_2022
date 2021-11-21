library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Reg is
  generic( n : positive );
  port( Resetn, Clock, Load : in std_logic;
    D : in signed( n-1 downto 0 );
    ---------------------------------------
    Q : out signed( n-1 downto 0 ));
end Reg;

architecture behavior of Reg is
begin
    
  process( Resetn, Clock )
  begin

    if Resetn = '0' then        -- Low Reset
        Q <= ( others => '0' );

    elsif Clock'event and Clock = '1' and Load = '1' then
        Q <= D;

    end if;
      
  end process;
    
end architecture;
