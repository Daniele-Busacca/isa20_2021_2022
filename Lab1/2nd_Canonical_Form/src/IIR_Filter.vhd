library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity IIR_Filter is
  port( Resetn, Clock: in std_logic;
    VIN : in std_logic;
    A1, A2 : in signed( 12 downto 0 );
    B0, B1, B2 : in signed( 12 downto 0 );
    DIN : in signed( 12 downto 0 );
    --------------------------------------
    VOUT : out std_logic;
    DOUT : out signed( 12 downto 0 ));
end IIR_Filter;

architecture structure of IIR_Filter is

  -- Components Used

  component D_FlipFlop is
    port(D, Clock, Resetn, Load : in std_logic;
      -----------------------------------------
      Q : out std_logic);
  end component;

  component Reg is
    generic( n : positive := 7 );
    port( Resetn, Clock, Load : in std_logic;
      D : in signed( n-1 downto 0 );
      ---------------------------------------
      Q : out signed( n-1 downto 0 ));
  end component;

  component Adder is
    generic( n : positive := 8 );
    port( A, B : in signed( n-1 downto 0 );
      -------------------------------------
      Z : out signed( n-1 downto 0 ));
  end component;

  component Subtractor is
    generic( n : positive := 7 );
    port( A, B : in signed( n-1 downto 0 );
      -------------------------------------
      Z : out signed( n-1 downto 0 ));
  end component;

  component Multiplier is
    generic( n : positive := 8 );
    port( A, B : in signed( n-1 downto 0 );
      -------------------------------------
      Z : out signed( 2*n-1 downto 0 ));
  end component;

  component Saturator is
	port( A : in signed( 7 downto 0 );
		------------------------------
		Y : out signed( 6 downto 0 ));
  end component;


  -- Intermediate Signals

  signal Load, Q_FF2, Q_FF3 : std_logic;
  signal DIN_Trunc, A1_Trunc, A2_Trunc, B0_Trunc, B1_Trunc, B2_Trunc : signed( 6 downto 0 );	-- Truncated Inputs (7 bits)
  signal A1_Delay, A2_Delay, B0_Delay, B1_Delay, B2_Delay : signed( 6 downto 0 );				-- Coefficient-Register Outputs (7 bits)
  signal W_ma1, W_ma2, W_mb0, W_mb1, W_mb2 : signed( 15 downto 0 );								-- Multipliers Outputs (16 bits)
  signal W, Sum_mb0_mb1_mb2 : signed( 7 downto 0 );												-- Adders ...  (8 bits)
  signal Sum_ma1_ma2, Sum_mb1_mb2 : signed( 6 downto 0 );										-- ... Outputs (7 bits)
  signal Q_Reg_3, Q_Reg_4 : signed( 7 downto 0 );												-- Internal-Registers Outputs (8 bits)
  signal DIN_Ext, A1_Ext, A2_Ext, B0_Ext, B1_Ext, B2_Ext: signed( 7 downto 0 );					-- Extended Input-Register Outputs (8 bits)
  signal Sum_ma1_ma2_Ext, Sum_mb1_mb2_Ext : signed( 7 downto 0 );								-- Extended Adder_2 and Adder_4 Outputs (8 bits)
  signal DIN_Delay, DIN_Delay_2, Q_Reg_Out: signed( 6 downto 0 );								-- Input-Register Outputs (7 bits)
  signal Sat_IN : signed( 7 downto 0 );
  signal Sat_OUT : signed( 6 downto 0 );
	

  begin

    -- From VIN to VOUT
    FlipFlop1 : D_FlipFlop port map( VIN, Clock, Resetn, '1', Load );			-- Load is used to block non-valid DIN in Reg_2
	FlipFlop2 : D_FlipFlop port map( Load, Clock, Resetn,'1', Q_FF2 );
	FlipFlop3 : D_FlipFlop port map( Q_FF2, Clock, Resetn, '1', Q_FF3 );
	FlipFlop4 : D_FlipFlop port map( Q_FF3, Clock, Resetn, '1', VOUT );


	-- Inputs Truncation
	DIN_Trunc <= DIN(12 downto 6);
	A1_Trunc <=  A1(12 downto 6);
	A2_Trunc <=  A2(12 downto 6);
	B0_Trunc <=  B0(12 downto 6);
	B1_Trunc <=  B1(12 downto 6);
	B2_Trunc <=  B2(12 downto 6);


    -- All the registers of the IIR Filter
    Reg_1 : Reg port map( Resetn, Clock, '1', DIN_Trunc, DIN_Delay );    		-- DIN Register
	Reg_2 : Reg port map( Resetn, Clock, Load, DIN_Delay, DIN_Delay_2);			-- Register that blocks non-valid DIN
	Reg_10 : Reg
		generic map( n => 8 )
		port map( Resetn, Clock, '1', Sum_mb0_mb1_mb2, Sat_IN );
    Reg_11 : Reg port map( Resetn, Clock, '1', Sat_OUT, Q_Reg_Out );       		-- DOUT Register
	
	DIN_Ext <= DIN_Delay_2(6) & DIN_Delay_2;
    DOUT <= Q_Reg_Out & "000000";


    Reg_3 : Reg												-- "Upper" Filter Register
		generic map( n => 8 ) 
	 	port map( Resetn, Clock, '1', W, Q_Reg_3 );
    Reg_4 : Reg 											-- "Lower" Filter Register
	 	generic map( n => 8 ) 
	 	port map( Resetn, Clock, '1', Q_Reg_3, Q_Reg_4 );
    

    Reg_5 : Reg port map( Resetn, Clock, '1', A1_Trunc, A1_Delay );      		-- A1 Register
    Reg_6 : Reg port map( Resetn, Clock, '1', A2_Trunc, A2_Delay );      		-- A2 Register
    Reg_7 : Reg port map( Resetn, Clock, '1', B1_Trunc, B1_Delay );      		-- B1 Register
    Reg_8 : Reg port map( Resetn, Clock, '1', B0_Trunc, B0_Delay );      		-- B0 Register
    Reg_9 : Reg port map( Resetn, Clock, '1', B2_Trunc, B2_Delay );     		-- B2 Register
 	
	A1_Ext <= A1_Delay(6) & A1_Delay;
	A2_Ext <= A2_Delay(6) & A2_Delay;
	B0_Ext <= B0_Delay(6) & B0_Delay;
	B1_Ext <= B1_Delay(6) & B1_Delay;
	B2_Ext <= B2_Delay(6) & B2_Delay;


    -- all the adders of the IIR Filter
    Adder_1 : Adder port map( DIN_ext, Sum_ma1_ma2_Ext, W );
    Adder_2 : Subtractor port map( W_ma2(12 downto 6), W_ma1(12 downto 6), Sum_ma1_ma2 );   -- multipliers output are truncated because ...
    Adder_3 : Adder port map( W_mb0(13 downto 6), Sum_mb1_mb2_Ext, Sum_mb0_mb1_mb2 );		-- ... their parallelism must be compatible ...
    Adder_4 : Adder 																		-- ... with adders inputs
		generic map( n => 7 )
		port map( W_mb1(12 downto 6), W_mb2(12 downto 6), Sum_mb1_mb2 );	 		
	
	Sum_ma1_ma2_Ext <= Sum_ma1_ma2(6) & Sum_ma1_ma2;
	Sum_mb1_mb2_Ext <= Sum_mb1_mb2(6) & Sum_mb1_mb2;


    -- all the multipliers of the IIR Filter
    Multiplier_1 : Multiplier port map( W, B0_Ext, W_mb0 );
    Multiplier_2 : Multiplier port map( Q_Reg_3, A1_Ext, W_ma1 );
    Multiplier_3 : Multiplier port map( Q_Reg_3, B1_Ext, W_mb1 );
    Multiplier_4 : Multiplier port map( Q_Reg_4, A2_Ext, W_ma2 );
    Multiplier_5 : Multiplier port map( Q_Reg_4, B2_Ext, W_mb2 );


	-- Output Saturation
	Sat : Saturator port map( Sat_IN, Sat_OUT );

    
end architecture;
