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

// Set high when a valid instruction is modifying regfile or PC
assign rvfi.commit = dut.datapath.rvfi_packet_wb.commit;

// Set high when you detect an infinite loop
assign rvfi.halt = (dut.datapath.pc_e_out == dut.datapath.pcmux_out);

initial rvfi.order = 0;
always @(posedge itf.clk iff rvfi.commit) rvfi.order <= rvfi.order + 1; // Modify for OoO

//assign rvfi.trap = dut.datapath.control_wb.opcode == 7'b1100011 ? 0 : 1;

always_comb
begin : trap_check
    rvfi.trap = 0;
    // If the instruction cannot be decoded
    case (dut.datapath.control_wb.opcode)
        7'b0110111, 7'b0010111, 7'b0010011, 7'b0110011, 7'b1101111, 7'b1100111:;
		//BR_instructions
        7'b1100011: begin
            case (dut.datapath.control_wb.cmpop)
                3'b000, 3'b001, 3'b100, 3'b101, 3'b110, 3'b111:;
                default: rvfi.trap = 1;
            endcase
        end
        // loads
        7'b0000011: begin
            case (dut.datapath.control_wb.load_type)
                3'b010, 3'b001, 3'b101, 3'b000, 3'b100: ;
                default: rvfi.trap = 1;
            endcase
        end
        // store
        7'b0100011: begin
            case (dut.datapath.control_wb.store_type)
                3'b010, 3'b001, 3'b000: ;
                default: rvfi.trap = 1;
            endcase
        end
        default: rvfi.trap = 1;
    endcase
end

// Set to the instruction word for the retired instruction
assign rvfi.inst = dut.datapath.rvfi_packet_wb.instruction; //not sure yet which is the retired instruction

// Set the decoded rs1 and rs1 register addresses for the retired instruction.
// If this output is nonzero then rs1/2_rdata must carry the value stored in that register in the pre-state
assign rvfi.rs1_addr = dut.datapath.rvfi_packet_wb.rs1;
assign rvfi.rs2_addr = dut.datapath.rvfi_packet_wb.rs2;

// Set to  the value of the register addressed by rs1/rs2 before execution of this instruction
// Output must be zero when rs1/rs2 is zero
assign rvfi.rs1_rdata = dut.datapath.rvfi_packet_wb.rs1_data;
assign rvfi.rs2_rdata = dut.datapath.rvfi_packet_wb.rs2_data;

// Set high when regfile is being updated
assign rvfi.load_regfile = dut.datapath.rvfi_packet_wb.load_regfile;

// Set to  decoded rd register address for the retired instruction.
// For an instruction that writes no rd register, this output must always be zero.
assign rvfi.rd_addr = dut.datapath.rvfi_packet_wb.rd;

// Set to the value of the register addressed by rd after execution of this instruction.
// This output must be zero when rd is zero.
assign rvfi.rd_wdata = dut.datapath.rvfi_packet_wb.rd_wdata;

// Set to the address of the retired instruction
assign rvfi.pc_rdata = dut.datapath.rvfi_packet_wb.pc_rdata;

// Set to the address of the next instruction
assign rvfi.pc_wdata = dut.datapath.rvfi_packet_wb.pc_wdata;

assign rvfi.mem_addr = dut.datapath.rvfi_packet_wb.mem_addr;

// Set to bitmask that specifies which bytes in rvfi.mem_rdata contain valid read data from rvfi.mem_addr
assign rvfi.mem_rmask = dut.datapath.rvfi_packet_wb.mem_rmask;

//Set to bitmask that specifies which bytes in rvfi.mem_wdata contain valid data that is written to rvfi.mem_addr
assign rvfi.mem_wmask = dut.datapath.rvfi_packet_wb.mem_wmask;

// Set to is the pre-state data read from rvfi.mem_addr. rvfi.mem_rmask specifies which bytes are valid
assign rvfi.mem_rdata = dut.datapath.rvfi_packet_wb.mem_rdata;

// Set to  is the post-state data written to rvfi.mem_addr. rvfi.mem_wmask specifies which bytes are valid.
assign rvfi.mem_wdata = dut.datapath.rvfi_packet_wb.mem_wdata;
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
