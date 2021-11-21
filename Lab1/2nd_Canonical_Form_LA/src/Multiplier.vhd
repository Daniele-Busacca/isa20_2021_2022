library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Multiplier is
  generic( n : positive );
  port( A, B : in signed( n-1 downto 0 );
    -------------------------------------
    Z : out signed( 2*n-1 downto 0 ));
end Multiplier;

architecture behavior of Multiplier is
  
  begin
    
    Z <= A * B;
    
end architecture;
