class packet_in extends uvm_sequence_item;
    rand integer A;
    rand integer B;

	constraint new_range_A { A inside {[100:1000]}; } 
    constraint new_range_B { B > 0 ; B < 10*A; }

    `uvm_object_utils_begin(packet_in)
        `uvm_field_int(A, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(B, UVM_ALL_ON|UVM_HEX)
    `uvm_object_utils_end

    function new(string name="packet_in");
        super.new(name);
    endfunction: new
endclass: packet_in
