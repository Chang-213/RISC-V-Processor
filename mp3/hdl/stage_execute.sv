module stage_execute
(
    input clk,
    input rst,
    input inst_resp,
	 input data_resp,
	 input data_read,
	 input data_write,
    output logic load_execute
);

logic data_execute;

always_ff @(posedge clk)
begin
    if (rst)
    begin
      data_execute <= 1'b0;
    end
    else if (inst_resp & data_resp)
    begin
      data_execute <= 1'b1;
    end
	else
	begin
		data_execute <= 1'b0;
	end
end

always_comb
	begin
		load_execute = data_execute;
	end

endmodule : stage_execute

