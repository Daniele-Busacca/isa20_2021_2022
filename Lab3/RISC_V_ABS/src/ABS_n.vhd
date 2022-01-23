library ieee;
use ieee.std_logic_1164.all;

entity ABS_n is
    generic ( n : positive );
    port (
        A : in std_logic_vector( n-1 downto 0 );
        ----------------------------------------
        Y : out std_logic_vector( n-1 downto 0 )
    );
end ABS_n;

architecture struct of ABS_n is

    component HA is
        port( 
            A, B : in std_logic;
            -----------------------
            S, Cout : out std_logic
        );
    end component;

    signal MSB : std_logic;                             -- MSB of input A
    signal A_xor : std_logic_vector( n-1 downto 0 );    -- output of the exor between input A and its LSB
    signal carry : std_logic_vector( n downto 0 );      -- carry signals which propagates in the HAs

    begin

        MSB <= A(n-1);
        carry(0) <= MSB;

        EXOR_GATES : for i in 0 to n-1 generate
            A_xor(i) <= A(i) xor MSB;
        end generate;

        GEN_HA : for i in 0 to n-1 generate
            HAs : HA port map( A_xor(i), carry(i), Y(i), carry(i+1) );
        end generate;

end architecture;