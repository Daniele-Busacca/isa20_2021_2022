library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RISC_V_ABS is
    port (
        CLK, RSTn : in std_logic;
        DOUT_IMEM : in std_logic_vector( 31 downto 0 );         -- DOUT_IMEM
        DOUT_DMEM : in std_logic_vector( 31 downto 0 );         -- DOUT DMEM in MEM Stage
        ---------------------------------------------------
        --PC_IF     : buffer std_logic_vector( 31 downto 0 );     -- PC to IMEM
        --Z_ALU_MEM : buffer std_logic_vector( 31 downto 0 );     -- ALU output
		PC_IF     : inout std_logic_vector( 31 downto 0 );     -- PC to IMEM
        Z_ALU_MEM : inout std_logic_vector( 31 downto 0 );     -- ALU output
        RS2_MEM   : out std_logic_vector( 31 downto 0 );        -- Right Current Value of RS2_DATA
        RD_MEM    : out std_logic;                              -- RD signal of DMEM
        W_MEM     : out std_logic                               -- W signal of DMEM
    );
end RISC_V_ABS;

architecture struct of RISC_V_ABS is


    component Reg_n is
        generic( n : positive := 32 );
        port (
            CLK, RSTn, LD : in std_logic;
            D : in std_logic_vector( n-1 downto 0 );
            ----------------------------------------
            Q : out std_logic_vector( n-1 downto 0 )
        );
    end component;


    component Reg_PC is
        port (
            CLK, RSTn, LD : in std_logic;
            D : in std_logic_vector( 31 downto 0 );
            ----------------------------------------
            Q : out std_logic_vector( 31 downto 0 )
        );
    end component;


    component Adder_n is
        generic ( n : positive := 32 );
        port (
            A, B : in std_logic_vector( n-1 downto 0 );
            -------------------------------------------
            Z : out std_logic_vector( n-1 downto 0 )
        );
    end component;


    component Mux2to1_n is
        generic ( n : positive := 32 );
        port (
            A, B : in std_logic_vector( n-1 downto 0 );
            Sel : in std_logic;
            -------------------------------------------
            Y : out std_logic_vector( n-1 downto 0 )
        );
    end component;


    component RF is
        port (
            CLK, RSTn, LD_MEM : in std_logic;
            Rs1_ADD, Rs2_ADD : in std_logic_vector( 4 downto 0 );
            Rd_ADD : in std_logic_vector( 4 downto 0 );
            Rd_DATA : in std_logic_vector( 31 downto 0 );
            --------------------------------------------------------
            Rs1_DATA, Rs2_DATA : out std_logic_vector( 31 downto 0 )
        );
    end component;


    component IG is
        port (
            IW : in std_logic_vector( 31 downto 0 );
            ----------------------------------------------------------------
            IMM_1, IMM_2, IMM_3, IMM_4, IMM_5 : out std_logic_vector( 31 downto 0 )
        );
    end component;


    component CU_ABS is
        port (
            IW : in std_logic_vector( 31 downto 0 );
            ---------------------------------------------
            Control : out std_logic_vector( 14 downto 0 )
        );
    end component;


    component HDU is
        port (
            Rs1_ADD, Rs2_ADD, Rd_ADD : in std_logic_vector( 4 downto 0 );
            Mem_RD : in std_logic;
            -------------------------------------------------------------
            NOP, PC_IR_W : out std_logic
        );
    end component;


    component Mux3to1_n is
        generic ( n : positive := 32 );
        port (
            A, B, C : in std_logic_vector( n-1 downto 0 );
            Sel : in std_logic_vector( 1 downto 0 );
            ----------------------------------------------
            Y : out std_logic_vector( n-1 downto 0 )
        );
    end component;


    component Mux5to1_n is
        generic ( n : positive := 32 );
        port (
            A, B, C, D, E : in std_logic_vector( n-1 downto 0 );
            Sel : in std_logic_vector( 2 downto 0 );
            ----------------------------------------------------
            Y : out std_logic_vector( n-1 downto 0 )
        );
    end component;


    component ALU_ABS is
        port (
            A, B : in std_logic_vector( 31 downto 0 );
            Shift : in std_logic_vector( 4 downto 0 );
            Sel_ALU : in std_logic_vector( 2 downto 0 );
            --------------------------------------------
            Zero : out std_logic;
            Z : out  std_logic_vector( 31 downto 0 )
        );
    end component;


    component Left_Shift_1_n is
        generic( n : positive := 32 );
        port (
            A : in std_logic_vector( n-1 downto 0 );
            ----------------------------------------
            Y : out std_logic_vector( n-1 downto 0 )
        );
    end component;


    component FU is
        port (
            Rs1_ADD_EX, Rs2_ADD_EX, Rd_ADD_MEM, Rd_ADD_WB : in std_logic_vector( 4 downto 0 );
            RF_W_MEM, RF_W_WB : in std_logic;
            ----------------------------------------------------------------------------------
            Sel_Rs1, Sel_Rs2 : out std_logic_vector( 1 downto 0 )
        );
    end component;


    component D_FF is
        port (
            CLK, RSTn, LD : in std_logic;
            D : in std_logic;
            -----------------------------
            Q : out std_logic
        );
    end component;

    
    --
    -- IF SIGNALS
    --
    signal Next_PC : std_logic_vector( 31 downto 0 );   -- PC input
    signal PC_4_IF : std_logic_vector( 31 downto 0 );   -- PC + 4 in the IF Stage
    signal Sel_PC  : std_logic;                         -- Selection signal for "Next_PC"

    signal IW_IF : std_logic_vector( 31 downto 0 );     -- Instruction word in the IF Stage


    --
    -- ID SIGNALS
    --
    signal IW_ID : std_logic_vector( 31 downto 0 );             -- Instruction word in the ID Stage

    signal PC_ID   : std_logic_vector( 31 downto 0 );           -- PC delayed in the ID Stage
    signal PC_4_ID : std_logic_vector( 31 downto 0 );           -- PC + 4 delayed in the ID Stage

    signal RS1_ADD_ID : std_logic_vector( 4 downto 0 );         -- RS1 Address in the ID Stage
    signal RS2_ADD_ID : std_logic_vector( 4 downto 0 );         -- RS2 Address in the ID Stage
    signal RD_ADD_ID : std_logic_vector( 4 downto 0 );          -- RD Address in the ID Stage

    signal RS1_DATA_ID : std_logic_vector( 31 downto 0 );       -- RS1 Data taken from RF in the ID Stage
    signal RS2_DATA_ID : std_logic_vector( 31 downto 0 );       -- RS2 Data taken from RF in the ID Stage

    signal Shift_ID : std_logic_vector( 4 downto 0 );           -- Shift value for "srai" instruction in the ID Stage

    signal ID_Control_CU  : std_logic_vector( 14 downto 0 );   -- CU output
    signal ID_Control     : std_logic_vector( 14 downto 0 );   -- Mux2to1 (for control signals) output
    signal ID_Control_EX  : std_logic_vector( 7 downto 0 );    -- Control signals for EX Stage in the ID Stage
    signal ID_Control_MEM : std_logic_vector( 3 downto 0 );    -- Control signals for MEM Stage in the ID Stage
    signal ID_Control_WB  : std_logic_vector( 2 downto 0 );    -- Control signals for WB Stage in the ID Stage

    signal IMM_1_ID : std_logic_vector( 31 downto 0 );          -- ..
    signal IMM_2_ID : std_logic_vector( 31 downto 0 );          -- .. Generated immediate from the instruction word
    signal IMM_3_ID : std_logic_vector( 31 downto 0 );          -- .. in the ID Stage
    signal IMM_4_ID : std_logic_vector( 31 downto 0 );          -- ..
    signal IMM_5_ID : std_logic_vector( 31 downto 0 );          -- ..

    signal NOP, PC_IR_W : std_logic;                            -- Hazard Detection Unit outputs
    signal Sel_Control  : std_logic;                            -- Selection signal to determine the control signals (OR between NOP and Sel_PC)


    --
    -- EX SIGNALS
    --
    signal PC_EX   : std_logic_vector( 31 downto 0 );           -- PC delayed in the EX Stage
    signal PC_4_EX : std_logic_vector( 31 downto 0 );           -- PC + 4 delayed in the EX Stage

    signal RS1_ADD_EX : std_logic_vector( 4 downto 0 );         -- RS1 Address delayed in the EX Stage
    signal RS2_ADD_EX : std_logic_vector( 4 downto 0 );         -- RS2 Address delayed in the EX Stage
    signal RD_ADD_EX  : std_logic_vector( 4 downto 0 );         -- RD Address delayed in the EX Stage 

    signal RS1_DATA_EX : std_logic_vector( 31 downto 0 );       -- RS1 Data taken from RF in the EX Stage
    signal RS2_DATA_EX : std_logic_vector( 31 downto 0 );       -- RS2 Data taken from RF in the EX Stage

    signal RS1_EX : std_logic_vector( 31 downto 0 );            -- Right RS1 value to be used (output of mux3to1 driven by Forwarding Unit)
    signal RS2_EX : std_logic_vector( 31 downto 0 );            -- Right RS2 value to be used (output of mux3to1 driven by Forwarding Unit)

    signal Sel_RS1 : std_logic_vector( 1 downto 0 );            -- ..
    signal Sel_RS2 : std_logic_vector( 1 downto 0 );            -- .. outputs of Forwarding Unit 

    signal IMM_1_EX   : std_logic_vector( 31 downto 0 );        -- ..
    signal IMM_2_EX   : std_logic_vector( 31 downto 0 );        -- .. Generated immediate from the instruction word
    signal IMM_3_EX   : std_logic_vector( 31 downto 0 );        -- .. in the EX Stage
    signal IMM_4_EX   : std_logic_vector( 31 downto 0 );        -- ..
    signal IMM_5_EX   : std_logic_vector( 31 downto 0 );        -- ..
    signal IMM        : std_logic_vector( 31 downto 0 );        -- Output of the mux4to1 for immediate selection
    signal IMM_LShift : std_logic_vector( 31 downto 0 );        -- Offset to determine the new address 
    signal PC_Jump_EX : std_logic_vector( 31 downto 0 );        -- Address to jump if branch or jump instruction in the EX Stage (output of "Adder_JUMP")

    signal A_ALU    : std_logic_vector( 31 downto 0 );          -- ..
    signal B_ALU    : std_logic_vector( 31 downto 0 );          -- .. ALU (A and B) Inputs
    signal Shift_EX : std_logic_vector( 4 downto 0 );           -- Shift value for "srai" instruction in the EX Stage (ALU input)
    signal Z_ALU_EX : std_logic_vector( 31 downto 0 );          -- Z output of ALU in the EX Stage
    signal Zero_EX  : std_logic;                                -- ALU output (Zero) in the EX Stage

    signal EX_Control_EX      : std_logic_vector( 7 downto 0 );    -- Control signals for EX Stage delayed in the EX Stage
    signal EX_Control_MEM_IN  : std_logic_vector( 3 downto 0 );    -- Control signals for MEM Stage delayed in the EX Stage (MUX IN)
    signal EX_Control_MEM_OUT : std_logic_vector( 3 downto 0 );    -- Control signals for MEM Stage delayed in the EX Stage (MUX OUT)
    signal EX_Control_WB_IN   : std_logic_vector( 2 downto 0 );    -- Control signals for WB Stage delayed in the EX Stage (MUX IN)
    signal EX_Control_WB_OUT  : std_logic_vector( 2 downto 0 );    -- Control signals for WB Stage delayed in the EX Stage (MUX OUT)
    signal Sel_IMM            : std_logic_vector( 2 downto 0 );
    signal Sel_A              : std_logic;
    signal Sel_B              : std_logic;
    signal Sel_ALU            : std_logic_vector( 2 downto 0 );
    signal RD_EX              : std_logic;


    --
    -- MEM SIGNALS
    --
    signal PC_Jump_MEM : std_logic_vector( 31 downto 0 );        -- Address to jump if branch or jump instruction in the MEM Stage
    signal PC_4_MEM    : std_logic_vector( 31 downto 0 );        -- PC + 4 delayed in the MEM Stage

    signal RD_ADD_MEM : std_logic_vector( 4 downto 0 );          -- RD Address delayed in the MEM Stage

    signal Zero_MEM : std_logic;                                 -- ALU output (Zero)delayed in the MEM Stage

    signal MEM_Control_MEM : std_logic_vector( 3 downto 0 );     -- Control signals for MEM Stage delayed in the MEM Stage
    signal MEM_Control_WB  : std_logic_vector( 2 downto 0 );     -- Control signals for WB Stage delayed in the MEM Stage
    signal Branch          : std_logic;
    signal Jump            : std_logic;
    signal RF_W_MEM        : std_logic;

    signal AND_Branch_Zero  : std_logic;                         -- AND result between Branch and Zero


    --
    -- WB SIGNALS
    --
    signal PC_4_WB : std_logic_vector( 31 downto 0 );            -- PC + 4 delayed in the WB Stage

    signal DOUT_DMEM_WB : std_logic_vector( 31 downto 0 );       -- DOUT of DMEM delayed in the WB Stage

    signal RD_ADD_WB : std_logic_vector( 4 downto 0 );           -- RD Address delayed in the WB Stage

    signal ALU_DMEM_to_RF : std_logic_vector( 31 downto 0 );     -- Data selection between ALU and DMEM output
    signal RD_DATA        : std_logic_vector( 31 downto 0 );     -- Data to be written in the RF

    signal Z_ALU_WB : std_logic_vector( 31 downto 0 );

    signal WB_Control_WB  : std_logic_vector( 2 downto 0 );      -- Control signals for WB Stage delayed in the WB Stage
    signal RF_W_WB        : std_logic;
    signal MEMtoRF        : std_logic;
    signal PCtoRF         : std_logic;


    --
    -- Others signals
    --
    signal Zeros : std_logic_vector( 31 downto 0 ) := (others => '0');



    begin

        --
        -- IF STAGE
        --

        Sel_PC <= AND_Branch_Zero or Jump;

        MUX_PC : Mux2to1_n port map( PC_4_IF, PC_Jump_MEM, Sel_PC, Next_PC );                -- Mux to select the new address

        PC : Reg_PC port map( CLK, RSTn, PC_IR_W, Next_PC, PC_IF );                          -- Program Counter

        Adder_PC_4 : Adder_n port map( PC_IF, "00000000000000000000000000000100", PC_4_IF ); -- Calculate PC + 4

        MUX_IW : Mux2to1_n port map( DOUT_IMEM, Zeros, Sel_PC, IW_IF );                      -- Mux to select the instruction word

        

        --
        -- ID STAGE
        --

        REG_PC_4_ID : Reg_n port map( CLK, RSTn, PC_IR_W, PC_4_IF, PC_4_ID );       -- Pipe Register for PC_4 (IF/ID)
        REG_PC_ID   : Reg_n port map( CLK, RSTn, PC_IR_W, PC_IF,   PC_ID );         -- Pipe Register for PC   (IF/ID)
        REG_IW      : Reg_n port map( CLK, RSTn, PC_IR_W, IW_IF,   IW_ID );         -- Pipe Register for IW


        RS1_ADD_ID <= IW_ID(19 downto 15);                                             --
        RS2_ADD_ID <= IW_ID(24 downto 20);                                             -- Extraction of RS1, RS2 and RD address from IW
        RD_ADD_ID  <= IW_ID(11 downto 7);                                              --
        Shift_ID   <= IW_ID(24 downto 20);

        REG_FILE : RF port map( CLK, RSTn, RF_W_WB,                                 -- Register File
                                RS1_ADD_ID, RS2_ADD_ID, RD_ADD_WB,
                                RD_DATA,
                                -------------------------
                                RS1_DATA_ID, RS2_DATA_ID );

        IMMEDIATE : IG port map( IW_ID, IMM_1_ID, IMM_2_ID, IMM_3_ID, IMM_4_ID, IMM_5_ID );   -- Immediate Generator

        Control_Unit : CU_ABS port map( IW_ID, ID_Control_CU );                         -- Control Unit

        Haz_Det_Unit: HDU port map( RS1_ADD_ID, RS2_ADD_ID, RD_ADD_EX, RD_EX,       -- Hazard Detection Unit
                                    -----------------------------------------
                                    NOP, PC_IR_W );
                                    
        Sel_Control <= NOP or Sel_PC;

        MUX_CU : Mux2to1_n
            generic map( n => 15 )
            port map( ID_Control_CU, Zeros(14 downto 0), Sel_Control, ID_Control );

        ID_Control_EX  <= ID_Control(7 downto 0);
        ID_Control_MEM <= ID_Control(11 downto 8);
        ID_Control_WB  <= ID_Control(14 downto 12);



        --
        -- EX STAGE
        --

        REG_PC_4_EX : Reg_n port map( CLK, RSTn, '1', PC_4_ID, PC_4_EX );               -- Pipe Register for PC_4 (ID/EX)
        REG_PC_EX   : Reg_n port map( CLK, RSTn, '1', PC_ID,   PC_EX );                 -- Pipe Register for PC   (ID/EX)

        REG_RS1_EX : Reg_n                                                              -- Pipe Register for RS1_ADD
            generic map( n => 5 )
            port map( CLK, RSTn, '1', RS1_ADD_ID, RS1_ADD_EX );

        REG_RS2_EX : Reg_n                                                              -- Pipe Register for RS2_ADD
            generic map( n => 5 )
            port map( CLK, RSTn, '1', RS2_ADD_ID, RS2_ADD_EX );

        REG_RD_EX : Reg_n                                                               -- Pipe Register for RD_ADD
            generic map( n => 5 )
            port map( CLK, RSTn, '1', RD_ADD_ID, RD_ADD_EX );

        REG_SHIFT : Reg_n                                                               -- Pipe Register for Shift
            generic map( n => 5 )
            port map( CLK, RSTn, '1', Shift_ID, Shift_EX );

        REG_RS1_DATA : Reg_n port map( CLK, RSTn, '1', RS1_DATA_ID, RS1_DATA_EX );      -- Pipe Register for RS1_DATA
        REG_RS2_DATA : Reg_n port map( CLK, RSTn, '1', RS2_DATA_ID, RS2_DATA_EX );      -- Pipe Register for RS2_DATA

        REG_IMM_1 : Reg_n port map( CLK, RSTn, '1', IMM_1_ID, IMM_1_EX );               -- Pipe Register for IMM_1
        REG_IMM_2 : Reg_n port map( CLK, RSTn, '1', IMM_2_ID, IMM_2_EX );               -- Pipe Register for IMM_2
        REG_IMM_3 : Reg_n port map( CLK, RSTn, '1', IMM_3_ID, IMM_3_EX );               -- Pipe Register for IMM_3
        REG_IMM_4 : Reg_n port map( CLK, RSTn, '1', IMM_4_ID, IMM_4_EX );               -- Pipe Register for IMM_4
        REG_IMM_5 : Reg_n port map( CLK, RSTn, '1', IMM_5_ID, IMM_5_EX );               -- Pipe Register for IMM_5

        REG_CONTROL_EX_EX : Reg_n                                                      -- Pipe Register for EX Control signals
            generic map( n => 8 )
            port map( CLK, RSTn, '1', ID_Control_EX, EX_Control_EX );
        
        REG_CONTROL_EX_MEM : Reg_n                                                     -- Pipe Register for MEM Control signals (ID/EX)
            generic map( n => 4 )
            port map( CLK, RSTn, '1', ID_Control_MEM, EX_Control_MEM_IN );

        REG_CONTROL_EX_WB : Reg_n                                                      -- Pipe Register for WB Control signals (ID/EX)
            generic map( n => 3 )
            port map( CLK, RSTn, '1', ID_Control_WB, EX_Control_WB_IN );

        Sel_ALU <= EX_Control_EX(7 downto 5);                                          -- ALU control signals
        Sel_B   <= EX_Control_EX(4);                                                   -- Control signal for selection input B of ALU
        Sel_A   <= EX_Control_EX(3);                                                   -- Control signal for selection input A of ALU
        Sel_IMM <= EX_Control_EX(2 downto 0);                                          -- Control signal for selection of immediate
        RD_EX   <= EX_Control_MEM_OUT(3);                                              -- need for HAzard Detection Unit

        
        MUX_IMM : Mux5to1_n port map( IMM_1_EX, IMM_2_EX, IMM_3_EX, IMM_4_EX, IMM_5_EX, Sel_IMM, IMM );   -- Selection of immediate
        MUX_RS1 : Mux3to1_n port map( RS1_DATA_EX, Z_ALU_MEM, RD_DATA, Sel_RS1, RS1_EX );                 -- Selection of the right value of RS1
        MUX_RS2 : Mux3to1_n port map( RS2_DATA_EX, Z_ALU_MEM, RD_DATA, Sel_RS2, RS2_EX );                 -- Selection of the right value of RS2
        MUX_A   : Mux2to1_n port map( RS1_EX, PC_EX, Sel_A, A_ALU );                                      -- Selection of A input of ALU
        MUX_B   : Mux2to1_n port map( RS2_EX, IMM,   Sel_B, B_ALU );                                      -- Selection of B input of ALU

        MUX_CONTR_MEM : Mux2to1_n                                                               -- Mux to flush the pipe (nullify controls)
            generic map( n => 4 )
            port map( EX_Control_MEM_IN, Zeros(3 downto 0), Sel_PC, EX_Control_MEM_OUT );

        MUX_CONTR_WB  : Mux2to1_n                                                               -- Mux to flush the pipe (nullify controls)
            generic map( n => 3 )
            port map( EX_Control_WB_IN, Zeros(2 downto 0), Sel_PC, EX_Control_WB_OUT );

        ALU_BLOCK : ALU_ABS port map( A_ALU, B_ALU,
                                  Shift_EX,
                                  Sel_ALU,
                                  -------------
                                  Zero_EX,
                                  Z_ALU_EX );

        FORWARDING_UNIT : FU port map( RS1_ADD_EX, RS2_ADD_EX, RD_ADD_MEM, RD_ADD_WB,
                                       RF_W_MEM, RF_W_WB,
                                       ----------------------------------------------
                                       Sel_RS1, Sel_RS2 );
        
        LEFT_SHIFT_1 : Left_Shift_1_n port map( IMM, IMM_LShift );                              -- Create relative address to jump (IMM*2)
        Adder_JUMP : Adder_n port map( PC_EX, IMM_LShift, PC_Jump_EX );                         -- Create real address to jump



        --
        -- MEM STAGE
        --

        REG_PC_4_MEM : Reg_n port map( CLK, RSTn, '1', PC_4_EX, PC_4_MEM );              -- Pipe Register for PC_4 (EX/MEM)

        REG_ADD_JUMP : Reg_n port map( CLK, RSTn, '1', PC_Jump_EX, PC_Jump_MEM );        -- Pipe Register for PC_Jump

        D_FF_ZERO : D_FF port map( CLK, RSTn, '1', Zero_EX, Zero_MEM );                  -- Pipe Register for Zero output of ALU

        REG_Z_ALU_MEM : Reg_n port map( CLK, RSTn, '1', Z_ALU_EX, Z_ALU_MEM );           -- Pipe Register for Z output of ALU

        REG_RS2_MEM : Reg_n port map( CLK, RSTn, '1', RS2_EX, RS2_MEM );                 -- Pipe Register for "right" RS2 value from EX Stage

        REG_RD_MEM : Reg_n                                                               -- Pipe Register for RD_ADD (EX/MEM)
            generic map( n => 5 )
            port map( CLK, RSTn, '1', RD_ADD_EX, RD_ADD_MEM );

        REG_CONTROL_MEM_MEM : Reg_n                                                     -- Pipe Register for MEM Control signals (EX/MEM)
            generic map( n => 4 )
            port map( CLK, RSTn, '1', EX_Control_MEM_OUT, MEM_Control_MEM );

        REG_CONTROL_MEM_WB : Reg_n                                                      -- Pipe Register for WB Control signals (EX/MEM)
            generic map( n => 3 )
            port map( CLK, RSTn, '1', EX_Control_WB_OUT, MEM_Control_WB );

        Branch <= MEM_Control_MEM(0);
        Jump   <= MEM_Control_MEM(1);
        W_MEM  <= MEM_Control_MEM(2);
        RD_MEM <= MEM_Control_MEM(3);

        RF_W_MEM <= MEM_Control_WB(0);

        AND_Branch_Zero <= Zero_MEM and Branch;                                          -- Jump when branch taken



        --
        -- WB STAGE
        --

        REG_PC_4_WB : Reg_n port map( CLK, RSTn, '1', PC_4_MEM, PC_4_WB );              -- Pipe Register for PC_4 (MEM/WB)

        REG_DOUT_DMEM_WB : Reg_n port map( CLK, RSTn, '1', DOUT_DMEM, DOUT_DMEM_WB );   -- Pipe Register for DOUT_DMEM

        REG_Z_ALU_WB : Reg_n port map( CLK, RSTn, '1', Z_ALU_MEM, Z_ALU_WB );           -- Pipe Register for Z_ALU (MEM/WB)

        REG_RD_WB : Reg_n                                                               -- Pipe Register for RD_ADD (MEM/WB)
            generic map( n => 5 )
            port map( CLK, RSTn, '1', RD_ADD_MEM, RD_ADD_WB );

        REG_CONTROL_WB_WB : Reg_n                                                      -- Pipe Register for WB Control signals (MEM/WB)
            generic map( n => 3 )
            port map( CLK, RSTn, '1', MEM_Control_WB, WB_Control_WB );

        
        RF_W_WB <= WB_Control_WB(0);
        MEMtoRF <= WB_Control_WB(1);
        PCtoRF  <= WB_Control_WB(2);

        MUX_MEMtoRF : Mux2to1_n port map( Z_ALU_WB, DOUT_DMEM_WB, MEMtoRF, ALU_DMEM_to_RF );    -- ..
        MUX_PCtoRF  : Mux2to1_n port map( ALU_DMEM_to_RF, PC_4_WB, PCtoRF, RD_DATA );           -- .. Selection of RD_DATA to be written in RF



end architecture;
