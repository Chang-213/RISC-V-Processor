module stage_writeback
(
    input clk,
    input rst,
    input inst_resp,
	 input data_resp,
	 input data_read,
	 input data_write,
    output logic load_writeback
);

logic data_writeback;

always_ff @(posedge clk)
begin
    if (rst)
    begin
      data_writeback <= 1'b0;
    end
    else if (inst_resp & data_resp)
    begin
      data_writeback <= 1'b1;
    end
	else
	begin
		data_writeback <= 1'b0;
	end
end

always_comb
	begin
		load_writeback = data_writeback;
	end

endmodule : stage_writeback

