//MUX used in datapath
module mux2 #(parameter width = 32)
(
	input clk,
   input rst,
   input select,
   input [width-1:0] in0, in1,
   output logic [width-1:0] out
);

always_comb
	begin
		if(select == 0)
			out = in0;
		else
			out = in1;
	end
endmodule : mux2

//used exclusively for PCMUX
module mux3 #(parameter width = 32)
(
	input clk,
   input rst,
   input [1:0] select,
   input [width-1:0] in0, in1, in2,
   output logic [width-1:0] out
);

always_comb
	begin
		if (select == 2'b00)
			out = in0;
		else if (select == 2'b01)
			out = in1;
		else
			out = in2;
	end
endmodule : mux3

module mux4 #(parameter width = 32)
(
	input clk,
   input rst,
   input [1:0] select,
   input [width-1:0] in0, in1, in2, in3,
   output logic [width-1:0] out
);

always_comb
	begin
		case(select)
			2'b00: out = in0;
			2'b01: out = in1;
			2'b10: out = in2;
			2'b11: out = in3;
		endcase
	end
endmodule : mux4

module mux6 #(parameter width = 32)
(
	input clk,
   input rst,
   input [2:0] select,
   input [width-1:0] in0, in1, in2, in3, in4, in5,
   output logic [width-1:0] out
);

always_comb
	begin
		if (select == 3'b000)
			out = in0;
		else if (select == 3'b001)
			out = in1;
		else if (select == 3'b010)
			out = in2;
		else if (select == 3'b011)
			out = in3;
		else if (select == 3'b100)
			out = in4;
		else
			out = in5;
	end
endmodule : mux6

module mux9 #(parameter width = 32)
(
	input clk,
   input rst,
   input [3:0] select,
   input [width-1:0] in0, in1, in2, in3, in4, in5, in6, in7, in8,
   output logic [width-1:0] out
);

always_comb
	begin
		if (select == 4'b0000)
			out = in0;
		else if (select == 4'b0001)
			out = in1;
		else if (select == 4'b0010)
			out = in2;
		else if (select == 4'b0011)
			out = in3;
		else if (select == 4'b0100)
			out = in4;
		else if (select == 4'b0101)
			out = in5;
		else if (select == 4'b0110)
			out = in6;
		else if (select == 4'b0111)
			out = in7;
		else
			out = in8;
	end
endmodule : mux9
