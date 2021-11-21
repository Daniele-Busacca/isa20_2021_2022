library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Subtractor is
  generic( n : positive );
  port( A, B : in signed( n-1 downto 0 );
    -------------------------------------
    Z : out signed( n-1 downto 0 ));
end Subtractor;

architecture behavior of Subtractor is

  begin

	Z <= -A-B;
    
end architecture;
