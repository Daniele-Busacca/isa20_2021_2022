class refmod extends uvm_component;
    `uvm_component_utils(refmod)
    
    packet_in tr_in;
    packet_out tr_out;
    uvm_get_port #(packet_in) in;
    uvm_put_port #(packet_out) out;
	
    shortreal A_s, B_s, data_s;
	bit [31:0] A_delay, B_delay, A_delay2, B_delay2;

    function new(string name = "refmod", uvm_component parent);
        super.new(name, parent);
        in = new("in", this);
        out = new("out", this);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        tr_out = packet_out::type_id::create("tr_out", this);
    endfunction: build_phase
    
    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        
        forever begin
            in.get(tr_in);

			A_delay <= tr_in.A;
			B_delay <= tr_in.B;

			A_delay2 <= A_delay;
			B_delay2 <= B_delay;

			A_s = $bitstoshortreal(A_delay2);
			B_s = $bitstoshortreal(B_delay2);

            data_s = A_s * B_s;
			tr_out.data = $shortrealtobits(data_s);

            $display("refmod: input A = %f, input B = %f, output OUT = %f", A_s, B_s, data_s);
			$display("refmod: input A = %b, input B = %b, output OUT = %b", A_delay2, B_delay2, tr_out.data);

            out.put(tr_out);
        end
    endtask: run_phase
endclass: refmod
