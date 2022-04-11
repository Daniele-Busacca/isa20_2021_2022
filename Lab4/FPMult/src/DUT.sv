module DUT(dut_if.port_in in_inter, dut_if.port_out out_inter, output enum logic [1:0] {INITIAL,WAIT,SEND} state);
    
    FPmul mult_under_test(.FP_A(in_inter.A),.FP_B(in_inter.B),.clk(in_inter.clk),.FP_Z(out_inter.data));

	shortreal A_s, B_s, data_s;
	bit [31:0] A_delay, A_delay2, B_delay, B_delay2;

    always_ff @(posedge in_inter.clk)
    begin
        if(in_inter.rst) begin
            in_inter.ready <= 0;
            out_inter.data <= 'x;
            out_inter.valid <= 0;
            state <= INITIAL;
        end
        else case(state)
                INITIAL: begin
                    in_inter.ready <= 1;
                    state <= WAIT;
                end
                
                WAIT: begin
                    if(in_inter.valid) begin
                        in_inter.ready <= 0;

						A_delay <=in_inter.A;
						B_delay <=in_inter.B;

						A_delay2 <= A_delay;
						B_delay2 <= B_delay;

						A_s = $bitstoshortreal(A_delay2);
						B_s = $bitstoshortreal(B_delay2);

						data_s = $bitstoshortreal(out_inter.data);

                        $display("FP Mult: input A = %f, input B = %f, output OUT = %f", A_s, B_s, data_s);
                        $display("FP Mult: input A = %b, input B = %b, output OUT = %b", A_delay2, B_delay2, out_inter.data);

                        out_inter.valid <= 1;
                        state <= SEND;
                    end
                end
                
                SEND: begin
                    if(out_inter.ready) begin
                        out_inter.valid <= 0;
                        in_inter.ready <= 1;
                        state <= WAIT;
                    end
                end
        endcase
    end
endmodule: DUT
