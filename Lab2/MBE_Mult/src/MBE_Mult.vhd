library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MBE_Mult is
    port (
        A, X : in std_logic_vector( 23 downto 0 );
        ------------------------------------------
        Z : out std_logic_vector( 47 downto 0 )
    );
end MBE_Mult;

architecture structure of MBE_Mult is


    -- *************************************************
    -- ******************* SEL PPs *********************
    -- *************************************************

    component Sel_PP is
        port (
            X : in std_logic_vector( 23 downto 0 );
            -----------------------------------------
            Sel : out std_logic_vector( 38 downto 0 )
        );
    end component;



    -- *************************************************
    -- ****************** STAGE MUX ********************
    -- *************************************************

    component Stage_Mux is
        port(
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
    end component;



    -- *************************************************
    -- ******************* STAGE 1 *********************
    -- *************************************************

    component Stage_1 is
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
    end component;



    -- *************************************************
    -- ******************* STAGE 2 *********************
    -- *************************************************

    component Stage_2 is
        port(
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
    end component;



    -- *************************************************
    -- ******************* STAGE 3 *********************
    -- *************************************************

    component Stage_3 is
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
    end component;



    -- *************************************************
    -- ******************* STAGE 4 *********************
    -- *************************************************

    component Stage_4 is
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
    end component;



    -- *************************************************
    -- ******************* STAGE 5 *********************
    -- *************************************************

    component Stage_5 is
        port(
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
    end component;




    -- SIGNAL INPUT AND OUTPUT OF STAGE 1 TO 5
    -- S<n_stage>_COl<X> means: signal INPUT of stage n, Col X


    -- STAGE 1
    signal S1_Col16 : std_logic_vector( 0 to 9 );
    signal S1_Col17 : std_logic_vector( 0 to 8 );
    signal S1_Col18 : std_logic_vector( 0 to 10 );
    signal S1_Col19 : std_logic_vector( 0 to 9 );
    signal S1_Col20 : std_logic_vector( 0 to 11 );
    signal S1_Col21 : std_logic_vector( 0 to 10 );
    signal S1_Col22 : std_logic_vector( 0 to 12 );
    signal S1_Col23 : std_logic_vector( 0 to 11 );
    signal S1_Col24 : std_logic_vector( 0 to 12 );
    signal S1_Col25 : std_logic_vector( 0 to 12 );
    signal S1_Col26 : std_logic_vector( 0 to 12 );
    signal S1_Col27 : std_logic_vector( 0 to 12 );
    signal S1_Col28 : std_logic_vector( 0 to 11 );
    signal S1_Col29 : std_logic_vector( 0 to 10 );
    signal S1_Col30 : std_logic_vector( 0 to 10 );
    signal S1_Col31 : std_logic_vector( 0 to 9 );
    signal S1_Col32 : std_logic_vector( 0 to 9 );
    signal S1_Col33 : std_logic_vector( 0 to 8 );
    signal S1_Col34 : std_logic_vector( 0 to 8 );
    signal S1_Col35 : std_logic_vector( 0 to 7 );


    -- STAGE 2
    signal S2_Col10 : std_logic_vector( 0 to 6 );
    signal S2_Col11 : std_logic_vector( 0 to 5 );
    signal S2_Col12 : std_logic_vector( 0 to 7 );
    signal S2_Col13 : std_logic_vector( 0 to 6 );
    signal S2_Col14 : std_logic_vector( 0 to 8 );
    signal S2_Col15 : std_logic_vector( 0 to 7 );
    signal S2_Col16 : std_logic_vector( 0 to 8 );
    signal S2_Col17 : std_logic_vector( 0 to 8 );
    signal S2_Col18 : std_logic_vector( 0 to 8 );
    signal S2_Col19 : std_logic_vector( 0 to 8 );
    signal S2_Col20 : std_logic_vector( 0 to 8 );
    signal S2_Col21 : std_logic_vector( 0 to 8 );
    signal S2_Col22 : std_logic_vector( 0 to 8 );
    signal S2_Col23 : std_logic_vector( 0 to 8 );
    signal S2_Col24 : std_logic_vector( 0 to 8 );
    signal S2_Col25 : std_logic_vector( 0 to 8 );
    signal S2_Col26 : std_logic_vector( 0 to 8 );
    signal S2_Col27 : std_logic_vector( 0 to 8 );
    signal S2_Col28 : std_logic_vector( 0 to 8 );
    signal S2_Col29 : std_logic_vector( 0 to 8 );
    signal S2_Col30 : std_logic_vector( 0 to 8 );
    signal S2_Col31 : std_logic_vector( 0 to 8 );
    signal S2_Col32 : std_logic_vector( 0 to 8 );
    signal S2_Col33 : std_logic_vector( 0 to 8 );
    signal S2_Col34 : std_logic_vector( 0 to 8 );
    signal S2_Col35 : std_logic_vector( 0 to 8 );
    signal S2_Col36 : std_logic_vector( 0 to 7 );
    signal S2_Col37 : std_logic_vector( 0 to 6 );
    signal S2_Col38 : std_logic_vector( 0 to 6 );
    signal S2_Col39 : std_logic_vector( 0 to 5 );
    signal S2_Col40 : std_logic_vector( 0 to 5 );
    signal S2_Col41 : std_logic_vector( 0 to 4 );


    -- STAGE 3
    signal S3_Col6  : std_logic_vector( 0 to 4 );
    signal S3_Col7  : std_logic_vector( 0 to 3 );
    signal S3_Col8  : std_logic_vector( 0 to 5 );
    signal S3_Col9  : std_logic_vector( 0 to 4 );
    signal S3_Col10 : std_logic_vector( 0 to 5 );
    signal S3_Col11 : std_logic_vector( 0 to 5 );
    signal S3_Col12 : std_logic_vector( 0 to 5 );
    signal S3_Col13 : std_logic_vector( 0 to 5 );
    signal S3_Col14 : std_logic_vector( 0 to 5 );
    signal S3_Col15 : std_logic_vector( 0 to 5 );
    signal S3_Col16 : std_logic_vector( 0 to 5 );
    signal S3_Col17 : std_logic_vector( 0 to 5 );
    signal S3_Col18 : std_logic_vector( 0 to 5 );
    signal S3_Col19 : std_logic_vector( 0 to 5 );
    signal S3_Col20 : std_logic_vector( 0 to 5 );
    signal S3_Col21 : std_logic_vector( 0 to 5 );
    signal S3_Col22 : std_logic_vector( 0 to 5 );
    signal S3_Col23 : std_logic_vector( 0 to 5 );
    signal S3_Col24 : std_logic_vector( 0 to 5 );
    signal S3_Col25 : std_logic_vector( 0 to 5 );
    signal S3_Col26 : std_logic_vector( 0 to 5 );
    signal S3_Col27 : std_logic_vector( 0 to 5 );
    signal S3_Col28 : std_logic_vector( 0 to 5 );
    signal S3_Col29 : std_logic_vector( 0 to 5 );
    signal S3_Col30 : std_logic_vector( 0 to 5 );
    signal S3_Col31 : std_logic_vector( 0 to 5 );
    signal S3_Col32 : std_logic_vector( 0 to 5 );
    signal S3_Col33 : std_logic_vector( 0 to 5 );
    signal S3_Col34 : std_logic_vector( 0 to 5 );
    signal S3_Col35 : std_logic_vector( 0 to 5 );
    signal S3_Col36 : std_logic_vector( 0 to 5 );
    signal S3_Col37 : std_logic_vector( 0 to 5 );
    signal S3_Col38 : std_logic_vector( 0 to 5 );
    signal S3_Col39 : std_logic_vector( 0 to 5 );
    signal S3_Col40 : std_logic_vector( 0 to 5 );
    signal S3_Col41 : std_logic_vector( 0 to 5 );
    signal S3_Col42 : std_logic_vector( 0 to 4 );
    signal S3_Col43 : std_logic_vector( 0 to 3 );
    signal S3_Col44 : std_logic_vector( 0 to 3 );
    signal S3_Col45 : std_logic_vector( 0 to 2 );


    -- STAGE 4
    signal S4_Col4  : std_logic_vector( 0 to 3 );
    signal S4_Col5  : std_logic_vector( 0 to 2 );
    signal S4_Col6  : std_logic_vector( 0 to 3 );
    signal S4_Col7  : std_logic_vector( 0 to 3 );
    signal S4_Col8  : std_logic_vector( 0 to 3 );
    signal S4_Col9  : std_logic_vector( 0 to 3 );
    signal S4_Col10 : std_logic_vector( 0 to 3 );
    signal S4_Col11 : std_logic_vector( 0 to 3 );
    signal S4_Col12 : std_logic_vector( 0 to 3 );
    signal S4_Col13 : std_logic_vector( 0 to 3 );
    signal S4_Col14 : std_logic_vector( 0 to 3 );
    signal S4_Col15 : std_logic_vector( 0 to 3 );
    signal S4_Col16 : std_logic_vector( 0 to 3 );
    signal S4_Col17 : std_logic_vector( 0 to 3 );
    signal S4_Col18 : std_logic_vector( 0 to 3 );
    signal S4_Col19 : std_logic_vector( 0 to 3 );
    signal S4_Col20 : std_logic_vector( 0 to 3 );
    signal S4_Col21 : std_logic_vector( 0 to 3 );
    signal S4_Col22 : std_logic_vector( 0 to 3 );
    signal S4_Col23 : std_logic_vector( 0 to 3 );
    signal S4_Col24 : std_logic_vector( 0 to 3 );
    signal S4_Col25 : std_logic_vector( 0 to 3 );
    signal S4_Col26 : std_logic_vector( 0 to 3 );
    signal S4_Col27 : std_logic_vector( 0 to 3 );
    signal S4_Col28 : std_logic_vector( 0 to 3 );
    signal S4_Col29 : std_logic_vector( 0 to 3 );
    signal S4_Col30 : std_logic_vector( 0 to 3 );
    signal S4_Col31 : std_logic_vector( 0 to 3 );
    signal S4_Col32 : std_logic_vector( 0 to 3 );
    signal S4_Col33 : std_logic_vector( 0 to 3 );
    signal S4_Col34 : std_logic_vector( 0 to 3 );
    signal S4_Col35 : std_logic_vector( 0 to 3 );
    signal S4_Col36 : std_logic_vector( 0 to 3 );
    signal S4_Col37 : std_logic_vector( 0 to 3 );
    signal S4_Col38 : std_logic_vector( 0 to 3 );
    signal S4_Col39 : std_logic_vector( 0 to 3 );
    signal S4_Col40 : std_logic_vector( 0 to 3 );
    signal S4_Col41 : std_logic_vector( 0 to 3 );
    signal S4_Col42 : std_logic_vector( 0 to 3 );
    signal S4_Col43 : std_logic_vector( 0 to 3 );
    signal S4_Col44 : std_logic_vector( 0 to 3 );
    signal S4_Col45 : std_logic_vector( 0 to 3 );
    signal S4_Col46 : std_logic_vector( 0 to 2 );
    signal S4_Col47 : std_logic_vector( 0 to 1 );


    -- STAGE 5
    signal S5_Col0  : std_logic_vector( 0 to 1 );
    signal S5_Col1  : std_logic;
    signal S5_Col2  : std_logic_vector( 0 to 2 );
    signal S5_Col3  : std_logic_vector( 0 to 1 );
    signal S5_Col4  : std_logic_vector( 0 to 2 );
    signal S5_Col5  : std_logic_vector( 0 to 2 );
    signal S5_Col6  : std_logic_vector( 0 to 2 );
    signal S5_Col7  : std_logic_vector( 0 to 2 );
    signal S5_Col8  : std_logic_vector( 0 to 2 );
    signal S5_Col9  : std_logic_vector( 0 to 2 );
    signal S5_Col10 : std_logic_vector( 0 to 2 );
    signal S5_Col11 : std_logic_vector( 0 to 2 );
    signal S5_Col12 : std_logic_vector( 0 to 2 );
    signal S5_Col13 : std_logic_vector( 0 to 2 );
    signal S5_Col14 : std_logic_vector( 0 to 2 );
    signal S5_Col15 : std_logic_vector( 0 to 2 );
    signal S5_Col16 : std_logic_vector( 0 to 2 );
    signal S5_Col17 : std_logic_vector( 0 to 2 );
    signal S5_Col18 : std_logic_vector( 0 to 2 );
    signal S5_Col19 : std_logic_vector( 0 to 2 );
    signal S5_Col20 : std_logic_vector( 0 to 2 );
    signal S5_Col21 : std_logic_vector( 0 to 2 );
    signal S5_Col22 : std_logic_vector( 0 to 2 );
    signal S5_Col23 : std_logic_vector( 0 to 2 );
    signal S5_Col24 : std_logic_vector( 0 to 2 );
    signal S5_Col25 : std_logic_vector( 0 to 2 );
    signal S5_Col26 : std_logic_vector( 0 to 2 );
    signal S5_Col27 : std_logic_vector( 0 to 2 );
    signal S5_Col28 : std_logic_vector( 0 to 2 );
    signal S5_Col29 : std_logic_vector( 0 to 2 );
    signal S5_Col30 : std_logic_vector( 0 to 2 );
    signal S5_Col31 : std_logic_vector( 0 to 2 );
    signal S5_Col32 : std_logic_vector( 0 to 2 );
    signal S5_Col33 : std_logic_vector( 0 to 2 );
    signal S5_Col34 : std_logic_vector( 0 to 2 );
    signal S5_Col35 : std_logic_vector( 0 to 2 );
    signal S5_Col36 : std_logic_vector( 0 to 2 );
    signal S5_Col37 : std_logic_vector( 0 to 2 );
    signal S5_Col38 : std_logic_vector( 0 to 2 );
    signal S5_Col39 : std_logic_vector( 0 to 2 );
    signal S5_Col40 : std_logic_vector( 0 to 2 );
    signal S5_Col41 : std_logic_vector( 0 to 2 );
    signal S5_Col42 : std_logic_vector( 0 to 2 );
    signal S5_Col43 : std_logic_vector( 0 to 2 );
    signal S5_Col44 : std_logic_vector( 0 to 2 );
    signal S5_Col45 : std_logic_vector( 0 to 2 );
    signal S5_Col46 : std_logic_vector( 0 to 2 );
    signal S5_Col47 : std_logic_vector( 0 to 2 );
    

    -----


    signal A2    : std_logic_vector( 24 downto 0 );         -- 2 * A
    signal A_Ext : std_logic_vector( 24 downto 0 );         -- Sign-Extented A
    signal Sel   : std_logic_vector( 38 downto 0 );         -- Scomposed X (to determine partial product)

    signal Add1, Add2 : std_logic_vector( 47 downto 0 );    -- signals to be added in the final adder

    signal Z_unsigned : unsigned( 47 downto 0 );	    -- output Z before conversion in std_logic_vector


    begin

        -- EXTENTION OF A
        A_Ext <= '0' & A;

        -- DOUBLE VALUE OF A
        A2 <= A & '0';

        -- SELECTION SIGNAL TO DETERMINE ALL THE PARTIAL PRODUCTS
        X_SCOMPOSITION : Sel_PP port map( X, Sel ); 


        -- PARTIAL PRODUCT GENERATION
        PP_GEN : Stage_Mux port map(
            A_Ext,
            A2,
            Sel,
            ---------
            S5_Col0,
            S5_Col1, 
            S5_Col2, 
            S5_Col3,
            --------
            S4_Col4,
            S4_Col5,
            --------
            S3_Col6,
            S3_Col7,
            S3_Col8,
            S3_Col9,
            ---------
            S2_Col10,
            S2_Col11,
            S2_Col12,
            S2_Col13,
            S2_Col14,
            S2_Col15,
            ---------
            S1_Col16,
            S1_Col17,
            S1_Col18,
            S1_Col19,
            S1_Col20,
            S1_Col21,
            S1_Col22,
            S1_Col23,
            S1_Col24,
            S1_Col25,
            S1_Col26,
            S1_Col27,
            S1_Col28,
            S1_Col29,
            S1_Col30,
            S1_Col31,
            S1_Col32,
            S1_Col33,
            S1_Col34,
            S1_Col35,
            ---------
            S2_Col36,
            S2_Col37,
            S2_Col38,
            S2_Col39,
            S2_Col40,
            S2_Col41,
            ---------
            S3_Col42,
            S3_Col43,
            S3_Col44,
            S3_Col45,
            ---------
            S4_Col46,
            S4_Col47
        );


        -- STAGE 1
        S1 : Stage_1 port map(
            S1_Col16,
            S1_Col17,
            S1_Col18,
            S1_Col19,
            S1_Col20,
            S1_Col21,
            S1_Col22,
            S1_Col23,
            S1_Col24,
            S1_Col25,
            S1_Col26,
            S1_Col27,
            S1_Col28,
            S1_Col29,
            S1_Col30,
            S1_Col31,
            S1_Col32,
            S1_Col33,
            S1_Col34,
            S1_Col35,
            ---------
            S2_Col16,
            S2_Col17,
            S2_Col18,
            S2_Col19,
            S2_Col20,
            S2_Col21,
            S2_Col22,
            S2_Col23,
            S2_Col24,
            S2_Col25,
            S2_Col26,
            S2_Col27,
            S2_Col28,
            S2_Col29,
            S2_Col30,
            S2_Col31,
            S2_Col32,
            S2_Col33,
            S2_Col34,
            S2_Col35
        );


        -- STAGE 2
        S2 : Stage_2 port map(
            S2_Col10,
            S2_Col11,
            S2_Col12,
            S2_Col13,
            S2_Col14,
            S2_Col15,
            S2_Col16,
            S2_Col17,
            S2_Col18,
            S2_Col19,
            S2_Col20,
            S2_Col21,
            S2_Col22,
            S2_Col23,
            S2_Col24,
            S2_Col25,
            S2_Col26,
            S2_Col27,
            S2_Col28,
            S2_Col29,
            S2_Col30,
            S2_Col31,
            S2_Col32,
            S2_Col33,
            S2_Col34,
            S2_Col35,
            S2_Col36,
            S2_Col37,
            S2_Col38,
            S2_Col39,
            S2_Col40,
            S2_Col41,
            ---------
            S3_Col10,
            S3_Col11,
            S3_Col12,
            S3_Col13,
            S3_Col14,
            S3_Col15,
            S3_Col16,
            S3_Col17,
            S3_Col18,
            S3_Col19,
            S3_Col20,
            S3_Col21,
            S3_Col22,
            S3_Col23,
            S3_Col24,
            S3_Col25,
            S3_Col26,
            S3_Col27,
            S3_Col28,
            S3_Col29,
            S3_Col30,
            S3_Col31,
            S3_Col32,
            S3_Col33,
            S3_Col34,
            S3_Col35,
            S3_Col36,
            S3_Col37,
            S3_Col38,
            S3_Col39,
            S3_Col40,
            S3_Col41
        );


        -- STAGE 3
        S3 : Stage_3 port map(
            S3_Col6,
            S3_Col7,
            S3_Col8,
            S3_Col9,
            S3_Col10,
            S3_Col11,
            S3_Col12,
            S3_Col13,
            S3_Col14,
            S3_Col15,
            S3_Col16,
            S3_Col17,
            S3_Col18,
            S3_Col19,
            S3_Col20,
            S3_Col21,
            S3_Col22,
            S3_Col23,
            S3_Col24,
            S3_Col25,
            S3_Col26,
            S3_Col27,
            S3_Col28,
            S3_Col29,
            S3_Col30,
            S3_Col31,
            S3_Col32,
            S3_Col33,
            S3_Col34,
            S3_Col35,
            S3_Col36,
            S3_Col37,
            S3_Col38,
            S3_Col39,
            S3_Col40,
            S3_Col41,
            S3_Col42,
            S3_Col43,
            S3_Col44,
            S3_Col45,
            ---------
            S4_Col6,
            S4_Col7,
            S4_Col8,
            S4_Col9,
            S4_Col10,
            S4_Col11,
            S4_Col12,
            S4_Col13,
            S4_Col14,
            S4_Col15,
            S4_Col16,
            S4_Col17,
            S4_Col18,
            S4_Col19,
            S4_Col20,
            S4_Col21,
            S4_Col22,
            S4_Col23,
            S4_Col24,
            S4_Col25,
            S4_Col26,
            S4_Col27,
            S4_Col28,
            S4_Col29,
            S4_Col30,
            S4_Col31,
            S4_Col32,
            S4_Col33,
            S4_Col34,
            S4_Col35,
            S4_Col36,
            S4_Col37,
            S4_Col38,
            S4_Col39,
            S4_Col40,
            S4_Col41,
            S4_Col42,
            S4_Col43,
            S4_Col44,
            S4_Col45
        );


        -- STAGE 4
        S4 : Stage_4 port map(
            S4_Col4,
            S4_Col5,
            S4_Col6,
            S4_Col7,
            S4_Col8,
            S4_Col9,
            S4_Col10,
            S4_Col11,
            S4_Col12,
            S4_Col13,
            S4_Col14,
            S4_Col15,
            S4_Col16,
            S4_Col17,
            S4_Col18,
            S4_Col19,
            S4_Col20,
            S4_Col21,
            S4_Col22,
            S4_Col23,
            S4_Col24,
            S4_Col25,
            S4_Col26,
            S4_Col27,
            S4_Col28,
            S4_Col29,
            S4_Col30,
            S4_Col31,
            S4_Col32,
            S4_Col33,
            S4_Col34,
            S4_Col35,
            S4_Col36,
            S4_Col37,
            S4_Col38,
            S4_Col39,
            S4_Col40,
            S4_Col41,
            S4_Col42,
            S4_Col43,
            S4_Col44,
            S4_Col45,
            S4_Col46,
            S4_Col47,
            ---------
            S5_Col4,
            S5_Col5,
            S5_Col6,
            S5_Col7,
            S5_Col8,
            S5_Col9,
            S5_Col10,
            S5_Col11,
            S5_Col12,
            S5_Col13,
            S5_Col14,
            S5_Col15,
            S5_Col16,
            S5_Col17,
            S5_Col18,
            S5_Col19,
            S5_Col20,
            S5_Col21,
            S5_Col22,
            S5_Col23,
            S5_Col24,
            S5_Col25,
            S5_Col26,
            S5_Col27,
            S5_Col28,
            S5_Col29,
            S5_Col30,
            S5_Col31,
            S5_Col32,
            S5_Col33,
            S5_Col34,
            S5_Col35,
            S5_Col36,
            S5_Col37,
            S5_Col38,
            S5_Col39,
            S5_Col40,
            S5_Col41,
            S5_Col42,
            S5_Col43,
            S5_Col44,
            S5_Col45,
            S5_Col46,
            S5_Col47
        );


        -- STAGE 5
        S5 : Stage_5 port map(
            S5_Col0,
            S5_Col1, 
            S5_Col2, 
            S5_Col3, 
            S5_Col4, 
            S5_Col5, 
            S5_Col6, 
            S5_Col7, 
            S5_Col8, 
            S5_Col9, 
            S5_Col10,
            S5_Col11,
            S5_Col12,
            S5_Col13,
            S5_Col14,
            S5_Col15,
            S5_Col16,
            S5_Col17,
            S5_Col18,
            S5_Col19,
            S5_Col20,
            S5_Col21,
            S5_Col22,
            S5_Col23,
            S5_Col24,
            S5_Col25,
            S5_Col26,
            S5_Col27,
            S5_Col28,
            S5_Col29,
            S5_Col30,
            S5_Col31,
            S5_Col32,
            S5_Col33,
            S5_Col34,
            S5_Col35,
            S5_Col36,
            S5_Col37,
            S5_Col38,
            S5_Col39,
            S5_Col40,
            S5_Col41,
            S5_Col42,
            S5_Col43,
            S5_Col44,
            S5_Col45,
            S5_Col46,
            S5_Col47,
            ---------
            Add1,
            Add2
        );



        -- FINAL ADDER
        Z_unsigned <= unsigned(Add1) + unsigned(Add2);
        Z <= std_logic_vector(Z_unsigned);

end architecture;
