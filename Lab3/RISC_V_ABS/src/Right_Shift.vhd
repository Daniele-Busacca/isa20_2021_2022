library ieee;
use ieee.std_logic_1164.all;

entity Right_Shift is
    port (
        A : in std_logic_vector( 31 downto 0 );
        Shift : in std_logic_vector( 4 downto 0 );
        ------------------------------------------
        Y : out std_logic_vector( 31 downto 0 )
    );
end Right_Shift;

architecture struct of Right_Shift is

    component Mux32to1_n is
        generic( n : positive := 32 );
        port (
            IN_1  : in std_logic_vector( n-1 downto 0 );
            IN_2  : in std_logic_vector( n-1 downto 0 );
            IN_3  : in std_logic_vector( n-1 downto 0 );
            IN_4  : in std_logic_vector( n-1 downto 0 );
            IN_5  : in std_logic_vector( n-1 downto 0 );
            IN_6  : in std_logic_vector( n-1 downto 0 );
            IN_7  : in std_logic_vector( n-1 downto 0 );
            IN_8  : in std_logic_vector( n-1 downto 0 );
            IN_9  : in std_logic_vector( n-1 downto 0 );
            IN_10 : in std_logic_vector( n-1 downto 0 );
            IN_11 : in std_logic_vector( n-1 downto 0 );
            IN_12 : in std_logic_vector( n-1 downto 0 );
            IN_13 : in std_logic_vector( n-1 downto 0 );
            IN_14 : in std_logic_vector( n-1 downto 0 );
            IN_15 : in std_logic_vector( n-1 downto 0 );
            IN_16 : in std_logic_vector( n-1 downto 0 );
            IN_17 : in std_logic_vector( n-1 downto 0 );
            IN_18 : in std_logic_vector( n-1 downto 0 );
            IN_19 : in std_logic_vector( n-1 downto 0 );
            IN_20 : in std_logic_vector( n-1 downto 0 );
            IN_21 : in std_logic_vector( n-1 downto 0 );
            IN_22 : in std_logic_vector( n-1 downto 0 );
            IN_23 : in std_logic_vector( n-1 downto 0 );
            IN_24 : in std_logic_vector( n-1 downto 0 );
            IN_25 : in std_logic_vector( n-1 downto 0 );
            IN_26 : in std_logic_vector( n-1 downto 0 );
            IN_27 : in std_logic_vector( n-1 downto 0 );
            IN_28 : in std_logic_vector( n-1 downto 0 );
            IN_29 : in std_logic_vector( n-1 downto 0 );
            IN_30 : in std_logic_vector( n-1 downto 0 );
            IN_31 : in std_logic_vector( n-1 downto 0 );
            IN_32 : in std_logic_vector( n-1 downto 0 );
            Sel : in std_logic_vector( 4 downto 0 );
            --------------------------------------------
            Y : out std_logic_vector( n-1 downto 0 )
        );
    end component;

    signal MSBs : std_logic_vector( 0 to 31 );

    signal A_Shift_0  : std_logic_vector( 31 downto 0 );
    signal A_Shift_1  : std_logic_vector( 31 downto 0 );
    signal A_Shift_2  : std_logic_vector( 31 downto 0 );
    signal A_Shift_3  : std_logic_vector( 31 downto 0 );
    signal A_Shift_4  : std_logic_vector( 31 downto 0 );
    signal A_Shift_5  : std_logic_vector( 31 downto 0 );
    signal A_Shift_6  : std_logic_vector( 31 downto 0 );
    signal A_Shift_7  : std_logic_vector( 31 downto 0 );
    signal A_Shift_8  : std_logic_vector( 31 downto 0 );
    signal A_Shift_9  : std_logic_vector( 31 downto 0 );
    signal A_Shift_10 : std_logic_vector( 31 downto 0 );
    signal A_Shift_11 : std_logic_vector( 31 downto 0 );
    signal A_Shift_12 : std_logic_vector( 31 downto 0 );
    signal A_Shift_13 : std_logic_vector( 31 downto 0 );
    signal A_Shift_14 : std_logic_vector( 31 downto 0 );
    signal A_Shift_15 : std_logic_vector( 31 downto 0 );
    signal A_Shift_16 : std_logic_vector( 31 downto 0 );
    signal A_Shift_17 : std_logic_vector( 31 downto 0 );
    signal A_Shift_18 : std_logic_vector( 31 downto 0 );
    signal A_Shift_19 : std_logic_vector( 31 downto 0 );
    signal A_Shift_20 : std_logic_vector( 31 downto 0 );
    signal A_Shift_21 : std_logic_vector( 31 downto 0 );
    signal A_Shift_22 : std_logic_vector( 31 downto 0 );
    signal A_Shift_23 : std_logic_vector( 31 downto 0 );
    signal A_Shift_24 : std_logic_vector( 31 downto 0 );
    signal A_Shift_25 : std_logic_vector( 31 downto 0 );
    signal A_Shift_26 : std_logic_vector( 31 downto 0 );
    signal A_Shift_27 : std_logic_vector( 31 downto 0 );
    signal A_Shift_28 : std_logic_vector( 31 downto 0 );
    signal A_Shift_29 : std_logic_vector( 31 downto 0 );
    signal A_Shift_30 : std_logic_vector( 31 downto 0 );
    signal A_Shift_31 : std_logic_vector( 31 downto 0 );

    begin

        MSBS <= (others => A(31));

        A_Shift_0  <= A;
        A_Shift_1  <= MSBs(0)         & A(31 downto 1 );
        A_Shift_2  <= MSBs( 0 to 1 )  & A(31 downto 2 );
        A_Shift_3  <= MSBs( 0 to 2 )  & A(31 downto 3 );
        A_Shift_4  <= MSBs( 0 to 3 )  & A(31 downto 4 );
        A_Shift_5  <= MSBs( 0 to 4 )  & A(31 downto 5 );
        A_Shift_6  <= MSBs( 0 to 5 )  & A(31 downto 6 );
        A_Shift_7  <= MSBs( 0 to 6 )  & A(31 downto 7 );
        A_Shift_8  <= MSBs( 0 to 7 )  & A(31 downto 8 );
        A_Shift_9  <= MSBs( 0 to 8 )  & A(31 downto 9 );
        A_Shift_10 <= MSBs( 0 to 9 )  & A(31 downto 10 );
        A_Shift_11 <= MSBs( 0 to 10 ) & A(31 downto 11 );
        A_Shift_12 <= MSBs( 0 to 11 ) & A(31 downto 12 );
        A_Shift_13 <= MSBs( 0 to 12 ) & A(31 downto 13 );
        A_Shift_14 <= MSBs( 0 to 13 ) & A(31 downto 14 );
        A_Shift_15 <= MSBs( 0 to 14 ) & A(31 downto 15 );
        A_Shift_16 <= MSBs( 0 to 15 ) & A(31 downto 16 );
        A_Shift_17 <= MSBs( 0 to 16 ) & A(31 downto 17 );
        A_Shift_18 <= MSBs( 0 to 17 ) & A(31 downto 18 );
        A_Shift_19 <= MSBs( 0 to 18 ) & A(31 downto 19 );
        A_Shift_20 <= MSBs( 0 to 19 ) & A(31 downto 20 );
        A_Shift_21 <= MSBs( 0 to 20 ) & A(31 downto 21 );
        A_Shift_22 <= MSBs( 0 to 21 ) & A(31 downto 22 );
        A_Shift_23 <= MSBs( 0 to 22 ) & A(31 downto 23 );
        A_Shift_24 <= MSBs( 0 to 23 ) & A(31 downto 24 );
        A_Shift_25 <= MSBs( 0 to 24 ) & A(31 downto 25 );
        A_Shift_26 <= MSBs( 0 to 25 ) & A(31 downto 26 );
        A_Shift_27 <= MSBs( 0 to 26 ) & A(31 downto 27 );
        A_Shift_28 <= MSBs( 0 to 27 ) & A(31 downto 28 );
        A_Shift_29 <= MSBs( 0 to 28 ) & A(31 downto 29 );
        A_Shift_30 <= MSBs( 0 to 29 ) & A(31 downto 30 );
        A_Shift_31 <= MSBs( 0 to 30 ) & A(31);


        Mux_Out : Mux32to1_n port map(
            A_Shift_0,
            A_Shift_1,
            A_Shift_2,
            A_Shift_3,
            A_Shift_4,
            A_Shift_5,
            A_Shift_6,
            A_Shift_7,
            A_Shift_8,
            A_Shift_9,
            A_Shift_10,
            A_Shift_11,
            A_Shift_12,
            A_Shift_13,
            A_Shift_14,
            A_Shift_15,
            A_Shift_16,
            A_Shift_17,
            A_Shift_18,
            A_Shift_19,
            A_Shift_20,
            A_Shift_21,
            A_Shift_22,
            A_Shift_23,
            A_Shift_24,
            A_Shift_25,
            A_Shift_26,
            A_Shift_27,
            A_Shift_28,
            A_Shift_29,
            A_Shift_30,
            A_Shift_31,
            Shift,
            -----------
            Y
        );
        
end architecture;