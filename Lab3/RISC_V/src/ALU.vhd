library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
    port (
        A, B : in std_logic_vector( 31 downto 0 );
        Shift : in std_logic_vector( 4 downto 0 );
        Sel_ALU : in std_logic_vector( 2 downto 0 );
        --------------------------------------------
        Zero : out std_logic;
        Z : out  std_logic_vector( 31 downto 0 )
    );
end ALU;

architecture struct of ALU is

    component Adder_n is
        generic ( n : positive := 32 );
        port (
            A, B : in std_logic_vector( n-1 downto 0 );
            -------------------------------------------
            Z : out std_logic_vector( n-1 downto 0 )
        );
    end component;

    component AND_n is
        generic ( n : positive := 32 );
        port (
            A, B : in std_logic_vector( n-1 downto 0 );
            -------------------------------------------
            Y : out std_logic_vector( n-1 downto 0 )
        );
    end component;

    component XOR_n is
        generic ( n : positive := 32 );
        port (
            A, B : in std_logic_vector( n-1 downto 0 );
            -------------------------------------------
            Y : out std_logic_vector( n-1 downto 0 )
        );
    end component;

    component Right_Shift is
        port (
            A : in std_logic_vector( 31 downto 0 );
            Shift : in std_logic_vector( 4 downto 0 );
            ------------------------------------------
            Y : out std_logic_vector( 31 downto 0 )
        );
    end component;

    component Comparator_n is
        generic ( n : positive := 32 );
        port (
            A, B : in std_logic_vector( n-1 downto 0 );
            -------------------------------------------
            Y : out std_logic_vector( n-1 downto 0 )
        );
    end component;

    component Equal_Detector_n is
        generic ( n : positive := 32 );
        port (
            A, B : in std_logic_vector( n-1 downto 0 );
            -------------------------------------------
            Y : out std_logic
        );
    end component;

    component Mux6to1_n is
        generic ( n : positive := 32 );
        port (
            A, B, C, D, E, F : in std_logic_vector( n-1 downto 0 );
            Sel : in std_logic_vector( 2 downto 0 );
            -------------------------------------------------------
            Y : out std_logic_vector( n-1 downto 0 )
        );
    end component;


    signal Z_Adder, Z_AND, Z_XOR, Z_RShift, Z_Comp : std_logic_vector( 31 downto 0 );    -- components outputs


    begin

        ADDER: Adder_n port map( A, B, Z_Adder );

        Bitwise_AND : AND_n port map( A, B, Z_AND );

        Bitwise_XOR : XOR_n port map( A, B, Z_XOR );

        R_Shifter : Right_Shift port map( A, Shift, Z_RShift );

        Comp : Comparator_n port map( A, B, Z_Comp );

        Eq_Detect : Equal_Detector_n port map( A, B, Zero );

        Mux6to1 : Mux6to1_n port map( Z_Adder, Z_AND, Z_XOR, Z_RShift, Z_Comp, B, Sel_ALU, Z );

end architecture;