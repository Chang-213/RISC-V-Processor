module cache_control (
	//Generic signals
	input clk,
	input rst,
	
	//Cache to Control
	input logic read_array,
	input logic write_array,
	input logic pmem_resp,
	
	//Datapath to Control
	input logic dirty_bit,
	input logic valid_bit,
	input logic hit0,
	input logic hit1,
	input logic lru_out,
	
	//Control to Cache
	output logic mem_resp,
	output logic pmem_read,
	output logic pmem_write,
	
	//Control to Datapath
	output logic lru_load,
	output logic data_select,
	output logic dirty_select,
	output logic pmem_select,
	output logic [1:0] write0_select,
	output logic [1:0] write1_select,
	output logic valid_load0,
	output logic valid_load1,
	output logic tag_load0,
	output logic tag_load1,
	output logic dirty_load0,
	output logic dirty_load1
	
);

enum int unsigned {
    /* List of states */
	 //RESET,
	 ACCESS,
	 WRITE_BACK,
	 ALLOCATE
	 
//	 READ,
//	 READ_MISS_LOAD,
//	 READ_EVIC,
//	 WRITE,
//	 WRITE_MISS_LOAD,
//	 WRITE_EVIC,
//	 END

} state, next_states;

always_comb
begin : state_actions
	lru_load = 0;	//tells to evict LRU or not
	data_select = 1;	//if 1 chooses pmem_rdata as datain into both data arrays, 0 chooses mem_wdata
	dirty_select = 0; //if 1 chooses 1 as datain into both dirty arrays, 0 chooses 0
	pmem_select = 0;  //if 1 chooses tag_out + index as pmem_address, if 0 chooses cache address as pmem_address
	write0_select = 2'b00;	//if 0, sets write_enable to 0, if 1 sets wrute_enable to mem_byte_enable256, if 2 sets write_enable to pmem_rdata (enable)
	write1_select = 2'b00;	//if 0, sets write_enable to 0, if 1 sets wrute_enable to mem_byte_enable256, if 2 sets write_enable to pmem_rdata (enable)
	valid_load0 = 0;
	valid_load1 = 0;
	tag_load0 = 0;
	tag_load1 = 0;
	dirty_load0 = 0;
	dirty_load1 = 0;
	mem_resp = 0;
	pmem_read = 0;
	pmem_write = 0;
	
	unique case (state)
//	RESET:
//	begin
//		
//	end
	ACCESS:
	begin
		lru_load = 1;	//evict LRU
		if(read_array && (hit0 || hit1))
		begin
			//lru_load = 1;	//evict LRU 
			mem_resp = 1;	//set cache to ready
		end
		else if (write_array && (hit0 || hit1))
		begin
			//lru_load = 1;	//evict LRU
			dirty_select = 1; //set dirty bit to 1
			data_select = 0; //set data of arrays to mem_wdata256
			if(lru_out)
			begin
				write1_select = 2'b01;	//set write_enable to mem_byte_enable256
				valid_load1 = 1;	//probably 1 but IDK yet
				tag_load1 = 1;	//probably 1 but IDK yet
				dirty_load1 = 1;	//probably 1 but IDK yet
			end
			else
			begin
				write0_select = 2'b01;
				valid_load0 = 1;
				tag_load0 = 1;
				dirty_load0 = 1;
			end
			mem_resp = 1; //set cache to ready
		end
	end
	WRITE_BACK:
		begin
			pmem_write = 1;	//write to pyhs mem
			pmem_select = 1;	//pmem_address is set to tag0_out + index
			dirty_select = 0; //set dirty bit to 0
		end
	ALLOCATE:
		begin
		pmem_read = 1;
		if(lru_out)
			begin
			write1_select = 2'b10;	//IDK yet
			valid_load1 = 1;	
			tag_load1 = 1;	
			dirty_load1 = 1;
			end
		else
			begin
			write0_select = 2'b10;	//IDK yet
			valid_load0 = 1;	
			tag_load0 = 1;	
			dirty_load0 = 1;
			end
		end

	endcase
end

always_comb
begin : next_state
	next_states = state;
	unique case (state)
//	RESET:
//		begin
//		if(read_array || write_array)
//			next_states = ACCESS;
//		else
//			next_states = RESET;
//		end
	ACCESS:
		begin
		if(valid_bit && !hit1 && !hit0 && !dirty_bit)	//cache miss and clean
			next_states = ALLOCATE;
		else if (valid_bit && !hit1 && !hit0 && dirty_bit)  //cache miss and dirty
			next_states = WRITE_BACK;
		else	//either read or write and cache hit
			next_states = ACCESS;
		end
	WRITE_BACK:
		begin
		if (!pmem_resp)
			next_states = WRITE_BACK;
		else
			next_states = ALLOCATE;
		end
	ALLOCATE:
		begin
		if(!pmem_resp)
			next_states = ALLOCATE;
		else
			next_states = ACCESS;
		end
	endcase
end

always_ff @(posedge clk)
begin
	if (rst)
		state <= ACCESS;
	else
		state <= next_states;
end

endmodule : cache_control
