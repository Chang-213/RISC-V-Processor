//zext

module zext #(parameter width = 32)
(
	input in,
	output logic [width-1:0] out
);

assign out = in;

endmodule : zext
