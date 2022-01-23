library ieee;
use ieee.std_logic_1164.all;

entity RF is
    port (
        CLK, RSTn, LD_MEM : in std_logic;
        Rs1_ADD, Rs2_ADD : in std_logic_vector( 4 downto 0 );
        Rd_ADD : in std_logic_vector( 4 downto 0 );
        Rd_DATA : in std_logic_vector( 31 downto 0 );
        --------------------------------------------------------
        Rs1_DATA, Rs2_DATA : out std_logic_vector( 31 downto 0 )
    );
end RF;

architecture struct of RF is


    component Dec5to32 is
        port (
            A : in std_logic_vector( 4 downto 0 );
            ---------------------------------------
            Y : out std_logic_vector( 31 downto 0 )
        );
    end component;


    component Reg_n is
        generic( n : positive := 32 );
        port (
            CLK, RSTn, LD : in std_logic;
            D : in std_logic_vector( n-1 downto 0 );
            ----------------------------------------
            Q : out std_logic_vector( n-1 downto 0 )
        );
    end component;


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


    component Equal_Detector_n is
        generic( n : positive := 5 );
        port (
            A, B : in std_logic_vector( n-1 downto 0 );
            -------------------------------------------
            Y : out std_logic
        );
    end component;


    component Mux2to1_n is
        generic( n : positive := 32 );
        port (
            A, B : in std_logic_vector( n-1 downto 0 );
            Sel : in std_logic;
            -------------------------------------------
            Y : out std_logic_vector( n-1 downto 0 )
        );
    end component;


    signal Dec_Out : std_logic_vector( 31 downto 0 );                       -- output dec5to32
    signal LD_Reg : std_logic_vector( 31 downto 0 );                        -- Load signal of every reg of RF
    signal Rs1_Rd_Equal, Rs2_Rd_Equal : std_logic;                          -- output Equal_Detectors Rs1=(?)Rd, Rs2=(?)Rd
    signal Rs1_Rd_Bypass, Rs2_Rd_Bypass : std_logic;                        -- selection signals of the output of the two Mux2to1s
    signal Rs1_Mux32to1, Rs2_Mux32to1 : std_logic_vector( 31 downto 0 );    -- output of Mux32to1s
    
    signal R0  : std_logic_vector( 31 downto 0 );                           -- data of registers 0 to 31
    signal R1  : std_logic_vector( 31 downto 0 );
    signal R2  : std_logic_vector( 31 downto 0 );
    signal R3  : std_logic_vector( 31 downto 0 );
    signal R4  : std_logic_vector( 31 downto 0 );
    signal R5  : std_logic_vector( 31 downto 0 );
    signal R6  : std_logic_vector( 31 downto 0 );
    signal R7  : std_logic_vector( 31 downto 0 );
    signal R8  : std_logic_vector( 31 downto 0 );
    signal R9  : std_logic_vector( 31 downto 0 );
    signal R10 : std_logic_vector( 31 downto 0 );
    signal R11 : std_logic_vector( 31 downto 0 );
    signal R12 : std_logic_vector( 31 downto 0 );
    signal R13 : std_logic_vector( 31 downto 0 );
    signal R14 : std_logic_vector( 31 downto 0 );
    signal R15 : std_logic_vector( 31 downto 0 );
    signal R16 : std_logic_vector( 31 downto 0 );
    signal R17 : std_logic_vector( 31 downto 0 );
    signal R18 : std_logic_vector( 31 downto 0 );
    signal R19 : std_logic_vector( 31 downto 0 );
    signal R20 : std_logic_vector( 31 downto 0 );
    signal R21 : std_logic_vector( 31 downto 0 );
    signal R22 : std_logic_vector( 31 downto 0 );
    signal R23 : std_logic_vector( 31 downto 0 );
    signal R24 : std_logic_vector( 31 downto 0 );
    signal R25 : std_logic_vector( 31 downto 0 );
    signal R26 : std_logic_vector( 31 downto 0 );
    signal R27 : std_logic_vector( 31 downto 0 );
    signal R28 : std_logic_vector( 31 downto 0 );
    signal R29 : std_logic_vector( 31 downto 0 );
    signal R30 : std_logic_vector( 31 downto 0 );
    signal R31 : std_logic_vector( 31 downto 0 );


    begin


        Decoder : Dec5to32 port map( Rd_ADD, Dec_Out );


        GEN_LD_Regs : for i in 0 to 31 generate
            LD_Reg(i) <= Dec_Out(i) and LD_MEM;
        end generate;


        Reg0  : Reg_n port map( CLK, RSTn, LD_Reg(0),  Rd_DATA, R0);
        Reg1  : Reg_n port map( CLK, RSTn, LD_Reg(1),  Rd_DATA, R1);   
        Reg2  : Reg_n port map( CLK, RSTn, LD_Reg(2),  Rd_DATA, R2);   
        Reg3  : Reg_n port map( CLK, RSTn, LD_Reg(3),  Rd_DATA, R3);   
        Reg4  : Reg_n port map( CLK, RSTn, LD_Reg(4),  Rd_DATA, R4);   
        Reg5  : Reg_n port map( CLK, RSTn, LD_Reg(5),  Rd_DATA, R5);   
        Reg6  : Reg_n port map( CLK, RSTn, LD_Reg(6),  Rd_DATA, R6);
        Reg7  : Reg_n port map( CLK, RSTn, LD_Reg(7),  Rd_DATA, R7);
        Reg8  : Reg_n port map( CLK, RSTn, LD_Reg(8),  Rd_DATA, R8);
        Reg9  : Reg_n port map( CLK, RSTn, LD_Reg(9),  Rd_DATA, R9);
        Reg10 : Reg_n port map( CLK, RSTn, LD_Reg(10), Rd_DATA, R10);
        Reg11 : Reg_n port map( CLK, RSTn, LD_Reg(11), Rd_DATA, R11);
        Reg12 : Reg_n port map( CLK, RSTn, LD_Reg(12), Rd_DATA, R12);
        Reg13 : Reg_n port map( CLK, RSTn, LD_Reg(13), Rd_DATA, R13);
        Reg14 : Reg_n port map( CLK, RSTn, LD_Reg(14), Rd_DATA, R14);
        Reg15 : Reg_n port map( CLK, RSTn, LD_Reg(15), Rd_DATA, R15);
        Reg16 : Reg_n port map( CLK, RSTn, LD_Reg(16), Rd_DATA, R16);
        Reg17 : Reg_n port map( CLK, RSTn, LD_Reg(17), Rd_DATA, R17);
        Reg18 : Reg_n port map( CLK, RSTn, LD_Reg(18), Rd_DATA, R18);
        Reg19 : Reg_n port map( CLK, RSTn, LD_Reg(19), Rd_DATA, R19);
        Reg20 : Reg_n port map( CLK, RSTn, LD_Reg(20), Rd_DATA, R20);
        Reg21 : Reg_n port map( CLK, RSTn, LD_Reg(21), Rd_DATA, R21);
        Reg22 : Reg_n port map( CLK, RSTn, LD_Reg(22), Rd_DATA, R22);
        Reg23 : Reg_n port map( CLK, RSTn, LD_Reg(23), Rd_DATA, R23);
        Reg24 : Reg_n port map( CLK, RSTn, LD_Reg(24), Rd_DATA, R24);
        Reg25 : Reg_n port map( CLK, RSTn, LD_Reg(25), Rd_DATA, R25);
        Reg26 : Reg_n port map( CLK, RSTn, LD_Reg(26), Rd_DATA, R26);
        Reg27 : Reg_n port map( CLK, RSTn, LD_Reg(27), Rd_DATA, R27);
        Reg28 : Reg_n port map( CLK, RSTn, LD_Reg(28), Rd_DATA, R28);
        Reg29 : Reg_n port map( CLK, RSTn, LD_Reg(29), Rd_DATA, R29);
        Reg30 : Reg_n port map( CLK, RSTn, LD_Reg(30), Rd_DATA, R30);
        Reg31 : Reg_n port map( CLK, RSTn, LD_Reg(31), Rd_DATA, R31);


        Mux32to1_Rs1 : Mux32to1_n port map( 
            R0,
            R1,
            R2,
            R3,
            R4,
            R5,
            R6,
            R7,
            R8,
            R9,
            R10,
            R11,
            R12,
            R13,
            R14,
            R15,
            R16,
            R17,
            R18,
            R19,
            R20,
            R21,
            R22,
            R23,
            R24,
            R25,
            R26,
            R27,
            R28,
            R29,
            R30,
            R31,
            Rs1_ADD,
            ------------
            Rs1_Mux32to1
        );


        Mux32to1_Rs2 : Mux32to1_n port map( 
            R0,
            R1,
            R2,
            R3,
            R4,
            R5,
            R6,
            R7,
            R8,
            R9,
            R10,
            R11,
            R12,
            R13,
            R14,
            R15,
            R16,
            R17,
            R18,
            R19,
            R20,
            R21,
            R22,
            R23,
            R24,
            R25,
            R26,
            R27,
            R28,
            R29,
            R30,
            R31,
            Rs2_ADD,
            ------------
            Rs2_Mux32to1
        );


        Eq_Det_Rs1_Rd : Equal_Detector_n port map( Rs1_ADD, Rd_ADD, Rs1_Rd_Equal );
        Eq_Det_Rs2_Rd : Equal_Detector_n port map( Rs2_ADD, Rd_ADD, Rs2_Rd_Equal );


        Rs1_Rd_Bypass <= Rs1_Rd_Equal and LD_MEM;
        Rs2_Rd_Bypass <= Rs2_Rd_Equal and LD_MEM;


        Out_Mux2to1_Rs1 : Mux2to1_n port map( Rs1_Mux32to1, Rd_DATA, Rs1_Rd_Bypass, Rs1_DATA );
        Out_Mux2to1_Rs2 : Mux2to1_n port map( Rs2_Mux32to1, Rd_DATA, Rs2_Rd_Bypass, Rs2_DATA );


end architecture;