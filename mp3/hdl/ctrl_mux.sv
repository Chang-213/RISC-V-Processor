import rv32i_types::*;
module ctrl_mux2
(
	input clk,
   input rst,
   input select,
   input rv32i_control_word in0, in1,
   output rv32i_control_word out
);

always_comb
	begin
		if(select == 0)
			out = in0;
		else
			out = in1;
	end
endmodule : ctrl_mux2