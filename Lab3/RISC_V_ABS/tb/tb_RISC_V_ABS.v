module tb_RISC_V_ABS ();

	wire CLK_i;
	wire RSTn_i;
	wire [31:0] PC_i;
	wire [29:0] ADD_IMEM_i;
	wire [31:0] IW_i;
	wire RD_i;
	wire W_i;
	wire [31:0] Z_ALU_MEM_i;
	wire [29:0] ADD_DMEM_i;
	wire [31:0] DIN_DMEM_i;
	wire [31:0] DOUT_DMEM_i;

	clk_rst_gen CRG(.CLK(CLK_i),
					.RSTn(RSTn_i));

	RISC_V_ABS UUT(.CLK(CLK_i),
			  .RSTn(RSTn_i),
			  .DOUT_IMEM(IW_i),
			  .DOUT_DMEM(DOUT_DMEM_i),
			  .PC_IF(PC_i),
			  .Z_ALU_MEM(Z_ALU_MEM_i),
		      .RS2_MEM(DIN_DMEM_i),
			  .RD_MEM(RD_i),
			  .W_MEM(W_i));

	Mux_tb MUX(.Z_ALU_MEM(Z_ALU_MEM_i),
			   .RD_MEM(RD_i),
               .W_MEM(W_i),
               .ADD_DMEM(ADD_DMEM_i));

	Sub_tb SUB(.PC(PC_i),
			  .ADD_IMEM(ADD_IMEM_i));

	IMEM_ABS IM(.ADD(ADD_IMEM_i),
			.DOUT(IW_i));

	DMEM DM(.ADD(ADD_DMEM_i),
			.DIN(DIN_DMEM_i),
			.RD(RD_i),
			.W(W_i),
			.DOUT(DOUT_DMEM_i));

endmodule
	
