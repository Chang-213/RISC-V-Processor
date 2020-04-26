module l2_cache #(
    parameter s_offset = 5,
    parameter s_index  = 4,	//maybe change to 4?
    parameter s_tag    = 32 - s_offset - s_index,
    parameter s_mask   = 2**s_offset,
    parameter s_line   = 8*s_mask,
    parameter num_sets = 2**s_index
)
(	
	//GENERIC SIGNALS
	input logic clk,
	input logic rst,
	
	//CACHEL2 to ARBITER
	input logic [31:0] mem_address,
	output logic [255:0] mem_rdata,
	input logic [255:0] mem_wdata,
	input logic mem_read,
	input logic mem_write,
	input logic [31:0] mem_byte_enable,
	output logic mem_resp,
	
	//CACHE to PYHSICAL MEMORY
	input logic [255:0] pmem_rdata,
	output logic [255:0] pmem_wdata,
	output logic [31:0] pmem_address,
	output logic pmem_read,
	output logic pmem_write,
	input logic	pmem_resp
);
	 
//DATAPATH TO CONTROL
	logic lru_load;
	logic lru_out = 1'b1;
	logic data_select;
	logic dirty_select;
	logic pmem_select;
	logic [1:0] write0_select;
	logic [1:0] write1_select;
	logic valid_load0;
	logic valid_load1;
	logic tag_load0;
	logic tag_load1;
	logic dirty_load0;
	logic dirty_load1;
	logic dirty_bit;
	logic valid_bit;
	logic hit0;
	logic hit1;

l2_control control
(
	.clk (clk),
	.rst (rst),
	
	//Cache to Control
	.read_array (mem_read),
	.write_array (mem_write),
	.pmem_resp (pmem_resp),
	
	//Datapath to Control
	.dirty_bit (dirty_bit),
	.valid_bit (valid_bit),
	.hit0 (hit0),
	.hit1 (hit1),
	.lru_out (lru_out),
	
	//Control to Cache
	.mem_resp (mem_resp),
	.pmem_read (pmem_read),
	.pmem_write (pmem_write),
	
	//Control to Datapath
	.lru_load (lru_load),
	.data_select (data_select),
	.dirty_select (dirty_select),
	.pmem_select (pmem_select),
	.write0_select (write0_select),
	.write1_select (write1_select),
	.valid_load0 (valid_load0),
	.valid_load1 (valid_load1),
	.tag_load0 (tag_load0),
	.tag_load1 (tag_load1),
	.dirty_load0 (dirty_load0),
	.dirty_load1 (dirty_load1)
);

l2_datapath datapath
(
	.clk (clk),
	.rst (rst),
	.mem_byte_enable256 (mem_byte_enable),
	.mem_wdata256 (mem_wdata),
	.mem_rdata256 (mem_rdata),
	.pmem_wdata (pmem_wdata),
	.pmem_address (pmem_address),
	.pmem_rdata (pmem_rdata),
	.mem_address (mem_address),
	.lru_load (lru_load),
	.read_array (mem_read), 
	.write_array (mem_write), 
	.data_select (data_select),
	.dirty_select (dirty_select),
	.pmem_select (pmem_select),
	.write0_select (write0_select),
	.write1_select (write1_select),
	.valid_load0 (valid_load0),
	.valid_load1 (valid_load1),
	.tag_load0 (tag_load0),
	.tag_load1 (tag_load1),
	.dirty_load0 (dirty_load0),
	.dirty_load1 (dirty_load1),
	.dirty_bit (dirty_bit),
	.valid_bit (valid_bit),
	.hit0 (hit0),
	.hit1 (hit1),
	.lru_out (lru_out)
);

endmodule : l2_cache