library ieee;
use ieee.std_logic_1164.all;

entity Stage_Mux is
  port ( 
    A : in std_logic_vector( 24 downto 0 );
    A2 : in std_logic_vector( 24 downto 0 );
    Sel : in std_logic_vector( 38 downto 0 );
    -------------------------------------------
    PP_Col0  : out std_logic_vector ( 0 to 1);
    PP_Col1  : out std_logic;
    PP_Col2  : out std_logic_vector ( 0 to 2);
    PP_Col3  : out std_logic_vector ( 0 to 1);
    PP_Col4  : out std_logic_vector ( 0 to 3);
    PP_Col5  : out std_logic_vector ( 0 to 2);
    PP_Col6  : out std_logic_vector ( 0 to 4);
    PP_Col7  : out std_logic_vector ( 0 to 3);
    PP_Col8  : out std_logic_vector ( 0 to 5);
    PP_Col9  : out std_logic_vector ( 0 to 4);
    PP_Col10 : out std_logic_vector ( 0 to 6);
    PP_Col11 : out std_logic_vector ( 0 to 5);
    PP_Col12 : out std_logic_vector ( 0 to 7);
    PP_Col13 : out std_logic_vector ( 0 to 6);
    PP_Col14 : out std_logic_vector ( 0 to 8);
    PP_Col15 : out std_logic_vector ( 0 to 7);
    PP_Col16 : out std_logic_vector ( 0 to 9);
    PP_Col17 : out std_logic_vector ( 0 to 8);
    PP_Col18 : out std_logic_vector ( 0 to 10);
    PP_Col19 : out std_logic_vector ( 0 to 9);
    PP_Col20 : out std_logic_vector ( 0 to 11);
    PP_Col21 : out std_logic_vector ( 0 to 10);
    PP_Col22 : out std_logic_vector ( 0 to 12);
    PP_Col23 : out std_logic_vector ( 0 to 11);
    PP_Col24 : out std_logic_vector ( 0 to 12);
    PP_Col25 : out std_logic_vector ( 0 to 12);
    PP_Col26 : out std_logic_vector ( 0 to 12);
    PP_Col27 : out std_logic_vector ( 0 to 12);
    PP_Col28 : out std_logic_vector ( 0 to 11);
    PP_Col29 : out std_logic_vector ( 0 to 10);
    PP_Col30 : out std_logic_vector ( 0 to 10);
    PP_Col31 : out std_logic_vector ( 0 to 9);
    PP_Col32 : out std_logic_vector ( 0 to 9);
    PP_Col33 : out std_logic_vector ( 0 to 8);
    PP_Col34 : out std_logic_vector ( 0 to 8);
    PP_Col35 : out std_logic_vector ( 0 to 7);
    PP_Col36 : out std_logic_vector ( 0 to 7);
    PP_Col37 : out std_logic_vector ( 0 to 6);
    PP_Col38 : out std_logic_vector ( 0 to 6);
    PP_Col39 : out std_logic_vector ( 0 to 5);
    PP_Col40 : out std_logic_vector ( 0 to 5);
    PP_Col41 : out std_logic_vector ( 0 to 4);
    PP_Col42 : out std_logic_vector ( 0 to 4);
    PP_Col43 : out std_logic_vector ( 0 to 3);
    PP_Col44 : out std_logic_vector ( 0 to 3);
    PP_Col45 : out std_logic_vector ( 0 to 2);
    PP_Col46 : out std_logic_vector ( 0 to 2); 
    PP_Col47 : out std_logic_vector ( 0 to 1)
    ); 
end Stage_Mux;

architecture structure of Stage_Mux is

  component Mux8to1 is
    generic( n : positive := 25 );
    port( A, B, C, D, E, F, G, H : in std_logic_vector( n-1 downto 0 );
      Sel : in std_logic_vector( 2 downto 0 );
      -----------------------------------------------------------------
      Z : out std_logic_vector( n-1 downto 0 ));
  end component;

    
  type PP is array (0 to 12) of std_logic_vector(24 downto 0);

  signal PP_Mux : PP;							                                      -- Partial Products: 13 signals composed by 24 bits
  signal A_Inv, A2_Inv : std_logic_vector( 24 downto 0 );
  signal Zeros : std_logic_vector( 24 downto 0 ) := ( others => '0'); 	-- zeros input of all Mux4to1
  signal Ones : std_logic_vector( 24 downto 0 ) := ( others => '1' );

  signal PP0, PP1, PP2, PP3, PP4, PP5, PP6, PP7, PP8, PP9, PP10, PP11: std_logic_vector( 24 downto 0 ); -- partial products
  signal PP12 : std_logic_vector( 23 downto 0 );

  begin

    A_Inv <= not(A);
    A2_Inv <= not(A2);

    -- All the muxes select 0, A, 2A, A# or 2A# according to the bits X(2j+1), X(2j) and X(2j-1)
    GEN_MUX : for i in 0 to 12 generate
      Mux : Mux8to1 port map( Zeros, A, A, A2, A2_Inv, A_Inv, A_Inv, Ones, Sel(3*i+2 downto 3*i), PP_Mux(i) );
    end generate;

    -- Divide all outputs
    PP0 <= PP_Mux(0);
    PP1 <= PP_Mux(1);
    PP2 <= PP_Mux(2);
    PP3 <= PP_Mux(3);
    PP4 <= PP_Mux(4);
    PP5 <= PP_Mux(5);
    PP6 <= PP_Mux(6);
    PP7 <= PP_Mux(7);
    PP8 <= PP_Mux(8);
    PP9 <= PP_Mux(9);
    PP10 <= PP_Mux(10);
    PP11 <= PP_Mux(11);

    -- Last ouput of muxes is actually a 23-bits signal, because the last partial product is 0 or A (always positive)
    PP12 <= PP_Mux(12)(23 downto 0);


    -- Create 64 columns
	PP_Col0  <= PP0(0)       & Sel(2);
	PP_Col1  <= PP0(1);
	PP_Col2  <= PP0(2)       & PP1(0)      & Sel(5);
	PP_Col3  <= PP0(3)       & PP1(1);
	PP_Col4  <= PP0(4)       & PP1(2)      & PP2(0)   & Sel(8);
	PP_Col5  <= PP0(5)       & PP1(3)      & PP2(1);
	PP_Col6  <= PP0(6)       & PP1(4)      & PP2(2)   & PP3(0)   & Sel(11);
	PP_Col7  <= PP0(7)       & PP1(5)      & PP2(3)   & PP3(1);
	PP_Col8  <= PP0(8)       & PP1(6)      & PP2(4)   & PP3(2)   & PP4(0)   & Sel(14);
	PP_Col9  <= PP0(9)       & PP1(7)      & PP2(5)   & PP3(3)   & PP4(1);  
	PP_Col10 <= PP0(10)      & PP1(8)      & PP2(6)   & PP3(4)   & PP4(2)   & PP5(0)   & Sel(17);
	PP_Col11 <= PP0(11)      & PP1(9)      & PP2(7)   & PP3(5)   & PP4(3)   & PP5(1);
	PP_Col12 <= PP0(12)      & PP1(10)     & PP2(8)   & PP3(6)   & PP4(4)   & PP5(2)   & PP6(0)   & Sel(20);
	PP_Col13 <= PP0(13)      & PP1(11)     & PP2(9)   & PP3(7)   & PP4(5)   & PP5(3)   & PP6(1);
	PP_Col14 <= PP0(14)      & PP1(12)     & PP2(10)  & PP3(8)   & PP4(6)   & PP5(4)   & PP6(2)   & PP7(0)   & Sel(23);
  PP_Col15 <= PP0(15)      & PP1(13)     & PP2(11)  & PP3(9)   & PP4(7)   & PP5(5)   & PP6(3)   & PP7(1);
	PP_Col16 <= PP0(16)      & PP1(14)     & PP2(12)  & PP3(10)  & PP4(8)   & PP5(6)   & PP6(4)   & PP7(2)   & PP8(0)   & Sel(26);
	PP_Col17 <= PP0(17)      & PP1(15)     & PP2(13)  & PP3(11)  & PP4(9)   & PP5(7)   & PP6(5)   & PP7(3)   & PP8(1);
	PP_Col18 <= PP0(18)      & PP1(16)     & PP2(14)  & PP3(12)  & PP4(10)  & PP5(8)   & PP6(6)   & PP7(4)   & PP8(2)   & PP9(0)  & Sel(29);
	PP_Col19 <= PP0(19)      & PP1(17)     & PP2(15)  & PP3(13)  & PP4(11)  & PP5(9)   & PP6(7)   & PP7(5)   & PP8(3)   & PP9(1);
	PP_Col20 <= PP0(20)      & PP1(18)     & PP2(16)  & PP3(14)  & PP4(12)  & PP5(10)  & PP6(8)   & PP7(6)   & PP8(4)   & PP9(2)  & PP10(0) & Sel(32);
	PP_Col21 <= PP0(21)      & PP1(19)     & PP2(17)  & PP3(15)  & PP4(13)  & PP5(11)  & PP6(9)   & PP7(7)   & PP8(5)   & PP9(3)  & PP10(1);
	PP_Col22 <= PP0(22)      & PP1(20)     & PP2(18)  & PP3(16)  & PP4(14)  & PP5(12)  & PP6(10)  & PP7(8)   & PP8(6)   & PP9(4)  & PP10(2) & PP11(0) & Sel(35);
	PP_Col23 <= PP0(23)      & PP1(21)     & PP2(19)  & PP3(17)  & PP4(15)  & PP5(13)  & PP6(11)  & PP7(9)   & PP8(7)   & PP9(5)  & PP10(3) & PP11(1);
	PP_Col24 <= PP0(24)      & PP1(22)     & PP2(20)  & PP3(18)  & PP4(16)  & PP5(14)  & PP6(12)  & PP7(10)  & PP8(8)   & PP9(6)  & PP10(4) & PP11(2) & PP12(0);
	PP_Col25 <= Sel(2)       & PP1(23)     & PP2(21)  & PP3(19)  & PP4(17)  & PP5(15)  & PP6(13)  & PP7(11)  & PP8(9)   & PP9(7)  & PP10(5) & PP11(3) & PP12(1);
	PP_Col26 <= Sel(2)       & PP1(24)     & PP2(22)  & PP3(20)  & PP4(18)  & PP5(16)  & PP6(14)  & PP7(12)  & PP8(10)  & PP9(8)  & PP10(6) & PP11(4) & PP12(2);
	PP_Col27 <= not(Sel(2))  & not(Sel(5)) & PP2(23)  & PP3(21)  & PP4(19)  & PP5(17)  & PP6(15)  & PP7(13)  & PP8(11)  & PP9(9)  & PP10(7) & PP11(5) & PP12(3);
	PP_Col28 <= '1'          & PP2(24)     & PP3(22)  & PP4(20)  & PP5(18)  & PP6(16)  & PP7(14)  & PP8(12)  & PP9(10)  & PP10(8) & PP11(6) & PP12(4);
	PP_Col29 <= not(Sel(8))  & PP3(23)     & PP4(21)  & PP5(19)  & PP6(17)  & PP7(15)  & PP8(13)  & PP9(11)  & PP10(9)  & PP11(7) & PP12(5);
	PP_Col30 <= '1'          & PP3(24)     & PP4(22)  & PP5(20)  & PP6(18)  & PP7(16)  & PP8(14)  & PP9(12)  & PP10(10) & PP11(8) & PP12(6);
	PP_Col31 <= not(Sel(11)) & PP4(23)     & PP5(21)  & PP6(19)  & PP7(17)  & PP8(15)  & PP9(13)  & PP10(11) & PP11(9)  & PP12(7);
	PP_Col32 <= '1'          & PP4(24)     & PP5(22)  & PP6(20)  & PP7(18)  & PP8(16)  & PP9(14)  & PP10(12) & PP11(10) & PP12(8);
	PP_Col33 <= not(Sel(14)) & PP5(23)     & PP6(21)  & PP7(19)  & PP8(17)  & PP9(15)  & PP10(13) & PP11(11) & PP12(9);
	PP_Col34 <= '1'          & PP5(24)     & PP6(22)  & PP7(20)  & PP8(18)  & PP9(16)  & PP10(14) & PP11(12) & PP12(10);
	PP_Col35 <= not(Sel(17)) & PP6(23)     & PP7(21)  & PP8(19)  & PP9(17)  & PP10(15) & PP11(13) & PP12(11);
	PP_Col36 <= '1'          & PP6(24)     & PP7(22)  & PP8(20)  & PP9(18)  & PP10(16) & PP11(14) & PP12(12);
	PP_Col37 <= not(Sel(20)) & PP7(23)     & PP8(21)  & PP9(19)  & PP10(17) & PP11(15) & PP12(13);
	PP_Col38 <= '1'          & PP7(24)     & PP8(22)  & PP9(20)  & PP10(18) & PP11(16) & PP12(14);
	PP_Col39 <= not(Sel(23)) & PP8(23)     & PP9(21)  & PP10(19) & PP11(17) & PP12(15);
	PP_Col40 <= '1'          & PP8(24)     & PP9(22)  & PP10(20) & PP11(18) & PP12(16);
	PP_Col41 <= not(Sel(26)) & PP9(23)     & PP10(21) & PP11(19) & PP12(17);
	PP_Col42 <= '1'          & PP9(24)     & PP10(22) & PP11(20) & PP12(18);
	PP_Col43 <= not(Sel(29)) & PP10(23)    & PP11(21) & PP12(19);
	PP_Col44 <= '1'          & PP10(24)    & PP11(22) & PP12(20);
	PP_Col45 <= not(Sel(32)) & PP11(23)    & PP12(21);
	PP_Col46 <= '1'          & PP11(24)    & PP12(22);
	PP_Col47 <= not(Sel(35)) & PP12(23);

end architecture;