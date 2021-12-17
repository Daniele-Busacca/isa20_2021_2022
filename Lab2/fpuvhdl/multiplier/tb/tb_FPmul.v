//`timescale 1ns

module tb_FPmul ();

   wire CLK_i;
   wire [31:0] A_i;
   wire [31:0] B_i;
   wire [31:0] Z_i;

   clk_gen CG(.CLK(CLK_i));

   data_maker SM(.CLK(CLK_i), 
		 .A(A_i),
		 .B(B_i));

   FPmul UUT(.FP_A(A_i),
	     .FP_B(B_i),
             .clk(CLK_i),
	     .FP_Z(Z_i));

   data_sink DS(.CLK(CLK_i),
		.Z(Z_i));   

endmodule

		   
