//load

module lh #(parameter width = 32)
(
   input [width-1:0] in0,
	input [1:0] select,
   output logic [width-1:0] out
);

always_comb
	begin
		if(select == 2'b00)
			begin
				out = $signed(in0[15:0]);
			end
		else if (select == 2'b01)
			begin
				out = {{16{in0[23]}},in0[23:8]};
			end
    else if (select == 2'b10)
      begin
        out = {{16{in0[31]}},in0[31:16]};
      end
    else
      begin
        out = {24'b0,in0[31:24]};
      end
	end
endmodule : lh

module lhu #(parameter width = 32)
(
   input [width-1:0] in0,
	input [1:0] select,
   output logic [width-1:0] out
);

always_comb
	begin
  if(select == 2'b00)
    begin
      out = in0[15:0];
    end
  else if (select == 2'b01)
    begin
      out = in0[23:8];
    end
  else if (select == 2'b10)
    begin
      out = in0[31:16];
    end
  else
    begin
      out = in0[31:24];
    end
	end
endmodule : lhu

module lb #(parameter width = 32)
(
   input [width-1:0] in0,
	input [1:0] select,
   output logic [width-1:0] out
);

always_comb
	begin
  if(select == 2'b00)
    begin
      out = {{24{in0[7]}},in0[7:0]};
    end
  else if (select == 2'b01)
    begin
      out = {{24{in0[15]}},in0[15:8]};
    end
  else if (select == 2'b10)
    begin
      out = {{24{in0[23]}},in0[23:16]};
    end
  else
    begin
      out = {{24{in0[31]}},in0[31:24]};
    end

	end
endmodule : lb

module lbu #(parameter width = 32)
(
   input [width-1:0] in0,
	input [1:0] select,
   output logic [width-1:0] out
);

always_comb
	begin
  if(select == 2'b00)
    begin
      out = in0[7:0];
    end
  else if (select == 2'b01)
    begin
      out = in0[15:8];
    end
  else if (select == 2'b10)
    begin
      out = in0[23:16];
    end
  else
    begin
      out = in0[31:24];
    end
	end
endmodule : lbu

module lw #(parameter width = 32)
(
   input [width-1:0] in0,
	input [1:0] select,
   output logic [width-1:0] out
);

always_comb
	begin
  if(select == 2'b00)
    begin
      out = in0;
    end
  else if (select == 2'b01)
    begin
      out = in0[31:8];
    end
  else if (select == 2'b10)
    begin
      out = in0[31:16];
    end
  else
    begin
      out = in0[31:24];
    end
	end
endmodule : lw
