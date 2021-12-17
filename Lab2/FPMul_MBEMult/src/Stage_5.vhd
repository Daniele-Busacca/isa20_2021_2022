library ieee;
use ieee.std_logic_1164.all;

entity Stage_5 is
	port ( 
		Stage4_Col0  : in std_logic_vector( 0 to 1 );
		Stage4_Col1  : in std_logic;
		Stage4_Col2  : in std_logic_vector( 0 to 2 );
		Stage4_Col3  : in std_logic_vector( 0 to 1 );
		Stage4_Col4  : in std_logic_vector( 0 to 2 );
		Stage4_Col5  : in std_logic_vector( 0 to 2 );
		Stage4_Col6  : in std_logic_vector( 0 to 2 );
		Stage4_Col7  : in std_logic_vector( 0 to 2 );
		Stage4_Col8  : in std_logic_vector( 0 to 2 );
		Stage4_Col9  : in std_logic_vector( 0 to 2 );
		Stage4_Col10 : in std_logic_vector( 0 to 2 );
		Stage4_Col11 : in std_logic_vector( 0 to 2 );
		Stage4_Col12 : in std_logic_vector( 0 to 2 );
		Stage4_Col13 : in std_logic_vector( 0 to 2 );
		Stage4_Col14 : in std_logic_vector( 0 to 2 );
		Stage4_Col15 : in std_logic_vector( 0 to 2 );
		Stage4_Col16 : in std_logic_vector( 0 to 2 );
		Stage4_Col17 : in std_logic_vector( 0 to 2 );
		Stage4_Col18 : in std_logic_vector( 0 to 2 );
		Stage4_Col19 : in std_logic_vector( 0 to 2 );
		Stage4_Col20 : in std_logic_vector( 0 to 2 );
		Stage4_Col21 : in std_logic_vector( 0 to 2 );
		Stage4_Col22 : in std_logic_vector( 0 to 2 );
		Stage4_Col23 : in std_logic_vector( 0 to 2 );
		Stage4_Col24 : in std_logic_vector( 0 to 2 );
		Stage4_Col25 : in std_logic_vector( 0 to 2 );
		Stage4_Col26 : in std_logic_vector( 0 to 2 );
		Stage4_Col27 : in std_logic_vector( 0 to 2 );
		Stage4_Col28 : in std_logic_vector( 0 to 2 );
		Stage4_Col29 : in std_logic_vector( 0 to 2 );
		Stage4_Col30 : in std_logic_vector( 0 to 2 );
		Stage4_Col31 : in std_logic_vector( 0 to 2 );
		Stage4_Col32 : in std_logic_vector( 0 to 2 );
		Stage4_Col33 : in std_logic_vector( 0 to 2 );
		Stage4_Col34 : in std_logic_vector( 0 to 2 );
		Stage4_Col35 : in std_logic_vector( 0 to 2 );
		Stage4_Col36 : in std_logic_vector( 0 to 2 );
		Stage4_Col37 : in std_logic_vector( 0 to 2 );
		Stage4_Col38 : in std_logic_vector( 0 to 2 );
		Stage4_Col39 : in std_logic_vector( 0 to 2 );
		Stage4_Col40 : in std_logic_vector( 0 to 2 );
		Stage4_Col41 : in std_logic_vector( 0 to 2 );
		Stage4_Col42 : in std_logic_vector( 0 to 2 );
		Stage4_Col43 : in std_logic_vector( 0 to 2 );
		Stage4_Col44 : in std_logic_vector( 0 to 2 );
		Stage4_Col45 : in std_logic_vector( 0 to 2 );
		Stage4_Col46 : in std_logic_vector( 0 to 2 );
		Stage4_Col47 : in std_logic_vector( 0 to 2 );
		-----------------------------------------------
		Stage5_Row1: out std_logic_vector(47 downto 0);
		Stage5_Row2: out std_logic_vector(47 downto 0)
		);
end Stage_5;

architecture structure of Stage_5 is

    component HA is
        port( A, B : in std_logic;
        --------------------------
        S, Cout : out std_logic);
    end component;


    component FA is
        port( A, B, Cin : in std_logic;
        -------------------------------
        S, Cout : out std_logic);
	end component;
	
	
	signal Dummy_Cout: std_logic;


	begin

		Stage5_Row1(0) <= Stage4_Col0(0);
		Stage5_Row2(0) <= Stage4_Col0(1);
	
		Stage5_Row1(1) <= Stage4_Col1;
		Stage5_Row2(1) <= '0';
		
		Stage5_Row2(2) <= Stage4_Col2(2);
		

		HA_2: HA port map (Stage4_Col2(0), Stage4_Col2(1), Stage5_Row1(2), Stage5_Row2(3));																			
		HA_3: HA port map (Stage4_Col3(0), Stage4_Col3(1), Stage5_Row1(3), Stage5_Row2(4));

		FA_4:  FA port map (Stage4_Col4(0),  Stage4_Col4(1),  Stage4_Col4(2),  Stage5_Row1(4),  Stage5_Row2(5));
		FA_5:  FA port map (Stage4_Col5(0),  Stage4_Col5(1),  Stage4_Col5(2),  Stage5_Row1(5),  Stage5_Row2(6));
		FA_6:  FA port map (Stage4_Col6(0),  Stage4_Col6(1),  Stage4_Col6(2),  Stage5_Row1(6),  Stage5_Row2(7));
		FA_7:  FA port map (Stage4_Col7(0),  Stage4_Col7(1),  Stage4_Col7(2),  Stage5_Row1(7),  Stage5_Row2(8));
		FA_8:  FA port map (Stage4_Col8(0),  Stage4_Col8(1),  Stage4_Col8(2),  Stage5_Row1(8),  Stage5_Row2(9));
		FA_9:  FA port map (Stage4_Col9(0),  Stage4_Col9(1),  Stage4_Col9(2),  Stage5_Row1(9),  Stage5_Row2(10));
		FA_10: FA port map (Stage4_Col10(0), Stage4_Col10(1), Stage4_Col10(2), Stage5_Row1(10), Stage5_Row2(11));
		FA_11: FA port map (Stage4_Col11(0), Stage4_Col11(1), Stage4_Col11(2), Stage5_Row1(11), Stage5_Row2(12));
		FA_12: FA port map (Stage4_Col12(0), Stage4_Col12(1), Stage4_Col12(2), Stage5_Row1(12), Stage5_Row2(13));
		FA_13: FA port map (Stage4_Col13(0), Stage4_Col13(1), Stage4_Col13(2), Stage5_Row1(13), Stage5_Row2(14));
		FA_14: FA port map (Stage4_Col14(0), Stage4_Col14(1), Stage4_Col14(2), Stage5_Row1(14), Stage5_Row2(15));
		FA_15: FA port map (Stage4_Col15(0), Stage4_Col15(1), Stage4_Col15(2), Stage5_Row1(15), Stage5_Row2(16));
		FA_16: FA port map (Stage4_Col16(0), Stage4_Col16(1), Stage4_Col16(2), Stage5_Row1(16), Stage5_Row2(17));
		FA_17: FA port map (Stage4_Col17(0), Stage4_Col17(1), Stage4_Col17(2), Stage5_Row1(17), Stage5_Row2(18));
		FA_18: FA port map (Stage4_Col18(0), Stage4_Col18(1), Stage4_Col18(2), Stage5_Row1(18), Stage5_Row2(19));
		FA_19: FA port map (Stage4_Col19(0), Stage4_Col19(1), Stage4_Col19(2), Stage5_Row1(19), Stage5_Row2(20));
		FA_20: FA port map (Stage4_Col20(0), Stage4_Col20(1), Stage4_Col20(2), Stage5_Row1(20), Stage5_Row2(21));
		FA_21: FA port map (Stage4_Col21(0), Stage4_Col21(1), Stage4_Col21(2), Stage5_Row1(21), Stage5_Row2(22));														
		FA_22: FA port map (Stage4_Col22(0), Stage4_Col22(1), Stage4_Col22(2), Stage5_Row1(22), Stage5_Row2(23));
		FA_23: FA port map (Stage4_Col23(0), Stage4_Col23(1), Stage4_Col23(2), Stage5_Row1(23), Stage5_Row2(24));
		FA_24: FA port map (Stage4_Col24(0), Stage4_Col24(1), Stage4_Col24(2), Stage5_Row1(24), Stage5_Row2(25));
		FA_25: FA port map (Stage4_Col25(0), Stage4_Col25(1), Stage4_Col25(2), Stage5_Row1(25), Stage5_Row2(26));
		FA_26: FA port map (Stage4_Col26(0), Stage4_Col26(1), Stage4_Col26(2), Stage5_Row1(26), Stage5_Row2(27));
		FA_27: FA port map (Stage4_Col27(0), Stage4_Col27(1), Stage4_Col27(2), Stage5_Row1(27), Stage5_Row2(28));
		FA_28: FA port map (Stage4_Col28(0), Stage4_Col28(1), Stage4_Col28(2), Stage5_Row1(28), Stage5_Row2(29));
		FA_29: FA port map (Stage4_Col29(0), Stage4_Col29(1), Stage4_Col29(2), Stage5_Row1(29), Stage5_Row2(30));
		FA_30: FA port map (Stage4_Col30(0), Stage4_Col30(1), Stage4_Col30(2), Stage5_Row1(30), Stage5_Row2(31));
		FA_31: FA port map (Stage4_Col31(0), Stage4_Col31(1), Stage4_Col31(2), Stage5_Row1(31), Stage5_Row2(32));
		FA_32: FA port map (Stage4_Col32(0), Stage4_Col32(1), Stage4_Col32(2), Stage5_Row1(32), Stage5_Row2(33));
		FA_33: FA port map (Stage4_Col33(0), Stage4_Col33(1), Stage4_Col33(2), Stage5_Row1(33), Stage5_Row2(34));
		FA_34: FA port map (Stage4_Col34(0), Stage4_Col34(1), Stage4_Col34(2), Stage5_Row1(34), Stage5_Row2(35));
		FA_35: FA port map (Stage4_Col35(0), Stage4_Col35(1), Stage4_Col35(2), Stage5_Row1(35), Stage5_Row2(36));
		FA_36: FA port map (Stage4_Col36(0), Stage4_Col36(1), Stage4_Col36(2), Stage5_Row1(36), Stage5_Row2(37));
		FA_37: FA port map (Stage4_Col37(0), Stage4_Col37(1), Stage4_Col37(2), Stage5_Row1(37), Stage5_Row2(38));
		FA_38: FA port map (Stage4_Col38(0), Stage4_Col38(1), Stage4_Col38(2), Stage5_Row1(38), Stage5_Row2(39));
		FA_39: FA port map (Stage4_Col39(0), Stage4_Col39(1), Stage4_Col39(2), Stage5_Row1(39), Stage5_Row2(40));
		FA_40: FA port map (Stage4_Col40(0), Stage4_Col40(1), Stage4_Col40(2), Stage5_Row1(40), Stage5_Row2(41));
		FA_41: FA port map (Stage4_Col41(0), Stage4_Col41(1), Stage4_Col41(2), Stage5_Row1(41), Stage5_Row2(42));
		FA_42: FA port map (Stage4_Col42(0), Stage4_Col42(1), Stage4_Col42(2), Stage5_Row1(42), Stage5_Row2(43));
		FA_43: FA port map (Stage4_Col43(0), Stage4_Col43(1), Stage4_Col43(2), Stage5_Row1(43), Stage5_Row2(44));
		FA_44: FA port map (Stage4_Col44(0), Stage4_Col44(1), Stage4_Col44(2), Stage5_Row1(44), Stage5_Row2(45));
		FA_45: FA port map (Stage4_Col45(0), Stage4_Col45(1), Stage4_Col45(2), Stage5_Row1(45), Stage5_Row2(46));
		FA_46: FA port map (Stage4_Col46(0), Stage4_Col46(1), Stage4_Col46(2), Stage5_Row1(46), Stage5_Row2(47));		
		FA_47: FA port map (Stage4_Col47(0), Stage4_Col47(1), Stage4_Col47(2), Stage5_Row1(47), Dummy_Cout);
           
end architecture;