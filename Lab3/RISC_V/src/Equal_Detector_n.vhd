library ieee;
use ieee.std_logic_1164.all;

entity Equal_Detector_n is
    generic ( n : positive );
    port (
        A, B : in std_logic_vector( n-1 downto 0 );
        -------------------------------------------
        Y : out std_logic
    );
end Equal_Detector_n;

architecture struct of Equal_Detector_n is

    signal EXNOR_Out : std_logic_vector( n-1 downto 0 );
    signal AND_Out : std_logic_vector ( n-2 downto 0 );

    begin

        EXNOR_GATES : for i in 0 to n-1 generate
            EXNOR_Out(i) <= A(i) xnor B(i);
        end generate;
      
        AND_Out(0) <= EXNOR_Out(0) and EXNOR_Out(1);

        AND_GATES : for i in 1 to n-2 generate
            AND_Out(i) <= AND_Out(i-1) and EXNOR_Out(i+1);
        end generate;
      
        Y <= AND_Out(n-2);  

end architecture;