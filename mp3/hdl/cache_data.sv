
module cache_data #(
    parameter s_offset = 5,
    parameter s_index  = 3,
    parameter s_tag    = 32 - s_offset - s_index,
    parameter s_mask   = 2**s_offset,
    parameter s_line   = 8*s_mask,
    parameter num_sets = 2**s_index
)
(	
	//GENERIC SIGNALS
	input logic clk,
	input logic rst,
	
	//CPU DATAPATH to CACHE
	input logic [31:0] mem_address,
	output logic [31:0] mem_rdata,
	input logic [31:0] mem_wdata,
	input logic mem_read,
	input logic mem_write,
	input logic [3:0] mem_byte_enable,
	output logic mem_resp,
	
	//CACHE to PYHSICAL MEMORY
	input logic [255:0] pmem_rdata,
	output logic [255:0] pmem_wdata,
	output logic [31:0] pmem_address,
	output logic pmem_read,
	output logic pmem_write,
	input logic	pmem_resp
	
	
);

logic [31:0] mem_rdata_reg;
logic mem_resp_more;

//CACHE TO BUSLINE ADAPTER
	 logic [255:0] mem_wdata256;
    logic [255:0] mem_rdata256;
    //logic [31:0] mem_wdata_bl;
    logic [31:0] mem_rdata_bl;
    logic [3:0] mem_byte_enable_bl;
    logic [31:0] mem_byte_enable256;
    logic [31:0] address;
	 
//DATAPATH TO CONTROL
	logic lru_load;
	logic lru_out = 1'b1;
	//logic read_array;
	//logic write_array;
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
	

	//assign read_array = mem_read;
	//assign write_array = mem_write;
	assign mem_rdata256 = pmem_wdata;
	//assign mem_wdata_bl = mem_wdata;
	assign mem_byte_enable_bl = mem_byte_enable;
	assign address = mem_address;
	
register_comb mem_rdata_save(
	.clk (clk),
   .rst (rst),
   .load (mem_resp),
   .in   (mem_rdata_reg),
   .out  (mem_rdata)
);

register mem_resp_more_cheese(
	.clk (clk),
   .rst (rst),
   .load (mem_resp),
   .in   (mem_resp),
   .out  (mem_resp_more)
);
	
cache_control_data control
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

cache_datapath_data datapath
(
	.clk (clk),
	.rst (rst),
	.mem_byte_enable256 (mem_byte_enable256),
	.mem_wdata256 (mem_wdata256),
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

bus_adapter bus_adapter
(
	.mem_wdata256 (mem_wdata256),
	.mem_rdata256 (pmem_wdata),
	.mem_wdata (mem_wdata),
	.mem_rdata (mem_rdata_reg),
	.mem_byte_enable (mem_byte_enable_bl),
	.mem_byte_enable256 (mem_byte_enable256),
	.address (address)
);

endmodule : cache_data
