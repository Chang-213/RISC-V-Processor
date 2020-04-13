module stage_memory
(
    input clk,
    input rst,
    input inst_resp,
	 input data_resp,
	 input data_read,
	 input data_write,
    output logic load_memory
);

logic data_memory;

always_ff @(posedge clk)
begin
    if (rst)
    begin
      data_memory <= 1'b0;
    end
    else if (inst_resp & data_resp)
    begin
      data_memory <= 1'b1;
    end
	else
	begin
		data_memory <= 1'b0;
	end
end

always_comb
	begin
		load_memory = data_memory;
	end

endmodule : stage_memory
