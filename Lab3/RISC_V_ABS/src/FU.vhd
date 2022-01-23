library ieee;
use ieee.std_logic_1164.all;

entity FU is
    port (
        Rs1_ADD_EX, Rs2_ADD_EX, Rd_ADD_MEM, Rd_ADD_WB : in std_logic_vector( 4 downto 0 );
        RF_W_MEM, RF_W_WB : in std_logic;
        ----------------------------------------------------------------------------------
        Sel_Rs1, Sel_Rs2 : out std_logic_vector( 1 downto 0 )
    );
end FU;

architecture struct of FU is

    component Equal_Detector_n is
        generic ( n : positive := 5 );
        port (
            A, B : in std_logic_vector( n-1 downto 0 );
            -------------------------------------------
            Y : out std_logic
        );
    end component;

    component Forward is
        port ( 
            A, B, C, D : in std_logic;
            --------------------------------------
            Y : out std_logic_vector( 1 downto 0 )
        );
    end component;


    signal Rs1_Rd_MEM_Equal, Rs1_Rd_WB_Equal : std_logic;
    signal Rs2_Rd_MEM_Equal, Rs2_Rd_WB_Equal : std_logic;

    begin

        Eq_Det_Rs1_Rd_MEM : Equal_Detector_n port map( Rs1_ADD_EX, Rd_ADD_MEM, Rs1_Rd_MEM_Equal );
        Eq_Det_Rs1_Rd_WB  : Equal_Detector_n port map( Rs1_ADD_EX, Rd_ADD_WB,  Rs1_Rd_WB_Equal );
        Eq_Det_Rs2_Rd_MEM : Equal_Detector_n port map( Rs2_ADD_EX, Rd_ADD_MEM, Rs2_Rd_MEM_Equal );
        Eq_Det_Rs2_Rd_WB  : Equal_Detector_n port map( Rs2_ADD_EX, Rd_ADD_WB,  Rs2_Rd_WB_Equal );

        Forward_Rs1 : Forward port map( Rs1_Rd_MEM_Equal, Rs1_Rd_WB_Equal, RF_W_MEM, RF_W_WB, Sel_Rs1 );
        Forward_Rs2 : Forward port map( Rs2_Rd_MEM_Equal, Rs2_Rd_WB_Equal, RF_W_MEM, RF_W_WB, Sel_Rs2 );

end architecture;