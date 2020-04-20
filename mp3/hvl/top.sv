module mp3_tb;
`timescale 1ns/10ps

/********************* Do not touch for proper compilation *******************/
// Instantiate Interfaces
tb_itf itf();
rvfi_itf rvfi(itf.clk, itf.rst);

// Instantiate Testbench
source_tb tb(
    .magic_mem_itf(itf),
    .mem_itf(itf),
    .sm_itf(itf),
    .tb_itf(itf),
    .rvfi(rvfi)
);
/****************************** End do not touch *****************************/
logic clk;
assign clk = itf.clk;
/************************ Signals necessary for monitor **********************/
// This section not required until CP3

assign rvfi.commit = 0; // Set high when a valid instruction is modifying regfile or PC
// Set high when you detect an infinite loop
assign rvfi.halt = dut.datapath.load_pc & (dut.datapath.pc_out == dut.datapath.branch_addr_out) & (dut.datapath.opcode == 7'b1100011);
initial rvfi.order = 0;
always @(posedge itf.clk iff rvfi.commit) rvfi.order <= rvfi.order + 1; // Modify for OoO
/**************************** End RVFIMON signals ****************************/

/********************* Assign Shadow Memory Signals Here *********************/
// This section not required until CP2
assign itf.inst_read = dut.i_mem_read;
assign itf.inst_addr = dut.i_mem_address;
assign itf.inst_rdata = dut.i_mem_rdata;		//problem
assign itf.inst_resp = dut.i_mem_resp;			//problem
assign itf.data_read = dut.d_mem_read;
assign itf.data_write = dut.d_mem_write;
assign itf.data_addr = dut.d_mem_address;
assign itf.data_rdata = dut.d_mem_rdata;		//problem
assign itf.data_wdata = dut.d_mem_wdata;
assign itf.data_resp = dut.d_mem_resp;			//problem
assign itf.data_mbe = dut.d_mem_byte_enable;

/*********************** End Shadow Memory Assignments ***********************/

// Set this to the proper value
assign itf.registers = dut.datapath.regfile.data;
/*********************** Instantiate your design here ************************/
mp3 dut(
	.clk 			 (itf.clk),
	.rst 			 (itf.rst),
	.pmem_read		 (itf.mem_read),
	.pmem_write		 (itf.mem_write),
	.pmem_addr		 (itf.mem_addr),
	.pmem_wdata		 (itf.mem_wdata),
	.pmem_resp		 (itf.mem_resp),
	.pmem_rdata		 (itf.mem_rdata)
);

/***************************** End Instantiation *****************************/

endmodule
