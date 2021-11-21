library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Adder is
  generic( n : positive );
  port( A, B : in signed( n-1 downto 0 );
    -------------------------------------
    Z : out signed( n-1 downto 0 ));
end Adder;

architecture behavior of Adder is

  begin

    Z <= A + B;
    
end architecture;