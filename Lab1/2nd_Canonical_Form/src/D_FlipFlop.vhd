library ieee;
use ieee.std_logic_1164.all;

entity D_FlipFlop is
  port(D, Clock, Resetn, Load : in std_logic;
    -----------------------------------------
    Q : out std_logic);
end D_FlipFlop;

architecture structure of D_FlipFlop is
begin
      
  process( Resetn, Clock )
  begin
    if Resetn = '0' then
      Q <= '0';

    elsif Clock'event and Clock = '1' and Load = '1' then
      Q <= D;
            
    end if;
            
  end process;

end architecture;
