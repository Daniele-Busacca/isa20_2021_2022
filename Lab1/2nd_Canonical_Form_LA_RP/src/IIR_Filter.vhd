library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity IIR_Filter is
  port( Resetn, Clock: in std_logic;
    VIN : in std_logic;
    A1, A2 : in signed( 12 downto 0 );
    B0, B1, B2 , B3 : in signed( 12 downto 0 );
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
    generic( n : positive := 7 );
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

  signal Load, Q_FF2, Q_FF3 , Q_FF4, Q_FF5 : std_logic;
  signal DIN_Trunc, A1_Trunc, A2_Trunc, B0_Trunc, B1_Trunc, B2_Trunc, B3_Trunc : signed( 6 downto 0 );	-- Truncated Inputs (7 bits)
  signal A1_Delay, A2_Delay, B0_Delay, B1_Delay, B2_Delay,B3_Delay : signed( 6 downto 0 );				-- Coefficient-Register Outputs (7 bits)
  signal W_ma1, W_ma2, W_mb0, W_mb1, W_mb2 , W_mb3: signed( 15 downto 0 );								-- Multipliers Outputs (16 bits)
  signal W, Sum_mb0_mb1_mb2_mb3 : signed( 7 downto 0 );												-- Adders ...  (8 bits)
  signal W_mb1_trunc,W_mb2_trunc,W_mb3_trunc,W_ma1_trunc,W_ma2_trunc : signed (6 downto 0); -- input registers after mul, pipelining and retiming
  signal Q_Reg_3,Q_Reg_4, Q_Reg_18 : signed( 7 downto 0 );  --exit registers 8 bits multipliers 
  signal Q_Reg_11,Q_Reg_12,Q_Reg_13,Q_Reg_14,Q_Reg_15,Q_Reg_16 , Q_Reg_17: signed (6 downto 0); --exit registers 7 bits multipliers  
  signal Sum_ma1_ma2,Sub_mb2_mb3, Sum_mb1_mb2_mb3: signed( 6 downto 0 );										-- ... Outputs (7 bits)
  
  signal DIN_Ext, A1_Ext, A2_Ext, B0_Ext, B1_Ext, B2_Ext, B3_Ext: signed( 7 downto 0 );					-- Extended Input-Register Outputs (8 bits)
  signal Sum_ma1_ma2_Ext, Q_Reg_17_Ext : signed( 7 downto 0 );								-- Extended Adder_2 and Adder_4 Outputs (8 bits)
  signal DIN_Delay, DIN_Delay_2, Q_Reg_Out: signed( 6 downto 0 );								-- Input-Register Outputs (7 bits)
  
  signal Sat_IN : signed( 7 downto 0 );
  signal Sat_OUT : signed( 6 downto 0 );
	

  begin

    -- From VIN to VOUT
    FlipFlop1 : D_FlipFlop port map( VIN, Clock, Resetn, '1', Load );			-- Load is used to block non-valid DIN in Reg_2
	FlipFlop2 : D_FlipFlop port map( Load, Clock, Resetn,'1', Q_FF2 );

	FlipFlop3 : D_FlipFlop port map( Q_FF2, Clock, Resetn, '1', Q_FF3 );
	FlipFlop4 : D_FlipFlop port map( Q_FF3, Clock, Resetn, '1', Q_FF4 );
  	FlipFlop5 : D_FlipFlop port map( Q_FF4, Clock, Resetn, '1', Q_FF5 );
  	FlipFlop6 : D_FlipFlop port map( Q_FF5, Clock, Resetn, '1', VOUT );




	-- Inputs Truncation
	DIN_Trunc <= DIN(12 downto 6);
	A1_Trunc <=  A1(12 downto 6);
	A2_Trunc <=  A2(12 downto 6);
	B0_Trunc <=  B0(12 downto 6);
	B1_Trunc <=  B1(12 downto 6);
	B2_Trunc <=  B2(12 downto 6);
  	B3_Trunc <=  B3(12 downto 6);


    -- All the registers of the IIR Filter
    Reg_1 : Reg port map( Resetn, Clock, '1', DIN_Trunc, DIN_Delay );    		-- DIN Register
	Reg_2 : Reg port map( Resetn, Clock, Load, DIN_Delay, DIN_Delay_2);			-- Register that blocks non-valid DIN
	Reg_21 : Reg
		generic map( n => 8 )
	port map( Resetn, Clock, '1', Sum_mb0_mb1_mb2_mb3, Sat_IN );
    Reg_22 : Reg port map( Resetn, Clock, '1', Sat_OUT, Q_Reg_Out );       		-- DOUT Register
	
	DIN_Ext <= DIN_Delay_2(6) & DIN_Delay_2;
    DOUT <= Q_Reg_Out & "000000";


 	Reg_3 : Reg
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
    Reg_10: Reg port map( Resetn, Clock, '1', B3_Trunc, B3_Delay );         -- B3 Register


 	
	A1_Ext <= A1_Delay(6) & A1_Delay;
	A2_Ext <= A2_Delay(6) & A2_Delay;
	B0_Ext <= B0_Delay(6) & B0_Delay;
	B1_Ext <= B1_Delay(6) & B1_Delay;
	B2_Ext <= B2_Delay(6) & B2_Delay;
  	B3_Ext <= B3_Delay(6) & B3_Delay;

    --Reg Multipliers
    
    Reg_11 : Reg
    port map( Resetn, Clock, '1', W_ma2(12 downto 6), Q_Reg_11 );

    
    Reg_12 : Reg
    port map( Resetn, Clock, '1', W_ma1(12 downto 6), Q_Reg_12 );

    
    Reg_13 : Reg
    port map( Resetn, Clock, '1', W_mb3(12 downto 6), Q_Reg_13 );

  
    Reg_14 : Reg
    port map( Resetn, Clock, '1', W_mb2(12 downto 6), Q_Reg_14 );

   

    
    Reg_16 : Reg
    port map( Resetn, Clock, '1', W_mb1(12 downto 6), Q_Reg_16 );

--    Reg_18 : Reg
--      generic map( n => 8 ) 
--    port map( Resetn, Clock, '1', W, Q_Reg_18 ); -- Reg for pipeline


  
    



    -- all the adders of the IIR Filter
    Adder_1 : Adder 
      generic map( n => 8 )
    port map( DIN_ext, Sum_ma1_ma2_Ext, W );
    Adder_2 : Adder port map( Q_Reg_11, Q_Reg_12, Sum_ma1_ma2 );
    Sub_1 : Subtractor port map( Q_Reg_14, Q_Reg_13, Sub_mb2_mb3 );   -- multipliers output are truncated because ...

    Reg_15: Reg port map( Resetn, Clock, '1', Sub_mb2_mb3 , Q_Reg_15 ); -- Reg for pipeline

    Adder_3 : Adder port map( Q_Reg_15,Q_Reg_16, Sum_mb1_mb2_mb3 );		
	
	Reg_17: Reg 
    port map( Resetn, Clock, '1', Sum_mb1_mb2_mb3, Q_Reg_17 ); --Reg for pipeline
    

	Reg_18: Reg 
      generic map( n => 8 ) 
    port map( Resetn, Clock, '1', W_mb0(13 downto 6), Q_Reg_18); -- Reg for pipeline
    

    Adder_4 : Adder 																		
	  generic map( n => 8 )
	port map( Q_Reg_17_Ext, Q_Reg_18 , Sum_mb0_mb1_mb2_mb3);	 		
	
	Sum_ma1_ma2_Ext <= Sum_ma1_ma2(6) & Sum_ma1_ma2;
	Q_Reg_17_Ext <= Q_Reg_17 (6) & Q_Reg_17;





    -- all the multipliers of the IIR Filter
    Multiplier_1 : Multiplier port map( Q_Reg_3, B0_Ext, W_mb0 );
    Multiplier_2 : Multiplier port map( Q_Reg_3, B1_Ext, W_mb1 );
    Multiplier_3 : Multiplier port map( Q_Reg_3, B2_Ext, W_mb2 );
    Multiplier_4 : Multiplier port map( Q_Reg_3, A1_Ext, W_ma1 );
    Multiplier_5 : Multiplier port map( Q_Reg_4, B3_Ext, W_mb3 );
    Multiplier_6 : Multiplier port map( Q_Reg_4, A2_Ext, W_ma2 );

	-- Output Saturation
	Sat : Saturator port map( Sat_IN, Sat_OUT );

    
end architecture;
