library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_RISC_V_ABS is
end tb_RISC_V_ABS;

architecture tb of tb_RISC_V_ABS is

    component RISC_V_ABS is
        port (
            CLK, RSTn : in std_logic;
            DOUT_IMEM : in std_logic_vector( 31 downto 0 );         -- DOUT_IMEM
            DOUT_DMEM : in std_logic_vector( 31 downto 0 );         -- DOUT DMEM in MEM Stage
            ---------------------------------------------------
            PC_IF     : inout std_logic_vector( 31 downto 0 );     -- PC to IMEM
            Z_ALU_MEM : inout std_logic_vector( 31 downto 0 );     -- ALU output
            RS2_MEM   : out std_logic_vector( 31 downto 0 );        -- Right Current Value of RS2_DATA
            RD_MEM    : out std_logic;                              -- RD signal of DMEM
            W_MEM     : out std_logic                               -- W signal of DMEM
        );
    end component;

    component IMEM_ABS is
        generic( m : positive := 30;       -- ADD parallelism
                 n : positive := 32 );     -- DOUT parallelism
        port (
            ADD : in std_logic_vector( m-1 downto 0 );
            -------------------------------------------
            DOUT : out std_logic_vector( n-1 downto 0 )
        );
    end component;

    component DMEM is
        generic( m : positive := 30;       -- ADD parallelism
                 n : positive := 32 );     -- DIN/DOUT parallelism
        port (
            ADD : in std_logic_vector( m-1 downto 0 );
            DIN : in std_logic_vector( n-1 downto 0 );
            RD, W : in std_logic;
            -------------------------------------------
            DOUT : out std_logic_vector( n-1 downto 0 )
        );
    end component;

    component Mux2to1_n is
        generic ( n : positive := 32);
        port (
            A, B : in std_logic_vector( n-1 downto 0 );
            Sel : in std_logic;
            -------------------------------------------
            Y : out std_logic_vector( n-1 downto 0 )
        );
    end component;


    signal CLK_tb    : std_logic := '1';
    signal RSTn_tb   : std_logic;
    signal RD_MEM_tb : std_logic;
    signal W_MEM_tb  : std_logic;
    signal Sel_ADD_DMEM_tb : std_logic;
    signal DOUT_IMEM_tb : std_logic_vector( 31 downto 0 );
    signal DOUT_DMEM_tb : std_logic_vector( 31 downto 0 );
    signal PC_IF_tb     : std_logic_vector( 31 downto 0 ); 
    signal Z_ALU_MEM_tb : std_logic_vector( 31 downto 0 );
    signal RS2_MEM_tb   : std_logic_vector( 31 downto 0 );

    signal ADD_DMEM_tb  : std_logic_vector( 31 downto 0 );
    signal PC_tb        : std_logic_vector( 31 downto 0 );

    constant CLK_period : time := 20 ns;

    begin

        -- DEFINE CLOCK PROCESS
        CLK_process : process is
            begin
                CLK_tb <= '0' after CLK_period/2, '1' after CLK_period;
                wait for CLK_period;
        end process;


        -- DESIGN UNDER TEST
        RISC : RISC_V_ABS port map(
            CLK_tb, RSTn_tb,
            DOUT_IMEM_tb,
            DOUT_DMEM_tb,
            ----------------
            PC_IF_tb,
            Z_ALU_MEM_tb,
            RS2_MEM_tb,
            RD_MEM_tb,
            W_MEM_tb
         );


        -- INSTRUCTION MEMORY
        PC_tb <= std_logic_vector( unsigned(PC_IF_tb) - "00000000010000000000000000000000");
        I_MEM : IMEM_ABS port map( PC_tb(31 downto 2), DOUT_IMEM_tb );
        

        -- MUX_DMEM + DATA MEMORY
        Sel_ADD_DMEM_tb <= RD_MEM_tb or W_MEM_tb;
        MUX_DMEM : Mux2to1_n port map( "00010000000000010000000000010000", Z_ALU_MEM_tb, Sel_ADD_DMEM_tb, ADD_DMEM_tb );
        D_MEM : DMEM port map( ADD_DMEM_tb(31 downto 2), RS2_MEM_tb, RD_MEM_tb, W_MEM_tb, DOUT_DMEM_tb );


        RSTn_tb <= '0', '1' after 25 ns;


end architecture;
