library ieee;
use ieee.std_logic_1164.all;

entity HDU is
    port (
        Rs1_ADD, Rs2_ADD, Rd_ADD : in std_logic_vector( 4 downto 0 );
        Mem_RD : in std_logic;
        -------------------------------------------------------------
        NOP, PC_IR_W : out std_logic
    );
end HDU;

architecture struct of HDU is

    component Equal_Detector_n is
        generic ( n : positive := 5 );
        port (
            A, B : in std_logic_vector( n-1 downto 0 );
            -------------------------------------------
            Y : out std_logic
        );
    end component;

    signal Rd_Rs1_Equal, Rd_Rs2_Equal : std_logic;

    begin

        -- compare rd and rs1
        Eq_Det_Rd_Rs1 : Equal_Detector_n port map( Rd_ADD, Rs1_ADD, Rd_Rs1_Equal );

        -- compare rd and rs2
        Eq_Det_Rd_Rs2 : Equal_Detector_n port map( Rd_ADD, Rs2_ADD, Rd_Rs2_Equal );

        NOP <= Mem_RD and ( Rd_Rs1_Equal or Rd_Rs2_Equal );

        PC_IR_W <= not( Mem_RD and ( Rd_Rs1_Equal or Rd_Rs2_Equal ) );

end architecture;