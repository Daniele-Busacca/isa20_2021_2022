library ieee;
use ieee.std_logic_1164.all;

entity IG is
    port (
        IW : in std_logic_vector( 31 downto 0 );
        ----------------------------------------------------------------
        IMM_1, IMM_2, IMM_3, IMM_4, IMM_5 : out std_logic_vector( 31 downto 0 )
    );
end IG;

architecture struct of IG is

    signal IMM_BEQ_SHUFF : std_logic_vector( 11 downto 0 );
    signal IMM_JAL_SHUFF : std_logic_vector( 19 downto 0 );

    signal Zeros : std_logic_vector( 11 downto 0 );
    signal MSB_20 : std_logic_vector( 19 downto 0 );    -- signal made 20 bits/MSBs of the Instruction Word

    begin

        MSB_20 <= ( others => IW(31) );
        Zeros <= (others => '0');

        -- immediate generation for "addi", "lw", "andi"
        -- sign extension from bits [31:20]
        -- ALU input selection with "000"
        IMM_1 <= MSB_20 & IW(31 downto 20);

        -- immediate generation for "auipc", "lui"
        -- 12 positions left shift
        -- ALU input selection with "001"
        IMM_2 <= IW(31 downto 12) & Zeros;

        -- immediate generation for "sw"
        -- sign extension from bits [31:25] and [11:7]
        -- ALU input selection with "010"
        IMM_3 <= MSB_20 & IW(31 downto 25) & IW(11 downto 7);

        -- immediate generation for "beq"
        -- immediate bits given in the form [12|10:5|4:1|11], then sign extension
        -- ALU input selection with "011"
        IMM_BEQ_SHUFF <= IW(31 downto 25) & IW(11 downto 7);
        IMM_4 <= MSB_20 & IMM_BEQ_SHUFF(11) & IMM_BEQ_SHUFF(0) & IMM_BEQ_SHUFF(10 downto 1);
        
        -- immediate generation for "jal"
        -- immediate bits given in the form [20|10:1|11|19:12], then sign extension
        -- ALU input selection with "100"
        IMM_JAL_SHUFF <= IW(31 downto 12);
        IMM_5 <= MSB_20(11 downto 0) & IMM_JAL_SHUFF(19) & IMM_JAL_SHUFF(7 downto 0) & IMM_JAL_SHUFF(8) & IMM_JAL_SHUFF(18 downto 9);

end architecture;