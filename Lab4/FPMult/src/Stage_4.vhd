library ieee;
use ieee.std_logic_1164.all;

entity Stage_4 is
    port (
        S4_IN_Col4  : in std_logic_vector(0 to 3);
        S4_IN_Col5  : in std_logic_vector(0 to 2);
        S4_IN_Col6  : in std_logic_vector(0 to 3);
        S4_IN_Col7  : in std_logic_vector(0 to 3);
        S4_IN_Col8  : in std_logic_vector(0 to 3);
        S4_IN_Col9  : in std_logic_vector(0 to 3);
        S4_IN_Col10 : in std_logic_vector(0 to 3);
        S4_IN_Col11 : in std_logic_vector(0 to 3);
        S4_IN_Col12 : in std_logic_vector(0 to 3);
        S4_IN_Col13 : in std_logic_vector(0 to 3);
        S4_IN_Col14 : in std_logic_vector(0 to 3);
        S4_IN_Col15 : in std_logic_vector(0 to 3);
        S4_IN_Col16 : in std_logic_vector(0 to 3);
        S4_IN_Col17 : in std_logic_vector(0 to 3);
        S4_IN_Col18 : in std_logic_vector(0 to 3);
        S4_IN_Col19 : in std_logic_vector(0 to 3);
        S4_IN_Col20 : in std_logic_vector(0 to 3);
        S4_IN_Col21 : in std_logic_vector(0 to 3);
        S4_IN_Col22 : in std_logic_vector(0 to 3);
        S4_IN_Col23 : in std_logic_vector(0 to 3);
        S4_IN_Col24 : in std_logic_vector(0 to 3);
        S4_IN_Col25 : in std_logic_vector(0 to 3);
        S4_IN_Col26 : in std_logic_vector(0 to 3);
        S4_IN_Col27 : in std_logic_vector(0 to 3);
        S4_IN_Col28 : in std_logic_vector(0 to 3);
        S4_IN_Col29 : in std_logic_vector(0 to 3);
        S4_IN_Col30 : in std_logic_vector(0 to 3);
        S4_IN_Col31 : in std_logic_vector(0 to 3);
        S4_IN_Col32 : in std_logic_vector(0 to 3);
        S4_IN_Col33 : in std_logic_vector(0 to 3);
        S4_IN_Col34 : in std_logic_vector(0 to 3);
        S4_IN_Col35 : in std_logic_vector(0 to 3);
        S4_IN_Col36 : in std_logic_vector(0 to 3);
        S4_IN_Col37 : in std_logic_vector(0 to 3);
        S4_IN_Col38 : in std_logic_vector(0 to 3);
        S4_IN_Col39 : in std_logic_vector(0 to 3);
        S4_IN_Col40 : in std_logic_vector(0 to 3);
        S4_IN_Col41 : in std_logic_vector(0 to 3);
        S4_IN_Col42 : in std_logic_vector(0 to 3);
        S4_IN_Col43 : in std_logic_vector(0 to 3);
        S4_IN_Col44 : in std_logic_vector(0 to 3);
        S4_IN_Col45 : in std_logic_vector(0 to 3);
        S4_IN_Col46 : in std_logic_vector(0 to 2);
        S4_IN_Col47 : in std_logic_vector(0 to 1);
        --------------------------------------------
        S4_OUT_Col4  : out std_logic_vector(0 to 2);
        S4_OUT_Col5  : out std_logic_vector(0 to 2);
        S4_OUT_Col6  : out std_logic_vector(0 to 2);
        S4_OUT_Col7  : out std_logic_vector(0 to 2);
        S4_OUT_Col8  : out std_logic_vector(0 to 2);
        S4_OUT_Col9  : out std_logic_vector(0 to 2);
        S4_OUT_Col10 : out std_logic_vector(0 to 2);
        S4_OUT_Col11 : out std_logic_vector(0 to 2);
        S4_OUT_Col12 : out std_logic_vector(0 to 2);
        S4_OUT_Col13 : out std_logic_vector(0 to 2);
        S4_OUT_Col14 : out std_logic_vector(0 to 2);
        S4_OUT_Col15 : out std_logic_vector(0 to 2);
        S4_OUT_Col16 : out std_logic_vector(0 to 2);
        S4_OUT_Col17 : out std_logic_vector(0 to 2);
        S4_OUT_Col18 : out std_logic_vector(0 to 2);
        S4_OUT_Col19 : out std_logic_vector(0 to 2);
        S4_OUT_Col20 : out std_logic_vector(0 to 2);
        S4_OUT_Col21 : out std_logic_vector(0 to 2);
        S4_OUT_Col22 : out std_logic_vector(0 to 2);
        S4_OUT_Col23 : out std_logic_vector(0 to 2);
        S4_OUT_Col24 : out std_logic_vector(0 to 2);
        S4_OUT_Col25 : out std_logic_vector(0 to 2);
        S4_OUT_Col26 : out std_logic_vector(0 to 2);
        S4_OUT_Col27 : out std_logic_vector(0 to 2);
        S4_OUT_Col28 : out std_logic_vector(0 to 2);
        S4_OUT_Col29 : out std_logic_vector(0 to 2);
        S4_OUT_Col30 : out std_logic_vector(0 to 2);
        S4_OUT_Col31 : out std_logic_vector(0 to 2);
        S4_OUT_Col32 : out std_logic_vector(0 to 2);
        S4_OUT_Col33 : out std_logic_vector(0 to 2);
        S4_OUT_Col34 : out std_logic_vector(0 to 2);
        S4_OUT_Col35 : out std_logic_vector(0 to 2);
        S4_OUT_Col36 : out std_logic_vector(0 to 2);
        S4_OUT_Col37 : out std_logic_vector(0 to 2);
        S4_OUT_Col38 : out std_logic_vector(0 to 2);
        S4_OUT_Col39 : out std_logic_vector(0 to 2);
        S4_OUT_Col40 : out std_logic_vector(0 to 2);
        S4_OUT_Col41 : out std_logic_vector(0 to 2);
        S4_OUT_Col42 : out std_logic_vector(0 to 2);
        S4_OUT_Col43 : out std_logic_vector(0 to 2);
        S4_OUT_Col44 : out std_logic_vector(0 to 2);
        S4_OUT_Col45 : out std_logic_vector(0 to 2);
        S4_OUT_Col46 : out std_logic_vector(0 to 2);
        S4_OUT_Col47 : out std_logic_vector(0 to 2)
    );
end Stage_4;

architecture structure of Stage_4 is

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

        -- ALL THE FAs AND HAs IN THE FOURTH STAGE

        HA_4  : HA port map( S4_IN_Col4(0),  S4_IN_Col4(1),  S4_OUT_Col4(0),  S4_OUT_Col5(1) );                      -- Col 4
        HA_5  : HA port map( S4_IN_Col5(0),  S4_IN_Col5(1),  S4_OUT_Col5(0),  S4_OUT_Col6(1) );                      -- Col 5

        FA_6  : FA port map( S4_IN_Col6(0),  S4_IN_Col6(1),  S4_IN_Col6(2),  S4_OUT_Col6(0),  S4_OUT_Col7(1) );      -- Col 6
        FA_7  : FA port map( S4_IN_Col7(0),  S4_IN_Col7(1),  S4_IN_Col7(2),  S4_OUT_Col7(0),  S4_OUT_Col8(1) );      -- Col 7
        FA_8  : FA port map( S4_IN_Col8(0),  S4_IN_Col8(1),  S4_IN_Col8(2),  S4_OUT_Col8(0),  S4_OUT_Col9(1) );      -- Col 8
        FA_9  : FA port map( S4_IN_Col9(0),  S4_IN_Col9(1),  S4_IN_Col9(2),  S4_OUT_Col9(0),  S4_OUT_Col10(1) );     -- Col 9
        FA_10 : FA port map( S4_IN_Col10(0), S4_IN_Col10(1), S4_IN_Col10(2), S4_OUT_Col10(0), S4_OUT_Col11(1) );     -- Col 10
        FA_11 : FA port map( S4_IN_Col11(0), S4_IN_Col11(1), S4_IN_Col11(2), S4_OUT_Col11(0), S4_OUT_Col12(1) );     -- Col 11
        FA_12 : FA port map( S4_IN_Col12(0), S4_IN_Col12(1), S4_IN_Col12(2), S4_OUT_Col12(0), S4_OUT_Col13(1) );     -- Col 12
        FA_13 : FA port map( S4_IN_Col13(0), S4_IN_Col13(1), S4_IN_Col13(2), S4_OUT_Col13(0), S4_OUT_Col14(1) );     -- Col 13
        FA_14 : FA port map( S4_IN_Col14(0), S4_IN_Col14(1), S4_IN_Col14(2), S4_OUT_Col14(0), S4_OUT_Col15(1) );     -- Col 14
        FA_15 : FA port map( S4_IN_Col15(0), S4_IN_Col15(1), S4_IN_Col15(2), S4_OUT_Col15(0), S4_OUT_Col16(1) );     -- Col 15
        FA_16 : FA port map( S4_IN_Col16(0), S4_IN_Col16(1), S4_IN_Col16(2), S4_OUT_Col16(0), S4_OUT_Col17(1) );     -- Col 16
        FA_17 : FA port map( S4_IN_Col17(0), S4_IN_Col17(1), S4_IN_Col17(2), S4_OUT_Col17(0), S4_OUT_Col18(1) );     -- Col 17
        FA_18 : FA port map( S4_IN_Col18(0), S4_IN_Col18(1), S4_IN_Col18(2), S4_OUT_Col18(0), S4_OUT_Col19(1) );     -- Col 18
        FA_19 : FA port map( S4_IN_Col19(0), S4_IN_Col19(1), S4_IN_Col19(2), S4_OUT_Col19(0), S4_OUT_Col20(1) );     -- Col 19
        FA_20 : FA port map( S4_IN_Col20(0), S4_IN_Col20(1), S4_IN_Col20(2), S4_OUT_Col20(0), S4_OUT_Col21(1) );     -- Col 20
        FA_21 : FA port map( S4_IN_Col21(0), S4_IN_Col21(1), S4_IN_Col21(2), S4_OUT_Col21(0), S4_OUT_Col22(1) );     -- Col 21
        FA_22 : FA port map( S4_IN_Col22(0), S4_IN_Col22(1), S4_IN_Col22(2), S4_OUT_Col22(0), S4_OUT_Col23(1) );     -- Col 22
        FA_23 : FA port map( S4_IN_Col23(0), S4_IN_Col23(1), S4_IN_Col23(2), S4_OUT_Col23(0), S4_OUT_Col24(1) );     -- Col 23
        FA_24 : FA port map( S4_IN_Col24(0), S4_IN_Col24(1), S4_IN_Col24(2), S4_OUT_Col24(0), S4_OUT_Col25(1) );     -- Col 24
        FA_25 : FA port map( S4_IN_Col25(0), S4_IN_Col25(1), S4_IN_Col25(2), S4_OUT_Col25(0), S4_OUT_Col26(1) );     -- Col 25
        FA_26 : FA port map( S4_IN_Col26(0), S4_IN_Col26(1), S4_IN_Col26(2), S4_OUT_Col26(0), S4_OUT_Col27(1) );     -- Col 26
        FA_27 : FA port map( S4_IN_Col27(0), S4_IN_Col27(1), S4_IN_Col27(2), S4_OUT_Col27(0), S4_OUT_Col28(1) );     -- Col 27
        FA_28 : FA port map( S4_IN_Col28(0), S4_IN_Col28(1), S4_IN_Col28(2), S4_OUT_Col28(0), S4_OUT_Col29(1) );     -- Col 28
        FA_29 : FA port map( S4_IN_Col29(0), S4_IN_Col29(1), S4_IN_Col29(2), S4_OUT_Col29(0), S4_OUT_Col30(1) );     -- Col 29
        FA_30 : FA port map( S4_IN_Col30(0), S4_IN_Col30(1), S4_IN_Col30(2), S4_OUT_Col30(0), S4_OUT_Col31(1) );     -- Col 30
        FA_31 : FA port map( S4_IN_Col31(0), S4_IN_Col31(1), S4_IN_Col31(2), S4_OUT_Col31(0), S4_OUT_Col32(1) );     -- Col 31
        FA_32 : FA port map( S4_IN_Col32(0), S4_IN_Col32(1), S4_IN_Col32(2), S4_OUT_Col32(0), S4_OUT_Col33(1) );     -- Col 32
        FA_33 : FA port map( S4_IN_Col33(0), S4_IN_Col33(1), S4_IN_Col33(2), S4_OUT_Col33(0), S4_OUT_Col34(1) );     -- Col 33
        FA_34 : FA port map( S4_IN_Col34(0), S4_IN_Col34(1), S4_IN_Col34(2), S4_OUT_Col34(0), S4_OUT_Col35(1) );     -- Col 34
        FA_35 : FA port map( S4_IN_Col35(0), S4_IN_Col35(1), S4_IN_Col35(2), S4_OUT_Col35(0), S4_OUT_Col36(1) );     -- Col 35
        FA_36 : FA port map( S4_IN_Col36(0), S4_IN_Col36(1), S4_IN_Col36(2), S4_OUT_Col36(0), S4_OUT_Col37(1) );     -- Col 36
        FA_37 : FA port map( S4_IN_Col37(0), S4_IN_Col37(1), S4_IN_Col37(2), S4_OUT_Col37(0), S4_OUT_Col38(1) );     -- Col 37
        FA_38 : FA port map( S4_IN_Col38(0), S4_IN_Col38(1), S4_IN_Col38(2), S4_OUT_Col38(0), S4_OUT_Col39(1) );     -- Col 38
        FA_39 : FA port map( S4_IN_Col39(0), S4_IN_Col39(1), S4_IN_Col39(2), S4_OUT_Col39(0), S4_OUT_Col40(1) );     -- Col 39
        FA_40 : FA port map( S4_IN_Col40(0), S4_IN_Col40(1), S4_IN_Col40(2), S4_OUT_Col40(0), S4_OUT_Col41(1) );     -- Col 40
        FA_41 : FA port map( S4_IN_Col41(0), S4_IN_Col41(1), S4_IN_Col41(2), S4_OUT_Col41(0), S4_OUT_Col42(1) );     -- Col 41
        FA_42 : FA port map( S4_IN_Col42(0), S4_IN_Col42(1), S4_IN_Col42(2), S4_OUT_Col42(0), S4_OUT_Col43(1) );     -- Col 42
        FA_43 : FA port map( S4_IN_Col43(0), S4_IN_Col43(1), S4_IN_Col43(2), S4_OUT_Col43(0), S4_OUT_Col44(1) );     -- Col 43
        FA_44 : FA port map( S4_IN_Col44(0), S4_IN_Col44(1), S4_IN_Col44(2), S4_OUT_Col44(0), S4_OUT_Col45(1) );     -- Col 44
        FA_45 : FA port map( S4_IN_Col45(0), S4_IN_Col45(1), S4_IN_Col45(2), S4_OUT_Col45(0), S4_OUT_Col46(1) );     -- Col 45

        HA_46 : HA port map( S4_IN_Col46(0), S4_IN_Col46(1), S4_OUT_Col46(0), S4_OUT_Col47(0) );                     -- Col 46


        -- SOME SIGNALS FROM THE COLUMN 4 TO 47 ARE NOT USED -> THEY'RE PROPAGATED IN THE FIFTH STAGE
        
        S4_OUT_Col4(1 to 2) <= S4_IN_Col4(2 to 3);
        S4_OUT_Col5(2) <= S4_IN_Col5(2);

        S4_OUT_Col6(2) <= S4_IN_Col6(3);
        S4_OUT_Col7(2) <= S4_IN_Col7(3);  
        S4_OUT_Col8(2) <= S4_IN_Col8(3);  
        S4_OUT_Col9(2) <= S4_IN_Col9(3);  
        S4_OUT_Col10(2) <= S4_IN_Col10(3);
        S4_OUT_Col11(2) <= S4_IN_Col11(3);
        S4_OUT_Col12(2) <= S4_IN_Col12(3);
        S4_OUT_Col13(2) <= S4_IN_Col13(3);
        S4_OUT_Col14(2) <= S4_IN_Col14(3);
        S4_OUT_Col15(2) <= S4_IN_Col15(3);
        S4_OUT_Col16(2) <= S4_IN_Col16(3);
        S4_OUT_Col17(2) <= S4_IN_Col17(3);
        S4_OUT_Col18(2) <= S4_IN_Col18(3);
        S4_OUT_Col19(2) <= S4_IN_Col19(3);
        S4_OUT_Col20(2) <= S4_IN_Col20(3);
        S4_OUT_Col21(2) <= S4_IN_Col21(3);
        S4_OUT_Col22(2) <= S4_IN_Col22(3);
        S4_OUT_Col23(2) <= S4_IN_Col23(3);
        S4_OUT_Col24(2) <= S4_IN_Col24(3);
        S4_OUT_Col25(2) <= S4_IN_Col25(3);
        S4_OUT_Col26(2) <= S4_IN_Col26(3);
        S4_OUT_Col27(2) <= S4_IN_Col27(3);
        S4_OUT_Col28(2) <= S4_IN_Col28(3);
        S4_OUT_Col29(2) <= S4_IN_Col29(3);
        S4_OUT_Col30(2) <= S4_IN_Col30(3);
        S4_OUT_Col31(2) <= S4_IN_Col31(3);
        S4_OUT_Col32(2) <= S4_IN_Col32(3);
        S4_OUT_Col33(2) <= S4_IN_Col33(3);
        S4_OUT_Col34(2) <= S4_IN_Col34(3);
        S4_OUT_Col35(2) <= S4_IN_Col35(3);
        S4_OUT_Col36(2) <= S4_IN_Col36(3);
        S4_OUT_Col37(2) <= S4_IN_Col37(3);
        S4_OUT_Col38(2) <= S4_IN_Col38(3);
        S4_OUT_Col39(2) <= S4_IN_Col39(3);
        S4_OUT_Col40(2) <= S4_IN_Col40(3);
        S4_OUT_Col41(2) <= S4_IN_Col41(3);
        S4_OUT_Col42(2) <= S4_IN_Col42(3);
        S4_OUT_Col43(2) <= S4_IN_Col43(3);
        S4_OUT_Col44(2) <= S4_IN_Col44(3);
        S4_OUT_Col45(2) <= S4_IN_Col45(3);

        S4_OUT_Col46(2) <= S4_IN_Col46(2);
        S4_OUT_Col47(1 to 2) <= S4_IN_Col47(0 to 1);

end architecture;