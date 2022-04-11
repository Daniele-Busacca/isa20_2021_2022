library ieee;
use ieee.std_logic_1164.all;

entity Stage_2 is 
	port (  
		Stage1_Col10 : in std_logic_vector( 0 to 6 );
		Stage1_Col11 : in std_logic_vector( 0 to 5 );
		Stage1_Col12 : in std_logic_vector( 0 to 7 );
		Stage1_Col13 : in std_logic_vector( 0 to 6 );
		Stage1_Col14 : in std_logic_vector( 0 to 8 );
		Stage1_Col15 : in std_logic_vector( 0 to 7 );
		Stage1_Col16 : in std_logic_vector( 0 to 8 );
		Stage1_Col17 : in std_logic_vector( 0 to 8 );
		Stage1_Col18 : in std_logic_vector( 0 to 8 );
		Stage1_Col19 : in std_logic_vector( 0 to 8 );
		Stage1_Col20 : in std_logic_vector( 0 to 8 );
		Stage1_Col21 : in std_logic_vector( 0 to 8 );
		Stage1_Col22 : in std_logic_vector( 0 to 8 );
		Stage1_Col23 : in std_logic_vector( 0 to 8 );
		Stage1_Col24 : in std_logic_vector( 0 to 8 );
		Stage1_Col25 : in std_logic_vector( 0 to 8 );
		Stage1_Col26 : in std_logic_vector( 0 to 8 );
		Stage1_Col27 : in std_logic_vector( 0 to 8 );
		Stage1_Col28 : in std_logic_vector( 0 to 8 );
		Stage1_Col29 : in std_logic_vector( 0 to 8 );
		Stage1_Col30 : in std_logic_vector( 0 to 8 );
		Stage1_Col31 : in std_logic_vector( 0 to 8 );
		Stage1_Col32 : in std_logic_vector( 0 to 8 );
		Stage1_Col33 : in std_logic_vector( 0 to 8 );
		Stage1_Col34 : in std_logic_vector( 0 to 8 );
		Stage1_Col35 : in std_logic_vector( 0 to 8 );
		Stage1_Col36 : in std_logic_vector( 0 to 7 );
		Stage1_Col37 : in std_logic_vector( 0 to 6 );
		Stage1_Col38 : in std_logic_vector( 0 to 6 );
		Stage1_Col39 : in std_logic_vector( 0 to 5 );
		Stage1_Col40 : in std_logic_vector( 0 to 5 );
		Stage1_Col41 : in std_logic_vector( 0 to 4 );
		----------------------------------------------
		Stage2_Col10 : out std_logic_vector( 0 to 5 );
		Stage2_Col11 : out std_logic_vector( 0 to 5 );
		Stage2_Col12 : out std_logic_vector( 0 to 5 );
		Stage2_Col13 : out std_logic_vector( 0 to 5 );
		Stage2_Col14 : out std_logic_vector( 0 to 5 );
		Stage2_Col15 : out std_logic_vector( 0 to 5 );
		Stage2_Col16 : out std_logic_vector( 0 to 5 );
		Stage2_Col17 : out std_logic_vector( 0 to 5 );
		Stage2_Col18 : out std_logic_vector( 0 to 5 );
		Stage2_Col19 : out std_logic_vector( 0 to 5 );
		Stage2_Col20 : out std_logic_vector( 0 to 5 );
		Stage2_Col21 : out std_logic_vector( 0 to 5 );
		Stage2_Col22 : out std_logic_vector( 0 to 5 );
		Stage2_Col23 : out std_logic_vector( 0 to 5 );
		Stage2_Col24 : out std_logic_vector( 0 to 5 );
		Stage2_Col25 : out std_logic_vector( 0 to 5 );
		Stage2_Col26 : out std_logic_vector( 0 to 5 );
		Stage2_Col27 : out std_logic_vector( 0 to 5 );
		Stage2_Col28 : out std_logic_vector( 0 to 5 );
		Stage2_Col29 : out std_logic_vector( 0 to 5 );
		Stage2_Col30 : out std_logic_vector( 0 to 5 );
		Stage2_Col31 : out std_logic_vector( 0 to 5 );
		Stage2_Col32 : out std_logic_vector( 0 to 5 );
		Stage2_Col33 : out std_logic_vector( 0 to 5 );
		Stage2_Col34 : out std_logic_vector( 0 to 5 );
		Stage2_Col35 : out std_logic_vector( 0 to 5 );
		Stage2_Col36 : out std_logic_vector( 0 to 5 );
		Stage2_Col37 : out std_logic_vector( 0 to 5 );
		Stage2_Col38 : out std_logic_vector( 0 to 5 );
		Stage2_Col39 : out std_logic_vector( 0 to 5 );
		Stage2_Col40 : out std_logic_vector( 0 to 5 );
		Stage2_Col41 : out std_logic_vector( 0 to 5 )
		);
end Stage_2;

architecture behavior of Stage_2 is

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
	

	begin
		

	HA_10 : HA port map (Stage1_Col10(0), Stage1_Col10(1), Stage2_Col10(0), Stage2_Col11(0));

	HA_11 : HA port map (Stage1_Col11(0), Stage1_Col11(1), Stage2_Col11(1), Stage2_Col12(0));

	FA_12 : FA port map (Stage1_Col12(0), Stage1_Col12(1), Stage1_Col12(2), Stage2_Col12(1), Stage2_Col13(0));
	HA_12 : HA port map (Stage1_Col12(3), Stage1_Col12(4), Stage2_Col12(2), Stage2_Col13(1));

    FA_13 : FA port map (Stage1_Col13(0), Stage1_Col13(1), Stage1_Col13(2), Stage2_Col13(2), Stage2_Col14(0));
	HA_13 : HA port map (Stage1_Col13(3), Stage1_Col13(4), Stage2_Col13(3), Stage2_Col14(1));
	
	FA1_14 : FA port map (Stage1_Col14(0), Stage1_Col14(1), Stage1_Col14(2), Stage2_Col14(2), Stage2_Col15(0));
	FA2_14 : FA port map (Stage1_Col14(3), Stage1_Col14(4), Stage1_Col14(5), Stage2_Col14(3), Stage2_Col15(1));
	HA_14  : HA port map (Stage1_Col14(6), Stage1_Col14(7), Stage2_Col14(4), Stage2_Col15(2));

	FA1_15 : FA port map (Stage1_Col15(0), Stage1_Col15(1), Stage1_Col15(2), Stage2_Col15(3), Stage2_Col16(0));
	FA2_15 : FA port map (Stage1_Col15(3), Stage1_Col15(4), Stage1_Col15(5), Stage2_Col15(4), Stage2_Col16(1));
	HA_15  : HA port map (Stage1_Col15(6), Stage1_Col15(7), Stage2_Col15(5), Stage2_Col16(2));

	Col16: for i in 0 to 2 generate
	    FA_16 : FA port map (Stage1_Col16(i*3), Stage1_Col16(i*3+1), Stage1_Col16(i*3+2), Stage2_Col16(i+3), Stage2_Col17(i));
	end generate;
	
	Col17: for i in 0 to 2 generate
	    FA_17 : FA port map (Stage1_Col17(i*3), Stage1_Col17(i*3+1), Stage1_Col17(i*3+2), Stage2_Col17(i+3), Stage2_Col18(i));
	end generate;

	Col18: for i in 0 to 2 generate
	    FA_18 : FA port map (Stage1_Col18(i*3), Stage1_Col18(i*3+1), Stage1_Col18(i*3+2), Stage2_Col18(i+3), Stage2_Col19(i));
	end generate;

	Col19: for i in 0 to 2 generate
	    FA_19 : FA port map (Stage1_Col19(i*3), Stage1_Col19(i*3+1), Stage1_Col19(i*3+2), Stage2_Col19(i+3), Stage2_Col20(i));
	end generate;

	Col20: for i in 0 to 2 generate
	    FA_20 : FA port map (Stage1_Col20(i*3), Stage1_Col20(i*3+1), Stage1_Col20(i*3+2), Stage2_Col20(i+3), Stage2_Col21(i));
	end generate;

	Col21: for i in 0 to 2 generate
	    FA_21 : FA port map (Stage1_Col21(i*3), Stage1_Col21(i*3+1), Stage1_Col21(i*3+2), Stage2_Col21(i+3), Stage2_Col22(i));
	end generate;

	Col22: for i in 0 to 2 generate
	    FA_22 : FA port map (Stage1_Col22(i*3), Stage1_Col22(i*3+1), Stage1_Col22(i*3+2), Stage2_Col22(i+3), Stage2_Col23(i));
	end generate;

	Col23: for i in 0 to 2 generate
	    FA_23 : FA port map (Stage1_Col23(i*3), Stage1_Col23(i*3+1), Stage1_Col23(i*3+2), Stage2_Col23(i+3), Stage2_Col24(i));
	end generate;

	Col24: for i in 0 to 2 generate
	    FA_24 : FA port map (Stage1_Col24(i*3), Stage1_Col24(i*3+1), Stage1_Col24(i*3+2), Stage2_Col24(i+3), Stage2_Col25(i));
	end generate;

	Col25: for i in 0 to 2 generate
	    FA_25 : FA port map (Stage1_Col25(i*3), Stage1_Col25(i*3+1), Stage1_Col25(i*3+2), Stage2_Col25(i+3), Stage2_Col26(i));
	end generate;

	Col26: for i in 0 to 2 generate
	    FA_26 : FA port map (Stage1_Col26(i*3), Stage1_Col26(i*3+1), Stage1_Col26(i*3+2), Stage2_Col26(i+3), Stage2_Col27(i));
	end generate;

	Col27: for i in 0 to 2 generate
	    FA_27 : FA port map (Stage1_Col27(i*3), Stage1_Col27(i*3+1), Stage1_Col27(i*3+2), Stage2_Col27(i+3), Stage2_Col28(i));
	end generate;

	Col28: for i in 0 to 2 generate
	    FA_28 : FA port map (Stage1_Col28(i*3), Stage1_Col28(i*3+1), Stage1_Col28(i*3+2), Stage2_Col28(i+3), Stage2_Col29(i));
	end generate;

	Col29: for i in 0 to 2 generate
	    FA_29 : FA port map (Stage1_Col29(i*3), Stage1_Col29(i*3+1), Stage1_Col29(i*3+2), Stage2_Col29(i+3), Stage2_Col30(i));
	end generate;

	Col30: for i in 0 to 2 generate
	    FA_30 : FA port map (Stage1_Col30(i*3), Stage1_Col30(i*3+1), Stage1_Col30(i*3+2), Stage2_Col30(i+3), Stage2_Col31(i));
	end generate;

	Col31: for i in 0 to 2 generate
	    FA_31 : FA port map (Stage1_Col31(i*3), Stage1_Col31(i*3+1), Stage1_Col31(i*3+2), Stage2_Col31(i+3), Stage2_Col32(i));
	end generate;

	Col32: for i in 0 to 2 generate
	    FA_32 : FA port map (Stage1_Col32(i*3), Stage1_Col32(i*3+1), Stage1_Col32(i*3+2), Stage2_Col32(i+3), Stage2_Col33(i));
	end generate;

	Col33: for i in 0 to 2 generate
	    FA_33 : FA port map (Stage1_Col33(i*3), Stage1_Col33(i*3+1), Stage1_Col33(i*3+2), Stage2_Col33(i+3), Stage2_Col34(i));
	end generate;

	Col34: for i in 0 to 2 generate
	    FA_34 : FA port map (Stage1_Col34(i*3), Stage1_Col34(i*3+1), Stage1_Col34(i*3+2), Stage2_Col34(i+3), Stage2_Col35(i));
	end generate;

	Col35: for i in 0 to 2 generate
	    FA_35 : FA port map (Stage1_Col35(i*3), Stage1_Col35(i*3+1), Stage1_Col35(i*3+2), Stage2_Col35(i+3), Stage2_Col36(i));
	end generate;

	Col36: for i in 0 to 1 generate
	    FA_36 : FA port map (Stage1_Col36(i*3), Stage1_Col36(i*3+1), Stage1_Col36(i*3+2), Stage2_Col36(i+3), Stage2_Col37(i));
	end generate;
	HA36 : HA port map (Stage1_Col36(6), Stage1_Col36(7), Stage2_Col36(5), Stage2_Col37(2));

	Col37: for i in 0 to 1 generate
	    FA_37 : FA port map (Stage1_Col37(i*3), Stage1_Col37(i*3+1), Stage1_Col37(i*3+2), Stage2_Col37(i+3), Stage2_Col38(i));
	end generate;

	FA_38 : FA port map (Stage1_Col38(0), Stage1_Col38(1), Stage1_Col38(2), Stage2_Col38(2), Stage2_Col39(0));
	HA_38 : HA port map (Stage1_Col38(3), Stage1_Col38(4), Stage2_Col38(3), Stage2_Col39(1));

	FA_39 : FA port map (Stage1_Col39(0), Stage1_Col39(1), Stage1_Col39(2), Stage2_Col39(2), Stage2_Col40(0));
	
    HA_40 : HA port map (Stage1_Col40(0), Stage1_Col40(1), Stage2_Col40(1), Stage2_Col41(0));

	-----------------------------------------------------------------------------------------------------------------------------

	Stage2_Col10(1 to 5) <= Stage1_Col10(2 to 6);
	Stage2_Col11(2 to 5) <= Stage1_Col11(2 to 5);
	Stage2_Col12(3 to 5) <= Stage1_Col12(5 to 7);
	Stage2_Col13(4 to 5) <= Stage1_Col13(5 to 6);
	Stage2_Col14(5) <= Stage1_Col14(8);

	Stage2_Col37(5) <= Stage1_Col37(6);
	Stage2_Col38(4 to 5) <= Stage1_Col38(5 to 6);
	Stage2_Col39(3 to 5) <= Stage1_Col39(3 to 5);
	Stage2_Col40(2 to 5) <= Stage1_Col40(2 to 5);
	Stage2_Col41(1 to 5) <= Stage1_Col41(0 to 4);


end architecture;