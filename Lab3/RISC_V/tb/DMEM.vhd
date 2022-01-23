library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DMEM is
    generic( m : positive := 30;      -- ADD parallelism
             n : positive := 32);     -- DIN/DOUT parallelism
    port (
        ADD : in std_logic_vector( m-1 downto 0 );
        DIN : in std_logic_vector( n-1 downto 0 );
        RD, W : in std_logic;
        -------------------------------------------
        DOUT : out std_logic_vector( n-1 downto 0 )
    );
end DMEM;

architecture beh of DMEM is

    type MEM_Array is array ( 67125248 to 67125255 ) of std_logic_vector( n-1 downto 0 );
    
    signal MEM : MEM_Array := ( "00000000000000000000000000001010",
                                "11111111111111111111111111010001",
                                "00000000000000000000000000010110",
                                "11111111111111111111111111111101",
                                "00000000000000000000000000001111",
                                "00000000000000000000000000011011",
                                "11111111111111111111111111111100",
                                "00000000000000000000000000000000" );

    begin

        MEM_Process : process( ADD, RD, W )

        begin

            if RD = '0' and W = '1' then
                MEM(to_integer(unsigned(ADD))) <= DIN;      -- write operation
                DOUT <= (others => 'Z');

            elsif RD = '1' and W = '0' then
                DOUT <= MEM(to_integer(unsigned(ADD)));     -- read operation

            elsif RD = '1' and W = '1' then
                MEM(to_integer(unsigned(ADD))) <= DIN;      -- read and write operation at the same time
                DOUT <= MEM(to_integer(unsigned(ADD)));     -- the input is sent to the output

            else
                DOUT <= (others => 'Z');

            end if;

        end process;

end architecture;
