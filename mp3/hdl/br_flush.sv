import rv32i_types::*;
module br_flush(
    input clk,
    input rst,
	 
	 input br_en_m,
	 input rv32i_control_word control_m,
	 output logic flush
);

always_comb
begin
	if(control_m.opcode == op_br && br_en_m)
		flush = 1'b1;
	else
		flush = 0;
end

endmodule : br_flush