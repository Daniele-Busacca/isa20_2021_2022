library ieee;
use ieee.std_logic_1164.all;

entity Mux_tb is
	port( Z_ALU_MEM : in std_logic_vector( 31 downto 0 );
		  RD_MEM, W_MEM : in std_logic;
		  ADD_DMEM : out std_logic_vector( 29 downto 0 ));
end Mux_tb;

architecture struct of Mux_tb is

	component Mux2to1_n is
		generic ( n : positive := 30 );
		port (
		    A, B : in std_logic_vector( n-1 downto 0 );
		    Sel : in std_logic;
		    -------------------------------------------
		    Y : out std_logic_vector( n-1 downto 0 )
		);
	end component;

	signal COST : std_logic_vector( 29 downto 0 );
	signal Sel_Mux : std_logic;

	begin

		COST <= "000100000000000100000000000100";
		Sel_Mux <= RD_MEM or W_MEM;

		MUX : Mux2to1_n port map( COST, Z_ALU_MEM(31 downto 2), Sel_Mux, ADD_DMEM );

end architecture;

		
