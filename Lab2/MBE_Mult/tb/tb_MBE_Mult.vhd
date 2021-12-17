library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity tb_MBE_Mult is
end tb_MBE_Mult;

architecture tb of tb_MBE_Mult is

    component MBE_Mult is
        port (
            A, X : in std_logic_vector( 23 downto 0 );
            ------------------------------------------
            Z : out std_logic_vector 47 downto 0 )
        );
    end component;

    signal A_tb, X_tb : std_logic_vector( 23 downto 0 );
    signal Z_tb : std_logic_vector( 47 downto 0 );
    signal Z_Mult_tb : unsigned( 47 downto 0 );
    signal Equal : std_logic_vector( 47 downto 0 );

    begin

        DUT : MBE_Mult port map( A_tb, X_tb, Z_tb );
        Z_Mult_tb <= unsigned(A_tb) * unsigned(X_tb);

        -- simulate the circuit using a file
        -- File_Layout : <A> < > <X>
        Read_Inputs : process is
    
            constant Bit_Num : positive := 24;
        
            file file_data : text;
            variable row : line;
            variable space : character;
        
            variable A_Var, X_Var : std_logic_vector( 1 to Bit_Num );
            
            begin
            
            file_open( file_data, "../tb/A&X_Samples.txt", read_mode ); 
            while not endfile( file_data ) loop
                
                readline( file_data, row );
                
                for i in 1 to Bit_Num loop
                    read( row, A_Var(i) );
                end loop;
                
                read( row, space );
                
                for i in 1 to Bit_Num loop
                    read( row, X_Var(i) );
                end loop;

                A_tb <= A_Var;
                X_tb <= X_var;
                
                wait for 20 ns;
                
            end loop;
            
            file_close( file_data );
          
        end process;


        EQ_GEN : for i in 0 to 47 generate
            Equal(i) <= Z_Mult_tb(i) xor Z_tb(i);
        end generate;

end architecture;
