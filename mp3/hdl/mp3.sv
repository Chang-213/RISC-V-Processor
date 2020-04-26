import rv32i_types::*;
module mp3
(
    input clk,
    input rst,
	
	 //shadow_memory
//    output s_inst_resp,
//	 output [31:0] s_inst_rdata,
//	 output s_data_resp,
//	 output [31:0] s_data_rdata,
//	 output s_inst_read,
//	 output [31:0] s_inst_addr,
//	 output s_data_read,
//	 output s_data_write,
//	 output [3:0] s_data_mbe,
//	 output [31:0] s_data_addr,
//	 output [31:0] s_data_wdata,
	 
	 //burst_memory
	 input pmem_resp,
	 input [63:0] pmem_rdata,
	 output pmem_read,
    output pmem_write,
    output [31:0] pmem_addr,
    output [63:0] pmem_wdata
);

/******************* Signals Needed for RVFI Monitor *************************/
//logic load_pc;
//logic load_regfile;
//logic load_ir;
//logic load_mar;
//logic load_mdr;
//logic load_data_out;
/*****************************************************************************/

/******************* Signals Needed for SHADOW MEMORY *************************/
	//datapath and shadow memory
//	logic inst_resp;
//	logic [31:0] inst_rdata;
//	logic data_resp;
//	logic [31:0] data_rdata;
//	logic inst_read;
//	logic [31:0] inst_addr;
//	logic data_read;
//	logic data_write;
//	logic [3:0] data_mbe;
//	logic [31:0] data_addr;
//	logic [31:0] data_wdata;
	
	//Icache signals
	logic [31:0] i_mem_address;
	logic [31:0] i_mem_rdata;
	logic [31:0] i_mem_wdata;			//must manually set value
	logic i_mem_read;
	logic i_mem_write;					//must manually set value
	logic [3:0] i_mem_byte_enable;	//must manually set value
	logic i_mem_resp;
	logic [255:0] i_pmem_rdata;
	logic [255:0] i_pmem_wdata;
	logic [31:0] i_pmem_address;
	logic i_pmem_read;
	logic i_pmem_write;
	logic	i_pmem_resp;
	
	//Dcache signals
	logic [31:0] d_mem_address;
	logic [31:0] d_mem_rdata;
	logic [31:0] d_mem_wdata;
	logic d_mem_read;
	logic d_mem_write;
	logic [3:0] d_mem_byte_enable;
	logic d_mem_resp;
	logic [255:0] d_pmem_rdata;
	logic [255:0] d_pmem_wdata;
	logic [31:0] d_pmem_address;
	logic d_pmem_read;
	logic d_pmem_write;
	logic	d_pmem_resp;
	
	//L2 to Arbiter
	logic [31:0] l2_mem_address;
	logic [255:0] l2_mem_rdata;
	logic [255:0] l2_mem_wdata;
	logic l2_mem_read;
	logic l2_mem_write;
	logic [31:0] mbe_l2;
	logic l2_mem_resp;

	//L2 to Cacheline
	logic [255:0] l2_line_i;
	logic [255:0] l2_line_o;
	logic [31:0] l2_address_i;
	logic l2_read_i;
	logic l2_write_i;
	logic l2_resp_o;
	
	//forwarding	
	rv32i_reg rd_m_out;	
	rv32i_reg rd_wb_out;	
	rv32i_word rs2_exe;	
	rv32i_word rs2_mem;	
	rv32i_word rs1_mem;	
	rv32i_word rs1_exe;	
	rv32i_control_word control_m;	
	rv32i_control_word control_wb;	
	logic [1:0] muxA;	
	logic [1:0] muxB;	
	logic rs2_forw;	
	logic rs1d_forw;	
	logic rs2d_forw;	
	logic wb_mem;	
	logic [1:0] branch;	
		
	//hazard	
	rv32i_reg rd_e_out;	
	rv32i_word rs2_d;	
	rv32i_word rs1_d;	
	rv32i_control_word control_e;	
	logic stall;	
	logic br_en_m;	
	logic flush;
	
	//manually set values
	assign i_mem_wdata = 32'b0;
	assign i_mem_write = 1'b0;
	assign i_mem_byte_enable = 4'b0;
	assign mbe_l2 = {32{1'b1}};
	
/*****************************************************************************/

/**************************** Control Signals ********************************/

/*****************************************************************************/

// Keep datapath named `datapath` for RVFI Monitor
datapath datapath(
	.clk (clk),
   .rst (rst),
	.inst_resp (i_mem_resp),		//input
	.inst_rdata (i_mem_rdata),		//input
	.data_resp (d_mem_resp),		//input
	.data_rdata (d_mem_rdata),		//input
	.stall(stall),	
	.flush(flush),	
	.wb_mem(wb_mem),
	.inst_read (i_mem_read),		//output
	.inst_addr (i_mem_address),	//output
	.data_read (d_mem_read),		//output
	.data_write (d_mem_write),		//output
	.data_mbe (d_mem_byte_enable),//output
	.data_addr (d_mem_address),	//output
	.data_wdata (d_mem_wdata),		//output
	.rd_e_out(rd_e_out),	
	.rd_m_out(rd_m_out),	
	.rd_wb_out(rd_wb_out),	
	.rs2_exe(rs2_exe),	
	.rs2_mem(rs2_mem),	
	.rs1_mem(rs1_mem),	
	.rs1_exe(rs1_exe),	
	.rs2_dec(rs2_d),	
	.rs1_dec(rs1_d),	
	.control_e(control_e),	
	.control_m(control_m),	
	.control_wb(control_wb),	
	.muxA(muxA),	
	.muxB(muxB),	
	.rs2_forw(rs2_forw),	
	.rs1d_forw(rs1d_forw),	
	.rs2d_forw(rs2d_forw),	
	.br_en_m(br_en_m),	
	.branch(branch)
);

forwarding forwarding(	
	.clk (clk),	
   .rst (rst),	
	.rd_m_out(rd_m_out),	
	.rd_wb_out(rd_wb_out),	
	.rs2_exe(rs2_exe),	
	.rs2_mem(rs2_mem),	
	.rs1_mem(rs1_mem),	
	.rs2_dec(rs2_d),	
	.rs1_dec(rs1_d),	
	.rs1_exe(rs1_exe),	
	.control_m(control_m),	
	.control_wb(control_wb),	
	.muxA(muxA),	
	.muxB(muxB),	
	.rs2_forw(rs2_forw),	
	.rs1d_forw(rs1d_forw),	
	.rs2d_forw(rs2d_forw),	
	.wb_mem(wb_mem)	
);

hazard hazard(	
	.clk (clk),	
   .rst (rst),	
	.rd_e_out(rd_e_out),	
	.rs2_d(rs2_d),	
	.rs1_d(rs1_d),	
	.control_e(control_e),	
	.stall(stall)	
);	
br_flush br_flush(	
	.clk (clk),	
   .rst (rst),	
	.br_en_m(br_en_m),	
	.control_m(control_m),	
	.flush(flush)	
);

cache l1icache(
	.clk (clk),
	.rst (rst),

	//CPU DATAPATH to CACHE
	.mem_address (i_mem_address),				//input
	.mem_rdata (i_mem_rdata),					//output
	.mem_wdata (i_mem_wdata), 					//input
	.mem_read (i_mem_read),						//input
	.mem_write (i_mem_write),					//input
	.mem_byte_enable (i_mem_byte_enable), 	//input
	.mem_resp (i_mem_resp),						//output
	.branch(branch),
	
	//CACHE to PYHSICAL MEMORY
	.pmem_rdata (i_pmem_rdata),				//input
	.pmem_wdata (i_pmem_wdata),				//output
	.pmem_address (i_pmem_address),			//output
	.pmem_read (i_pmem_read),					//output
	.pmem_write (i_pmem_write),				//output
	.pmem_resp (i_pmem_resp)					//input
);

cache_data l1dcache(
	.clk (clk),
	.rst (rst),
	
	//CPU DATAPATH to CACHE
	.mem_address (d_mem_address),				//input
	.mem_rdata (d_mem_rdata),					//output
	.mem_wdata (d_mem_wdata),  				//input
	.mem_read (d_mem_read),						//input
	.mem_write (d_mem_write),					//input
	.mem_byte_enable (d_mem_byte_enable), 	//input
	.mem_resp (d_mem_resp),						//output
	
	//CACHE to PYHSICAL MEMORY
	.pmem_rdata (d_pmem_rdata),				//input
	.pmem_wdata (d_pmem_wdata),				//output
	.pmem_address (d_pmem_address),			//output
	.pmem_read (d_pmem_read),					//output
	.pmem_write (d_pmem_write),				//output
	.pmem_resp (d_pmem_resp)					//input
);

l2_cache L2CACHE(
	.clk (clk),
	.rst (rst),
	
	//CACHEL2 to ARBITER
	.mem_address (l2_mem_address), //l2_address_i		//input
	.mem_rdata (l2_mem_rdata),	//l2_line_o					//output
	.mem_wdata (l2_mem_wdata), //l2_line_i 				//input
	.mem_read (l2_mem_read),	//l2_read_i					//input
	.mem_write (l2_mem_write),	//l2_write_i				//input
	.mem_byte_enable (mbe_l2), 								//input	
	.mem_resp (l2_mem_resp), //l2_resp_o					//output
	
	//CACHE to CACHELINE
	.pmem_rdata (l2_line_o),		//input
	.pmem_wdata (l2_line_i),		//output
	.pmem_address (l2_address_i),	//output
	.pmem_read (l2_read_i),			//output
	.pmem_write (l2_write_i),		//output
	.pmem_resp (l2_resp_o)			//input
);

arbiter arbiter(
	 .clk (clk),
    .rst (rst),
	 
	 //from mainmem/L2
	 .rdata_L2 (l2_mem_rdata), 	//l2_line_o
	 .resp_L2 (l2_mem_resp),		//l2_resp_o
	 
	 //from I-cache
	 .read_I (i_pmem_read),
	 .addr_I (i_pmem_address),
	 .write_I (i_pmem_write),
	 .wdata_I (i_pmem_wdata),
	 
	 //from D-cache
	 .read_D (d_pmem_read),
	 .addr_D (d_pmem_address),
	 .write_D (d_pmem_write),
	 .wdata_D (d_pmem_wdata),
	 
	 //to mainmem/L2
	 .read_L2 (l2_mem_read),	//l2_read_i
	 .write_L2 (l2_mem_write),	//l2_write_i
	 .addr_L2 (l2_mem_address),	//l2_address_i
	 .wdata_L2 (l2_mem_wdata), //l2_line_i
	 
	 //to I-cache
	 .rdata_I (i_pmem_rdata),
	 .arb_resp_I (i_pmem_resp),
	 
	 //to D-cache
	 .rdata_D (d_pmem_rdata),
	 .arb_resp_D (d_pmem_resp)
);

cacheline_adapter CA(
	.clk (clk),
	.reset_n (~rst),

    // Port to LLC (Lowest Level Cache)
    .line_i (l2_line_i),		//input
    .line_o (l2_line_o),		//output
    .address_i (l2_address_i),//input
    .read_i (l2_read_i),		//input
    .write_i (l2_write_i),		//input
    .resp_o (l2_resp_o),		//output

    // Port to memory
    .burst_i (pmem_rdata),	//input
    .burst_o (pmem_wdata),	//output
    .address_o (pmem_addr),//output
    .read_o (pmem_read),	//output
    .write_o (pmem_write),	//output
    .resp_i (pmem_resp)		//input
);
endmodule : mp3
