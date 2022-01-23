library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Comparator_n is
    generic ( n : positive );
    port (
        A, B : in std_logic_vector( n-1 downto 0 );
        -------------------------------------------
        Y : out std_logic_vector( n-1 downto 0 )
    );
end Comparator_n;

architecture struct of Comparator_n is

    component Mux4to1_OB is
        port (
            A, B, C, D : in std_logic;
            Sel : in std_logic_vector( 1 downto 0 );
            ----------------------------------------
            Y : out std_logic
        );
    end component;

    signal Z : std_logic_vector( n-1 downto 0 );                            -- subtractor output
    signal Sel : std_logic_vector( 1 downto 0 );                            -- selection signal of Mux4to1_OB
    signal Z_MSB : std_logic;                                               -- MSB of Z
    signal Mux_Out : std_logic;                                             -- Mux4to1_OB output
    signal Zeros : std_logic_vector( n-2 downto 0 ) := (others => '0');     -- n-1 zeros

    begin

        -- SUBTRACTOR
        Z <= std_logic_vector( signed(A) - signed(B) );

        -- MUX4TO1
        Sel <= A(n-1) & B(n-1);
        Z_MSB <= Z(n-1);
        Mux : Mux4to1_OB port map( Z_MSB, '0', '1', Z_MSB, Sel, Mux_Out );

        -- FILL THE MSBs OF THE OUTPUT WITH ZEROS
        Y <= Zeros & Mux_Out;

end architecture;