
module cache_datapath #(
    parameter s_offset = 5,
    parameter s_index  = 3,
    parameter s_tag    = 32 - s_offset - s_index,
    parameter s_mask   = 2**s_offset,
    parameter s_line   = 8*s_mask,
    parameter num_sets = 2**s_index
)
(	//GENERIC signals
	input logic clk,
	input logic rst,
	
	//BUS signals
	input logic [31:0] mem_byte_enable256,
	input logic [255:0] mem_wdata256,
	
	//PYHSICAL signals
	output logic [255:0] pmem_wdata,
   output logic [31:0] pmem_address,
	input logic [255:0] pmem_rdata,
	input logic [31:0] mem_address,
	
	//CONTROL signals
	input logic lru_load,
	input logic read_array, //mem_read
	input logic write_array, //mem_write
	input logic data_select,
	input logic dirty_select,
	input logic pmem_select,
	input logic [1:0] write0_select,
	input logic [1:0] write1_select,
	input logic valid_load0,
	input logic valid_load1,
	input logic tag_load0,
	input logic tag_load1,
	input logic dirty_load0,
	input logic dirty_load1,
	output logic dirty_bit,
	output logic valid_bit,
	output logic hit0,
	output logic hit1,
	output logic lru_out
);		
	 //array inputs
	 logic array_read;
	 logic [2:0] rindex;
	 logic [2:0] windex;
	 logic [23:0] tag_input;
	 
	 //array outputs
	 logic valid0_out;
	 logic valid1_out;
	 logic dirty0_out;
	 logic dirty1_out;
	 logic [23:0] tag0_out;
	 logic [23:0] tag1_out;
	 
	 //data_array
	 logic [31:0] write0_enable;
	 logic [31:0] write1_enable;
	 logic [255:0] data0_out;
	 logic [255:0] data1_out;
	 
	 //misc
	 logic [23:0] tag_out;
	 //logic [2:0] pmem_wdata_select;
	 logic general_hit;
	 logic last;
	 //assign pmem_wdata_select = {lru_out, hit1, hit0};
	 
	 //assign array values
	 assign array_read = (read_array || write_array);
	 assign rindex = mem_address[7:5];
	 assign windex = mem_address[7:5];
	 assign tag_input = mem_address[31:8];
	 
	 
	 //assign hit values
	 assign hit0 = (valid0_out & (tag_input == tag0_out));
	 assign hit1 = (valid1_out & (tag_input == tag1_out));
	 assign general_hit = hit0 | hit1;
	 //assign valid_bit = (valid1_out | valid0_out)
	 
	 //assign output values
	 
	 mux2bit #(1) LAST_USED(
		.clk (clk),
		.rst (rst),
		.select (general_hit),
		.in0 (lru_out),
		.in1 (hit0),
		.out (last)
	 );
	 
	 mux2bit #(1) VALID_BIT(
		.clk (clk),
		.rst (rst),
		.select (lru_out),
		.in0 (valid1_out),
		.in1 (valid0_out),
		.out (valid_bit)
	 );
	 
	 mux2bit #(24) TAG_OUT(
		.clk (clk),
		.rst (rst),
		.select (lru_out),
		.in0 (tag1_out),
		.in1 (tag0_out),
		.out (tag_out)
	 );
	 
	 mux2bit #(1) DIRTY_BIT(
		.clk (clk),
		.rst (rst),
		.select (lru_out),
		.in0 (dirty1_out),
		.in1 (dirty0_out),
		.out (dirty_bit)
	 );
	 
	 mux2bit #(32) PMEM_ADDRESS(
		.clk (clk),
		.rst (rst),
		.select (pmem_select),
		.in0 ({tag_out, mem_address[7:5], 5'b0}),
		.in1 ({mem_address[31:5], 5'b0}),
		.out (pmem_address)
	 );
	 
	 
	 mux2bit #(256) PMEM_WDATA(
		.clk (clk),
		.rst (rst),
		.select (lru_out),
		.in0 (data1_out),
		.in1 (data0_out),
		.out (pmem_wdata)
	 );
	 
	 mux4bit WRITE_ENABLE0(
		.clk (clk),
		.rst (rst),
		.select (write0_select),
		.in0 (32'b0),
		.in1 (mem_byte_enable256),
		.in2 ({32{1'b1}}),
		.in3 (32'b0),
		.out (write0_enable)
	 );
	 
	 mux4bit WRITE_ENABLE1(
		.clk (clk),
		.rst (rst),
		.select (write1_select),
		.in0 (32'b0),
		.in1 (mem_byte_enable256),
		.in2 ({32{1'b1}}),
		.in3 (32'b0),
		.out (write1_enable)
	 );
	 
	array VALID0(
		.clk (clk),
		.rst (rst),
		.read (array_read),
		.load (!lru_out && valid_load0),
		.rindex (rindex),
		.windex (windex),
		.datain (1'b1), //idk if this is right
		.dataout (valid0_out)
	);
	
	array VALID1(
		.clk (clk),
		.rst (rst),
		.read (array_read),
		.load (lru_out && valid_load1),
		.rindex (rindex),
		.windex (windex),
		.datain (1'b1),	//idk if this is right
		.dataout (valid1_out)
	);
	
	array #(s_index, s_tag) TAG0(
		.clk (clk),
		.rst (rst),
		.read (array_read),
		.load (!lru_out && tag_load0),
		.rindex (rindex),
		.windex (windex),
		.datain (tag_input),
		.dataout (tag0_out)
	);
	
	array #(s_index, s_tag) TAG1(
		.clk (clk),
		.rst (rst),
		.read (array_read),
		.load (lru_out && tag_load1),
		.rindex (rindex),
		.windex (windex),
		.datain (tag_input),
		.dataout (tag1_out)
	);
	
	array DIRTY0(
		.clk (clk),
		.rst (rst),
		.read (array_read),
		.load (!lru_out && dirty_load0),
		.rindex (rindex),
		.windex (windex),
		.datain (dirty_select == 1 ? 1'b1 : 1'b0),
		.dataout (dirty0_out)
	);
	
	array DIRTY1(
		.clk (clk),
		.rst (rst),
		.read (array_read),
		.load (lru_out && dirty_load1),
		.rindex (rindex),
		.windex (windex),
		.datain (dirty_select == 1 ? 1'b1 : 1'b0),
		.dataout (dirty1_out)
	);
	
	data_array DATA0(
		.clk (clk),
		.rst (rst),
		.read (1'b1),
		.write_en (write0_enable),
		.rindex (rindex),
		.windex (windex),
		.datain (data_select == 1? pmem_rdata : mem_wdata256),
		.dataout (data0_out)
	);
	
	data_array DATA1(
		.clk (clk),
		.rst (rst),
		.read (1'b1),
		.write_en (write1_enable),
		.rindex (rindex),
		.windex (windex),
		.datain (data_select == 1 ? pmem_rdata : mem_wdata256),
		.dataout (data1_out)
	);
	
	array LRU_REPLACEMENT(
		.clk (clk),
		.rst (rst),
		.read (array_read),
		.load (lru_load),
		.rindex (rindex),
		.windex (windex),
		.datain (last),
		.dataout (lru_out)
	);


endmodule : cache_datapath
