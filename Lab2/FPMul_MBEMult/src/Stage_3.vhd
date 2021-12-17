library ieee;
use ieee.std_logic_1164.all;

entity Stage_3 is
    port (
        S3_IN_Col6  : in std_logic_vector(0 to 4);
        S3_IN_Col7  : in std_logic_vector(0 to 3);
        S3_IN_Col8  : in std_logic_vector(0 to 5);
        S3_IN_Col9  : in std_logic_vector(0 to 4);
        S3_IN_Col10 : in std_logic_vector(0 to 5);
        S3_IN_Col11 : in std_logic_vector(0 to 5);
        S3_IN_Col12 : in std_logic_vector(0 to 5);
        S3_IN_Col13 : in std_logic_vector(0 to 5);
        S3_IN_Col14 : in std_logic_vector(0 to 5);
        S3_IN_Col15 : in std_logic_vector(0 to 5);
        S3_IN_Col16 : in std_logic_vector(0 to 5);
        S3_IN_Col17 : in std_logic_vector(0 to 5);
        S3_IN_Col18 : in std_logic_vector(0 to 5);
        S3_IN_Col19 : in std_logic_vector(0 to 5);
        S3_IN_Col20 : in std_logic_vector(0 to 5);
        S3_IN_Col21 : in std_logic_vector(0 to 5);
        S3_IN_Col22 : in std_logic_vector(0 to 5);
        S3_IN_Col23 : in std_logic_vector(0 to 5);
        S3_IN_Col24 : in std_logic_vector(0 to 5);
        S3_IN_Col25 : in std_logic_vector(0 to 5);
        S3_IN_Col26 : in std_logic_vector(0 to 5);
        S3_IN_Col27 : in std_logic_vector(0 to 5);
        S3_IN_Col28 : in std_logic_vector(0 to 5);
        S3_IN_Col29 : in std_logic_vector(0 to 5);
        S3_IN_Col30 : in std_logic_vector(0 to 5);
        S3_IN_Col31 : in std_logic_vector(0 to 5);
        S3_IN_Col32 : in std_logic_vector(0 to 5);
        S3_IN_Col33 : in std_logic_vector(0 to 5);
        S3_IN_Col34 : in std_logic_vector(0 to 5);
        S3_IN_Col35 : in std_logic_vector(0 to 5);
        S3_IN_Col36 : in std_logic_vector(0 to 5);
        S3_IN_Col37 : in std_logic_vector(0 to 5);
        S3_IN_Col38 : in std_logic_vector(0 to 5);
        S3_IN_Col39 : in std_logic_vector(0 to 5);
        S3_IN_Col40 : in std_logic_vector(0 to 5);
        S3_IN_Col41 : in std_logic_vector(0 to 5);
        S3_IN_Col42 : in std_logic_vector(0 to 4);
        S3_IN_Col43 : in std_logic_vector(0 to 3);
        S3_IN_Col44 : in std_logic_vector(0 to 3);
        S3_IN_Col45 : in std_logic_vector(0 to 2);
        --------------------------------------------
        S3_OUT_Col6  : out std_logic_vector(0 to 3);
        S3_OUT_Col7  : out std_logic_vector(0 to 3);
        S3_OUT_Col8  : out std_logic_vector(0 to 3);
        S3_OUT_Col9  : out std_logic_vector(0 to 3);
        S3_OUT_Col10 : out std_logic_vector(0 to 3);
        S3_OUT_Col11 : out std_logic_vector(0 to 3);
        S3_OUT_Col12 : out std_logic_vector(0 to 3);
        S3_OUT_Col13 : out std_logic_vector(0 to 3);
        S3_OUT_Col14 : out std_logic_vector(0 to 3);
        S3_OUT_Col15 : out std_logic_vector(0 to 3);
        S3_OUT_Col16 : out std_logic_vector(0 to 3);
        S3_OUT_Col17 : out std_logic_vector(0 to 3);
        S3_OUT_Col18 : out std_logic_vector(0 to 3);
        S3_OUT_Col19 : out std_logic_vector(0 to 3);
        S3_OUT_Col20 : out std_logic_vector(0 to 3);
        S3_OUT_Col21 : out std_logic_vector(0 to 3);
        S3_OUT_Col22 : out std_logic_vector(0 to 3);
        S3_OUT_Col23 : out std_logic_vector(0 to 3);
        S3_OUT_Col24 : out std_logic_vector(0 to 3);
        S3_OUT_Col25 : out std_logic_vector(0 to 3);
        S3_OUT_Col26 : out std_logic_vector(0 to 3);
        S3_OUT_Col27 : out std_logic_vector(0 to 3);
        S3_OUT_Col28 : out std_logic_vector(0 to 3);
        S3_OUT_Col29 : out std_logic_vector(0 to 3);
        S3_OUT_Col30 : out std_logic_vector(0 to 3);
        S3_OUT_Col31 : out std_logic_vector(0 to 3);
        S3_OUT_Col32 : out std_logic_vector(0 to 3);
        S3_OUT_Col33 : out std_logic_vector(0 to 3);
        S3_OUT_Col34 : out std_logic_vector(0 to 3);
        S3_OUT_Col35 : out std_logic_vector(0 to 3);
        S3_OUT_Col36 : out std_logic_vector(0 to 3);
        S3_OUT_Col37 : out std_logic_vector(0 to 3);
        S3_OUT_Col38 : out std_logic_vector(0 to 3);
        S3_OUT_Col39 : out std_logic_vector(0 to 3);
        S3_OUT_Col40 : out std_logic_vector(0 to 3);
        S3_OUT_Col41 : out std_logic_vector(0 to 3);
        S3_OUT_Col42 : out std_logic_vector(0 to 3);
        S3_OUT_Col43 : out std_logic_vector(0 to 3);
        S3_OUT_Col44 : out std_logic_vector(0 to 3);
        S3_OUT_Col45 : out std_logic_vector(0 to 3)
    );
end Stage_3;

architecture structure of Stage_3 is

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

        -- ALL THE FAs AND HAs IN THE THIRD STAGE

        HA_6 : HA port map( S3_IN_Col6(0), S3_IN_Col6(1), S3_OUT_Col6(0), S3_OUT_Col7(1) );                     -- Col 6
        HA_7 : HA port map( S3_IN_Col7(0), S3_IN_Col7(1), S3_OUT_Col7(0), S3_OUT_Col8(2) );                     -- Col 7

        FA_8 : FA port map( S3_IN_Col8(0), S3_IN_Col8(1), S3_IN_Col8(2), S3_OUT_Col8(0), S3_OUT_Col9(2) );      -- Col 8
        HA_8 : HA port map( S3_IN_Col8(3), S3_IN_Col8(4), S3_OUT_Col8(1), S3_OUT_Col9(3) );

        FA_9 : FA port map( S3_IN_Col9(0), S3_IN_Col9(1), S3_IN_Col9(2), S3_OUT_Col9(0), S3_OUT_Col10(2) );     -- Col 9
        HA_9 : HA port map( S3_IN_Col9(3), S3_IN_Col9(4), S3_OUT_Col9(1), S3_OUT_Col10(3) );

        GEN_Col10 : for i in 0 to 1 generate
            FA_10 : FA port map( S3_IN_Col10(3*i), S3_IN_Col10(3*i + 1), S3_IN_Col10(3*i + 2), S3_OUT_Col10(i), S3_OUT_Col11(i + 2) );     --Col 10
        end generate;

        GEN_Col11 : for i in 0 to 1 generate
            FA_11 : FA port map( S3_IN_Col11(3*i), S3_IN_Col11(3*i + 1), S3_IN_Col11(3*i + 2), S3_OUT_Col11(i), S3_OUT_Col12(i + 2) );     --Col 11
        end generate;

        GEN_Col12 : for i in 0 to 1 generate
            FA_12 : FA port map( S3_IN_Col12(3*i), S3_IN_Col12(3*i + 1), S3_IN_Col12(3*i + 2), S3_OUT_Col12(i), S3_OUT_Col13(i + 2) );     --Col 12
        end generate;

        GEN_Col13 : for i in 0 to 1 generate
            FA_13 : FA port map( S3_IN_Col13(3*i), S3_IN_Col13(3*i + 1), S3_IN_Col13(3*i + 2), S3_OUT_Col13(i), S3_OUT_Col14(i + 2) );     --Col 13
        end generate;

        GEN_Col14 : for i in 0 to 1 generate
            FA_14 : FA port map( S3_IN_Col14(3*i), S3_IN_Col14(3*i + 1), S3_IN_Col14(3*i + 2), S3_OUT_Col14(i), S3_OUT_Col15(i + 2) );     --Col 14
        end generate;

        GEN_Col15 : for i in 0 to 1 generate
            FA_15 : FA port map( S3_IN_Col15(3*i), S3_IN_Col15(3*i + 1), S3_IN_Col15(3*i + 2), S3_OUT_Col15(i), S3_OUT_Col16(i + 2) );     --Col 15
        end generate;

        GEN_Col16 : for i in 0 to 1 generate
            FA_16 : FA port map( S3_IN_Col16(3*i), S3_IN_Col16(3*i + 1), S3_IN_Col16(3*i + 2), S3_OUT_Col16(i), S3_OUT_Col17(i + 2) );     --Col 16
        end generate;

        GEN_Col17 : for i in 0 to 1 generate
            FA_17 : FA port map( S3_IN_Col17(3*i), S3_IN_Col17(3*i + 1), S3_IN_Col17(3*i + 2), S3_OUT_Col17(i), S3_OUT_Col18(i + 2) );     --Col 17
        end generate;

        GEN_Col18 : for i in 0 to 1 generate
            FA_18 : FA port map( S3_IN_Col18(3*i), S3_IN_Col18(3*i + 1), S3_IN_Col18(3*i + 2), S3_OUT_Col18(i), S3_OUT_Col19(i + 2) );     --Col 18
        end generate;

        GEN_Col19 : for i in 0 to 1 generate
            FA_19 : FA port map( S3_IN_Col19(3*i), S3_IN_Col19(3*i + 1), S3_IN_Col19(3*i + 2), S3_OUT_Col19(i), S3_OUT_Col20(i + 2) );     --Col 19
        end generate;

        GEN_Col20 : for i in 0 to 1 generate
            FA_20 : FA port map( S3_IN_Col20(3*i), S3_IN_Col20(3*i + 1), S3_IN_Col20(3*i + 2), S3_OUT_Col20(i), S3_OUT_Col21(i + 2) );     --Col 20
        end generate;

        GEN_Col21 : for i in 0 to 1 generate
            FA_21 : FA port map( S3_IN_Col21(3*i), S3_IN_Col21(3*i + 1), S3_IN_Col21(3*i + 2), S3_OUT_Col21(i), S3_OUT_Col22(i + 2) );     --Col 21
        end generate;

        GEN_Col22 : for i in 0 to 1 generate
            FA_22 : FA port map( S3_IN_Col22(3*i), S3_IN_Col22(3*i + 1), S3_IN_Col22(3*i + 2), S3_OUT_Col22(i), S3_OUT_Col23(i + 2) );     --Col 22
        end generate;

        GEN_Col23 : for i in 0 to 1 generate
            FA_23 : FA port map( S3_IN_Col23(3*i), S3_IN_Col23(3*i + 1), S3_IN_Col23(3*i + 2), S3_OUT_Col23(i), S3_OUT_Col24(i + 2) );     --Col 23
        end generate;

        GEN_Col24 : for i in 0 to 1 generate
            FA_24 : FA port map( S3_IN_Col24(3*i), S3_IN_Col24(3*i + 1), S3_IN_Col24(3*i + 2), S3_OUT_Col24(i), S3_OUT_Col25(i + 2) );     --Col 24
        end generate;

        GEN_Col25 : for i in 0 to 1 generate
            FA_25 : FA port map( S3_IN_Col25(3*i), S3_IN_Col25(3*i + 1), S3_IN_Col25(3*i + 2), S3_OUT_Col25(i), S3_OUT_Col26(i + 2) );     --Col 25
        end generate;

        GEN_Col26 : for i in 0 to 1 generate
            FA_26 : FA port map( S3_IN_Col26(3*i), S3_IN_Col26(3*i + 1), S3_IN_Col26(3*i + 2), S3_OUT_Col26(i), S3_OUT_Col27(i + 2) );     --Col 26
        end generate;

        GEN_Col27 : for i in 0 to 1 generate
            FA_27 : FA port map( S3_IN_Col27(3*i), S3_IN_Col27(3*i + 1), S3_IN_Col27(3*i + 2), S3_OUT_Col27(i), S3_OUT_Col28(i + 2) );     --Col 27
        end generate;

        GEN_Col28 : for i in 0 to 1 generate
            FA_28 : FA port map( S3_IN_Col28(3*i), S3_IN_Col28(3*i + 1), S3_IN_Col28(3*i + 2), S3_OUT_Col28(i), S3_OUT_Col29(i + 2) );     --Col 28
        end generate;

        GEN_Col29 : for i in 0 to 1 generate
            FA_29 : FA port map( S3_IN_Col29(3*i), S3_IN_Col29(3*i + 1), S3_IN_Col29(3*i + 2), S3_OUT_Col29(i), S3_OUT_Col30(i + 2) );     --Col 29
        end generate;

        GEN_Col30 : for i in 0 to 1 generate
            FA_30 : FA port map( S3_IN_Col30(3*i), S3_IN_Col30(3*i + 1), S3_IN_Col30(3*i + 2), S3_OUT_Col30(i), S3_OUT_Col31(i + 2) );     --Col 30
        end generate;

        GEN_Col31 : for i in 0 to 1 generate
            FA_31 : FA port map( S3_IN_Col31(3*i), S3_IN_Col31(3*i + 1), S3_IN_Col31(3*i + 2), S3_OUT_Col31(i), S3_OUT_Col32(i + 2) );     --Col 31
        end generate;

        GEN_Col32 : for i in 0 to 1 generate
            FA_32 : FA port map( S3_IN_Col32(3*i), S3_IN_Col32(3*i + 1), S3_IN_Col32(3*i + 2), S3_OUT_Col32(i), S3_OUT_Col33(i + 2) );     --Col 32
        end generate;

        GEN_Col33 : for i in 0 to 1 generate
            FA_33 : FA port map( S3_IN_Col33(3*i), S3_IN_Col33(3*i + 1), S3_IN_Col33(3*i + 2), S3_OUT_Col33(i), S3_OUT_Col34(i + 2) );     --Col 33
        end generate;

        GEN_Col34 : for i in 0 to 1 generate
            FA_34 : FA port map( S3_IN_Col34(3*i), S3_IN_Col34(3*i + 1), S3_IN_Col34(3*i + 2), S3_OUT_Col34(i), S3_OUT_Col35(i + 2) );     --Col 34
        end generate;

        GEN_Col35 : for i in 0 to 1 generate
            FA_35 : FA port map( S3_IN_Col35(3*i), S3_IN_Col35(3*i + 1), S3_IN_Col35(3*i + 2), S3_OUT_Col35(i), S3_OUT_Col36(i + 2) );     --Col 35
        end generate;

        GEN_Col36 : for i in 0 to 1 generate
            FA_36 : FA port map( S3_IN_Col36(3*i), S3_IN_Col36(3*i + 1), S3_IN_Col36(3*i + 2), S3_OUT_Col36(i), S3_OUT_Col37(i + 2) );     --Col 36
        end generate;

        GEN_Col37 : for i in 0 to 1 generate
            FA_37 : FA port map( S3_IN_Col37(3*i), S3_IN_Col37(3*i + 1), S3_IN_Col37(3*i + 2), S3_OUT_Col37(i), S3_OUT_Col38(i + 2) );     --Col 37
        end generate;

        GEN_Col38 : for i in 0 to 1 generate
            FA_38 : FA port map( S3_IN_Col38(3*i), S3_IN_Col38(3*i + 1), S3_IN_Col38(3*i + 2), S3_OUT_Col38(i), S3_OUT_Col39(i + 2) );     --Col 38
        end generate;

        GEN_Col39 : for i in 0 to 1 generate
            FA_39 : FA port map( S3_IN_Col39(3*i), S3_IN_Col39(3*i + 1), S3_IN_Col39(3*i + 2), S3_OUT_Col39(i), S3_OUT_Col40(i + 2) );     --Col 39
        end generate;

        GEN_Col40 : for i in 0 to 1 generate
            FA_40 : FA port map( S3_IN_Col40(3*i), S3_IN_Col40(3*i + 1), S3_IN_Col40(3*i + 2), S3_OUT_Col40(i), S3_OUT_Col41(i + 2) );     --Col 40
        end generate;

        GEN_Col41 : for i in 0 to 1 generate
            FA_41 : FA port map( S3_IN_Col41(3*i), S3_IN_Col41(3*i + 1), S3_IN_Col41(3*i + 2), S3_OUT_Col41(i), S3_OUT_Col42(i + 2) );     --Col 41
        end generate;

        FA_42 : FA port map( S3_IN_Col42(0), S3_IN_Col42(1), S3_IN_Col42(2), S3_OUT_Col42(0), S3_OUT_Col43(1) );    -- Col 42
        HA_42 : HA port map( S3_IN_Col42(3), S3_IN_Col42(4), S3_OUT_Col42(1), S3_OUT_Col43(2) );

        FA_43 : FA port map( S3_IN_Col43(0), S3_IN_Col43(1), S3_IN_Col43(2), S3_OUT_Col43(0), S3_OUT_Col44(1) );    -- Col 43

        HA_44 : HA port map( S3_IN_Col44(0), S3_IN_Col44(1), S3_OUT_Col44(0), S3_OUT_Col45(0) );                    -- Col 44

        
        -- SOME SIGNALS FROM THE COLUMN 6 TO 45 ARE NOT USED -> THEY'RE PROPAGATED IN THE FOURTH STAGE
        
        S3_OUT_Col6(1 to 3) <= S3_IN_Col6(2 to 4);
        S3_OUT_Col7(2 to 3) <= S3_IN_Col7(2 to 3);
        S3_OUT_Col8(3) <= S3_IN_Col8(5);

        S3_OUT_Col43(3) <= S3_IN_Col43(3);
        S3_OUT_Col44(2 to 3) <= S3_IN_Col44(2 to 3);
        S3_OUT_Col45(1 to 3) <= S3_IN_Col45(0 to 2);

end architecture;