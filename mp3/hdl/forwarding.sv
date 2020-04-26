import rv32i_types::*;
module forwarding(
    input clk,
    input rst,
	 
	 input rv32i_reg rd_m_out,
	 input rv32i_reg rd_wb_out,
	 input rv32i_word rs2_exe,
	 input rv32i_word rs2_mem,
	 input rv32i_word rs1_mem,
	 input rv32i_word rs1_exe,
	 input rv32i_word rs2_dec,
	 input rv32i_word rs1_dec,
	 input rv32i_control_word control_m,
	 input rv32i_control_word control_wb,
	 output logic [1:0] muxA,
	 output logic [1:0] muxB,
	 output logic rs1d_forw,
	 output logic rs2d_forw,
	 output logic rs2_forw,
	 output logic wb_mem
);

always_comb
begin
	if(control_m.load_regfile && rd_m_out != 0 && rd_m_out == rs1_exe)
		muxA = 2'b10;
	else if(control_wb.load_regfile && rd_wb_out != 0 && rd_m_out != rs1_exe && rd_wb_out == rs1_exe)
		muxA = 2'b01;
	else
		muxA = 0;
		
	if(control_m.load_regfile && rd_m_out != 0 && rd_m_out == rs2_exe)
		muxB = 2'b10;
	else if(control_wb.load_regfile && rd_wb_out != 0 && rd_m_out != rs2_exe && rd_wb_out == rs2_exe)
		muxB = 2'b01;
	else
		muxB = 0;
		
	if(control_m.mem_write && rd_wb_out != 0 && rd_wb_out == rs2_mem)
		rs2_forw = 1;
	else
		rs2_forw = 0;
	
	if(control_wb.load_regfile && rd_wb_out != 0 && rd_wb_out == rs1_dec)
		rs1d_forw = 1;
	else
		rs1d_forw = 0;
	
	if(control_wb.load_regfile && rd_wb_out != 0 && rd_wb_out == rs2_dec)
		rs2d_forw = 1;
	else
		rs2d_forw = 0;
		
	if(control_wb.load_regfile && rd_wb_out != 0 && rd_wb_out == rs1_mem && control_wb.opcode != op_auipc)
		wb_mem = 1;
	else
		wb_mem = 0;
		
	
end




endmodule : forwarding