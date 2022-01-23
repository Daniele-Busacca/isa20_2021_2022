library ieee;
use ieee.std_logic_1164.all;

entity CU_ABS is
    port (
        IW : in std_logic_vector( 31 downto 0 );
        ---------------------------------------------
        Control : out std_logic_vector( 14 downto 0 )
    );
end CU_ABS;

architecture beh of CU_ABS is

    signal opcode : std_logic_vector( 6 downto 0 );
    signal funct3 : std_logic_vector( 2 downto 0 );
    signal funct7 : std_logic_vector( 6 downto 0 );

    signal EX  : std_logic_vector( 7 downto 0 );         -- all the EX Control Signals   [6:0] of Control
    signal MEM : std_logic_vector( 3 downto 0 );        -- all the MEM Control Signals  [10:7] of Control
    signal WB  : std_logic_vector( 2 downto 0 );         -- all the WB Control Signals   [13:11] of Control

    -- EX Control Signals
    signal Sel_Imm : std_logic_vector( 2 downto 0 );    -- [2:0] of EX
    signal Sel_A, Sel_B : std_logic;                    -- [3], [4] of EX
    signal Sel_ALU : std_logic_vector( 2 downto 0 );    -- [7:5] of EX

    -- MEM Control Signals
    signal Branch, Jump, Mem_W, Mem_RD : std_logic;     -- [0], [1], [2], [3] of MEM

    -- WB Control Signals
    signal RF_W, MemtoRF, PCtoRF : std_logic;           -- [0], [1], [2] of WB


    begin

        opcode <= IW( 6 downto 0 );
        funct3 <= IW( 14 downto 12 );
        funct7 <= IW( 31 downto 25 );



        CU_Process : process( opcode, funct3, funct7 )

        begin

            --
            -- "add" instruction
            --
            if opcode = "0110011" and funct3 = "000" and funct7 = "0000000" then

                -- EX
                Sel_Imm <= "000";
                Sel_A   <= '0';
                Sel_B   <= '0';
                Sel_ALU <= "000";

                -- MEM
                Branch <= '0';
                Jump   <= '0';
                Mem_W  <= '0';
                Mem_RD <= '0';

                -- WB
                RF_W    <= '1';
                MemToRF <= '0';
                PCtoRF  <= '0';


            --
            -- "addi" instruction
            --
            elsif opcode = "0010011" and funct3 = "000" then

                -- EX
                Sel_Imm <= "000";
                Sel_A   <= '0';
                Sel_B   <= '1';
                Sel_ALU <= "000";

                -- MEM
                Branch <= '0';
                Jump   <= '0';
                Mem_W  <= '0';
                Mem_RD <= '0';

                -- WB
                RF_W    <= '1';
                MemToRF <= '0';
                PCtoRF  <= '0';


            --
            -- "auipc" instruction
            --
            elsif opcode = "0010111" then

                -- EX
                Sel_Imm <= "001";
                Sel_A   <= '1';
                Sel_B   <= '1';
                Sel_ALU <= "000";

                -- MEM
                Branch <= '0';
                Jump   <= '0';
                Mem_W  <= '0';
                Mem_RD <= '0';

                -- WB
                RF_W    <= '1';
                MemToRF <= '0';
                PCtoRF  <= '0';


            --
            -- "lui" instruction
            --
            elsif opcode = "0110111" then

                -- EX
                Sel_Imm <= "001";
                Sel_A   <= '0';
                Sel_B   <= '1';
                Sel_ALU <= "101";

                -- MEM
                Branch <= '0';
                Jump   <= '0';
                Mem_W  <= '0';
                Mem_RD <= '0';

                -- WB
                RF_W    <= '1';
                MemToRF <= '0';
                PCtoRF  <= '0';


            --
            -- "beq" instruction
            --
            elsif opcode = "1100011" and funct3 = "000" then

                -- EX
                Sel_Imm <= "011";
                Sel_A   <= '0';
                Sel_B   <= '0';
                Sel_ALU <= "000";

                -- MEM
                Branch <= '1';
                Jump   <= '0';
                Mem_W  <= '0';
                Mem_RD <= '0';

                -- WB
                RF_W    <= '0';
                MemToRF <= '0';
                PCtoRF  <= '0';



            --
            -- "lw" instruction
            --
            elsif opcode = "0000011" and funct3 = "010" then

                -- EX
                Sel_Imm <= "000";
                Sel_A   <= '0';
                Sel_B   <= '1';
                Sel_ALU <= "000";

                -- MEM
                Branch <= '0';
                Jump   <= '0';
                Mem_W  <= '0';
                Mem_RD <= '1';

                -- WB
                RF_W    <= '1';
                MemToRF <= '1';
                PCtoRF  <= '0';


            --
            -- "srai" instruction
            --
            elsif opcode = "0010011" and funct3 = "101" and funct7 = "0100000" then

                -- EX
                Sel_Imm <= "000";
                Sel_A   <= '0';
                Sel_B   <= '0';
                Sel_ALU <= "011";

                -- MEM
                Branch <= '0';
                Jump   <= '0';
                Mem_W  <= '0';
                Mem_RD <= '0';

                -- WB
                RF_W    <= '1';
                MemToRF <= '0';
                PCtoRF  <= '0';


            --
            -- "andi" instruction
            --
            elsif opcode = "0010011" and funct3 = "111" then

                -- EX
                Sel_Imm <= "000";
                Sel_A   <= '0';
                Sel_B   <= '1';
                Sel_ALU <= "001";

                -- MEM
                Branch <= '0';
                Jump   <= '0';
                Mem_W  <= '0';
                Mem_RD <= '0';

                -- WB
                RF_W    <= '1';
                MemToRF <= '0';
                PCtoRF  <= '0';


            --
            -- "xor" instruction
            --
            elsif opcode = "0110011" and funct3 = "100" and funct7 = "0000000" then

                -- EX
                Sel_Imm <= "000";
                Sel_A   <= '0';
                Sel_B   <= '0';
                Sel_ALU <= "010";

                -- MEM
                Branch <= '0';
                Jump   <= '0';
                Mem_W  <= '0';
                Mem_RD <= '0';

                -- WB
                RF_W    <= '1';
                MemToRF <= '0';
                PCtoRF  <= '0';


            --
            -- "slt" instruction
            --
            elsif opcode = "0110011" and funct3 = "010" and funct7 = "0000000" then

                -- EX
                Sel_Imm <= "000";
                Sel_A   <= '0';
                Sel_B   <= '0';
                Sel_ALU <= "100";

                -- MEM
                Branch <= '0';
                Jump   <= '0';
                Mem_W  <= '0';
                Mem_RD <= '0';

                -- WB
                RF_W    <= '1';
                MemToRF <= '0';
                PCtoRF  <= '0';


            --
            -- "jal" instruction
            --
            elsif opcode = "1101111" then

                -- EX
                Sel_Imm <= "100";
                Sel_A   <= '0';
                Sel_B   <= '0';
                Sel_ALU <= "000";

                -- MEM
                Branch <= '0';
                Jump   <= '1';
                Mem_W  <= '0';
                Mem_RD <= '0';

                -- WB
                RF_W    <= '1';
                MemToRF <= '0';
                PCtoRF  <= '1';


            --
            -- "sw" instruction
            --
            elsif opcode = "0100011" and funct3 = "010" then

                -- EX
                Sel_Imm <= "010";
                Sel_A   <= '0';
                Sel_B   <= '1';
                Sel_ALU <= "000";

                -- MEM
                Branch <= '0';
                Jump   <= '0';
                Mem_W  <= '1';
                Mem_RD <= '0';

                -- WB
                RF_W    <= '0';
                MemToRF <= '0';
                PCtoRF  <= '0';


            --
            -- "abs" instruction
            --
            elsif opcode = "0100000" and funct3 = "001" and funct7 = "0100000" then

                -- EX
                Sel_Imm <= "000";
                Sel_A   <= '0';
                Sel_B   <= '0';
                Sel_ALU <= "110";

                -- MEM
                Branch <= '0';
                Jump   <= '0';
                Mem_W  <= '0';
                Mem_RD <= '0';

                -- WB
                RF_W    <= '1';
                MemToRF <= '0';
                PCtoRF  <= '0';


            --
            -- others
            --
            else

                -- EX
                Sel_Imm <= "000";
                Sel_A   <= '0';
                Sel_B   <= '0';
                Sel_ALU <= "000";

                -- MEM
                Branch <= '0';
                Jump   <= '0';
                Mem_W  <= '0';
                Mem_RD <= '0';

                -- WB
                RF_W    <= '0';
                MemToRF <= '0';
                PCtoRF  <= '0';

            end if;

        end process;


        EX  <= Sel_ALU & Sel_B & Sel_A & Sel_Imm;
        MEM <= Mem_RD & Mem_W & Jump & Branch;
        WB  <= PCtoRF & MemtoRF & RF_W;
        
        Control <= WB & MEM & EX;


end architecture;