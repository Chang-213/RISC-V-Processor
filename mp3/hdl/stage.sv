import rv32i_types::*;

module stage
(
    input clk,
    input rst,
    input inst_resp,
	 input data_resp,
	 input data_read,
	 input data_write,
    output load_decode,
    output load_execute,
    output load_memory,
	 output load_writeback
);

logic data;

initial
begin
	data = 1'b0;
end

always_ff @(posedge clk)
begin
    if (rst)
    begin
        load_decode <= data;
		load_execute <= data;
		load_memory <= data;
		load_writeback <= data;
    end
    else if (inst_resp & !data_read & !data_write)
    begin
        load_decode <= 1'b1;
		load_execute <= 1'b0;
		load_memory <= 1'b0;
		load_writeback <= 1'b0;
    end
    else if (!data_read & !data_write & !inst_resp)
    begin
        load_decode <= 1'b0;
		load_execute <= 1'b1;
		load_memory <= 1'b0;
		load_writeback <= 1'b0;
    end
	else if (data_resp & !data_read & !data_write)
    begin
        load_decode <= 1'b0;
		load_execute <= 1'b0;
		load_memory <= 1'b1;
		load_writeback <= 1'b0;
    end
	else if (!data_read & !data_write & !data_resp)
    begin
        load_decode <= 1'b0;
		load_execute <= 1'b0;
		load_memory <= 1'b0;
		load_writeback <= 1'b1;
    end
	else
	begin
		load_decode <= 1'b0;
		load_execute <= 1'b0;
		load_memory <= 1'b0;
		load_writeback <= 1'b0;
	end
end

endmodule : stage

