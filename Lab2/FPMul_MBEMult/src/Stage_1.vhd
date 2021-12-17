library ieee;
use ieee.std_logic_1164.all;

entity Stage_1 is
  port( 
	PP_Col16 : in std_logic_vector ( 0 to 9);
    PP_Col17 : in std_logic_vector ( 0 to 8);
    PP_Col18 : in std_logic_vector ( 0 to 10);
    PP_Col19 : in std_logic_vector ( 0 to 9);
    PP_Col20 : in std_logic_vector ( 0 to 11);
    PP_Col21 : in std_logic_vector ( 0 to 10);
    PP_Col22 : in std_logic_vector ( 0 to 12);
    PP_Col23 : in std_logic_vector ( 0 to 11);
    PP_Col24 : in std_logic_vector ( 0 to 12);
    PP_Col25 : in std_logic_vector ( 0 to 12);
    PP_Col26 : in std_logic_vector ( 0 to 12);
    PP_Col27 : in std_logic_vector ( 0 to 12);
    PP_Col28 : in std_logic_vector ( 0 to 11);
    PP_Col29 : in std_logic_vector ( 0 to 10);
    PP_Col30 : in std_logic_vector ( 0 to 10);
    PP_Col31 : in std_logic_vector ( 0 to 9);
    PP_Col32 : in std_logic_vector ( 0 to 9);
    PP_Col33 : in std_logic_vector ( 0 to 8);
    PP_Col34 : in std_logic_vector ( 0 to 8);
    PP_Col35 : in std_logic_vector ( 0 to 7);
	----------------------------------------------
	Stage1_Col16 : out std_logic_vector( 0 to 8 );
	Stage1_Col17 : out std_logic_vector( 0 to 8 );
	Stage1_Col18 : out std_logic_vector( 0 to 8 );
	Stage1_Col19 : out std_logic_vector( 0 to 8 );
	Stage1_Col20 : out std_logic_vector( 0 to 8 );
	Stage1_Col21 : out std_logic_vector( 0 to 8 );
	Stage1_Col22 : out std_logic_vector( 0 to 8 );
	Stage1_Col23 : out std_logic_vector( 0 to 8 );
	Stage1_Col24 : out std_logic_vector( 0 to 8 );
	Stage1_Col25 : out std_logic_vector( 0 to 8 );
	Stage1_Col26 : out std_logic_vector( 0 to 8 );
	Stage1_Col27 : out std_logic_vector( 0 to 8 );
	Stage1_Col28 : out std_logic_vector( 0 to 8 );
	Stage1_Col29 : out std_logic_vector( 0 to 8 );
	Stage1_Col30 : out std_logic_vector( 0 to 8 );
	Stage1_Col31 : out std_logic_vector( 0 to 8 );
	Stage1_Col32 : out std_logic_vector( 0 to 8 );
	Stage1_Col33 : out std_logic_vector( 0 to 8 );
	Stage1_Col34 : out std_logic_vector( 0 to 8 );
	Stage1_Col35 : out std_logic_vector( 0 to 8 )
    );
end Stage_1;

architecture structure of Stage_1 is

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

	-- HAs and FAs instantation 
	HA_16: HA port map (PP_Col16(0), PP_Col16(1), Stage1_Col16(0), Stage1_Col17(0));

	HA_17: HA port map (PP_Col17(0), PP_Col17(1), Stage1_Col17(1), Stage1_Col18(0));

	FA_18: FA port map (PP_Col18(0), PP_Col18(1), PP_Col18(2), Stage1_Col18(1), Stage1_Col19(0));
	HA_18: HA port map (PP_Col18(3), PP_Col18(4), Stage1_Col18(2), Stage1_Col19(1));

	FA_19: FA port map (PP_Col19(0), PP_Col19(1), PP_Col19(2), Stage1_Col19(2), Stage1_Col20(0));
	HA_19: HA port map (PP_Col19(3), PP_Col19(4), Stage1_Col19(3), Stage1_Col20(1));

	Col20: for i in 0 to 1 generate
		FA_20 : FA port map (PP_Col20(i*3), PP_Col20(i*3+1), PP_Col20(i*3+2), Stage1_Col20(i+2),  Stage1_Col21(i));
	end generate;
	HA_20: HA port map (PP_Col20(6),PP_Col20(7), Stage1_Col20(4), Stage1_Col21(2));

	Col21: for i in 0 to 1 generate
		FA_21 : FA port map (PP_Col21(i*3), PP_Col21(i*3+1), PP_Col21(i*3+2), Stage1_Col21(i+3),  Stage1_Col22(i));
	end generate;
	HA_21: HA port map (PP_Col21(6),PP_Col21(7), Stage1_Col21(5), Stage1_Col22(2));

	Col22: for i in 0 to 2 generate
		FA_22 : FA port map (PP_Col22(i*3), PP_Col22(i*3+1), PP_Col22(i*3+2), Stage1_Col22(i+3),  Stage1_Col23(i));
	end generate;
	HA_22: HA port map (PP_Col22(9),PP_Col22(10), Stage1_Col22(6), Stage1_Col23(3));

	Col23: for i in 0 to 2 generate
	        FA_23 : FA port map (PP_Col23(i*3), PP_Col23(i*3+1), PP_Col23(i*3+2), Stage1_Col23(i+4),  Stage1_Col24(i));
	end generate;
	HA_23: HA port map (PP_Col23(9),PP_Col23(10), Stage1_Col23(7), Stage1_Col24(3));

	Col24: for i in 0 to 3 generate
        	FA_24 : FA port map (PP_Col24(i*3), PP_Col24(i*3+1), PP_Col24(i*3+2), Stage1_Col24(i+4),  Stage1_Col25(i));
	end generate;
	
	Col25: for i in 0 to 3 generate
        	FA_25 : FA port map (PP_Col25(i*3), PP_Col25(i*3+1), PP_Col25(i*3+2), Stage1_Col25(i+4),  Stage1_Col26(i));
	end generate;
	
	Col26: for i in 0 to 3 generate
        	FA_26 : FA port map (PP_Col26(i*3), PP_Col26(i*3+1), PP_Col26(i*3+2), Stage1_Col26(i+4),  Stage1_Col27(i));
	end generate;
	
	Col27: for i in 0 to 3 generate
        	FA_27 : FA port map (PP_Col27(i*3), PP_Col27(i*3+1), PP_Col27(i*3+2), Stage1_Col27(i+4),  Stage1_Col28(i));
	end generate;

	Col28: for i in 0 to 2 generate
	        FA_28 : FA port map (PP_Col28(i*3), PP_Col28(i*3+1), PP_Col28(i*3+2), Stage1_Col28(i+4),  Stage1_Col29(i));
	end generate;
	HA_28: HA port map (PP_Col28(9),PP_Col28(10), Stage1_Col28(7), Stage1_Col29(3));

	Col29: for i in 0 to 2 generate
	        FA_29 : FA port map (PP_Col29(i*3), PP_Col29(i*3+1), PP_Col29(i*3+2), Stage1_Col29(i+4),  Stage1_Col30(i));
	end generate;

	Col30: for i in 0 to 1 generate
	        FA_30 : FA port map (PP_Col30(i*3), PP_Col30(i*3+1), PP_Col30(i*3+2), Stage1_Col30(i+3),  Stage1_Col31(i));
	end generate;
	HA_30: HA port map (PP_Col30(6),PP_Col30(7), Stage1_Col30(5), Stage1_Col31(2));

	Col31: for i in 0 to 1 generate
	        FA_31 : FA port map (PP_Col31(i*3), PP_Col31(i*3+1), PP_Col31(i*3+2), Stage1_Col31(i+3),  Stage1_Col32(i));
	end generate;

	FA_32: FA port map (PP_Col32(0), PP_Col32(1), PP_Col32(2), Stage1_Col32(2), Stage1_Col33(0));
	HA_32: HA port map (PP_Col32(3), PP_Col32(4), Stage1_Col32(3), Stage1_Col33(1));

	FA_33: FA port map (PP_Col33(0), PP_Col33(1), PP_Col33(2), Stage1_Col33(2), Stage1_Col34(0));

	HA_34: HA port map (PP_Col34(0), PP_Col34(1), Stage1_Col34(1), Stage1_Col35(0));

	--------------------------------------------------------------------------------------------------------------------

	Stage1_Col16(1 to 8) <= PP_Col16(2 to 9);
    Stage1_Col17(2 to 8) <= PP_Col17(2 to 8);
    Stage1_Col18(3 to 8) <= PP_Col18(5 to 10);
    Stage1_Col19(4 to 8) <= PP_Col19(5 to 9);
    Stage1_Col20(5 to 8) <= PP_Col20(8 to 11);
    Stage1_Col21(6 to 8) <= PP_Col21(8 to 10);
    Stage1_Col22(7 to 8) <= PP_Col22(11 to 12);
    Stage1_Col23(8) <= PP_Col23(11);
    Stage1_Col24(8) <= PP_Col24(12);
    Stage1_Col25(8) <= PP_Col25(12);
    Stage1_Col26(8) <= PP_Col26(12);
    Stage1_Col27(8) <= PP_Col27(12);
    Stage1_Col28(8) <= PP_Col28(11);
    Stage1_Col29(7 to 8) <= PP_Col29(9 to 10);
    Stage1_Col30(6 to 8) <= PP_Col30(8 to 10);
    Stage1_Col31(5 to 8) <= PP_Col31(6 to 9);
    Stage1_Col32(4 to 8) <= PP_Col32(5 to 9);
    Stage1_Col33(3 to 8) <= PP_Col33(3 to 8);
    Stage1_Col34(2 to 8) <= PP_Col34(2 to 8);
    Stage1_Col35(1 to 8) <= PP_Col35(0 to 7);

end architecture;
