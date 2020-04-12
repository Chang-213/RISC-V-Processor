//Lower Level Required Mechanisms
module mux4bit #(parameter width = 32)
(
	input clk,
   input rst,
   input [1:0] select,
   input  [width-1:0] in0, in1, in2, in3,
   output logic [width-1:0] out
);

always_comb
	begin
		if(select == 2'b00)
			out = in0;
		else if (select == 2'b01)
			out = in1;
		else if (select == 2'b10)
			out = in2;
		else
			out = in3;
	end
endmodule : mux4bit

module mux2bit #(parameter width = 32)
(
	input clk,
   input rst,
   input logic select,
   input  [width-1:0] in0, in1,
   output logic [width-1:0] out
);

always_comb
	begin
		if(select == 1)
			out = in0;
		else
			out = in1;
	end
endmodule : mux2bit

module mux3bit #(parameter width = 256)
(
	input clk,
   input rst,
   input [2:0] select,
   input  [width-1:0] in0, in1, in2, in3,
   output logic [width-1:0] out
);

always_comb
	begin
		if(select == 3'b000)
			out = in0;
		else if (select == 3'b001)
			out = in1;
		else if (select == 3'b101)
			out = in2;
		else
			out = in3;
	end
endmodule : mux3bit

module mux256bit #(parameter width = 256)
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
endmodule : mux256bit

module comparator #(parameter width = 24)
(
	input clk,
   input rst,
   input  [width-1:0] in0, in1,
   output logic out
);

always_comb
	begin
		if(in0 == in1)
			out = 1;
		else
			out = 0;
	end
endmodule : comparator

module andgate #(parameter width = 24)
(
	input clk,
   input rst,
   input  [width-1:0] in0, in1,
   output logic out
);

always_comb
	begin
		if(in0 == 1 && in1 == 1)
			out = 1;
		else
			out = 0;
	end
endmodule : andgate

module orgate #(parameter width = 24)
(
	input clk,
   input rst,
   input  [width-1:0] in0, in1,
   output logic out
);

always_comb
	begin
		if(in0 == 0 && in1 == 0)
			out = 0;
		else
			out = 1;
	end
endmodule : orgate
