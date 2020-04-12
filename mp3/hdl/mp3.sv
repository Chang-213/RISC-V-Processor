import rv32i_types::*;

module mp3
(
    input clk,
    input rst,
    input inst_resp,
	 input [31:0] inst_rdata,
	 input data_resp,
	 input [31:0] data_rdata,
	 output inst_read,
	 output [31:0] inst_addr,
	 output data_read,
	 output data_write,
	 output [3:0] data_mbe,
	 output [31:0] data_addr,
	 output [31:0] data_wdata
);

/******************* Signals Needed for RVFI Monitor *************************/
//logic load_pc;
//logic load_regfile;
//logic load_ir;
//logic load_mar;
//logic load_mdr;
//logic load_data_out;
/*****************************************************************************/

/**************************** Control Signals ********************************/

/*****************************************************************************/

// Keep datapath named `datapath` for RVFI Monitor
datapath datapath(.*);

endmodule : mp3
