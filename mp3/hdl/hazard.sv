import rv32i_types::*;
module hazard(
    input clk,
    input rst,
	 
	 input rv32i_reg rd_e_out,
	 input rv32i_word rs2_d,
	 input rv32i_word rs1_d,
	 input rv32i_control_word control_e,
	 output logic stall
);

always_comb
begin
	if(control_e.mem_read && rd_e_out != 0 && (rd_e_out == rs1_d || rd_e_out == rs2_d))
		stall = 1'b1;
	else
		stall = 0;
end

endmodule : hazard