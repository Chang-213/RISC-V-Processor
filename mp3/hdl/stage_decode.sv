module stage_decode
(
    input clk,
    input rst,
    input inst_resp,
	 input data_resp,
	 input data_read,
	 input data_write,
    output logic load_decode,
    output logic load_execute,
    output logic load_memory,
	 output logic load_writeback
);

logic data_decode;
logic data_execute;
logic data_memory;
logic data_writeback;

always_ff @(posedge clk)
begin
    if (rst)
    begin
      data_decode <= 1'b0;
		data_execute <= 1'b0;
		data_memory <= 1'b0;
		data_writeback <= 1'b0;
    end 
	if (data_read && !data_resp)
    begin
				data_decode <= 1'b0;
				data_execute <= 1'b0;
				data_memory <= 1'b0;
				data_writeback <= 1'b0;
    end
	else if (data_read && data_resp)
    begin
				data_execute <= 1'b1;
			if(data_execute)
				data_memory <= 1'b1;
			if(data_memory)
				data_writeback <= 1'b1;
    end
	 if (data_write && !data_resp)
    begin
				data_decode <= 1'b0;
				data_execute <= 1'b0;
				data_memory <= 1'b0;
				data_writeback <= 1'b0;
    end
	else if (data_write && data_resp)
    begin
				data_execute <= 1'b1;
			if(data_execute)
				data_memory <= 1'b1;
			if(data_memory)
				data_writeback <= 1'b1;
    end
	if (inst_resp)
    begin
				data_execute <= 1'b1;
			if(data_execute)
				data_memory <= 1'b1;
			if(data_memory)
				data_writeback <= 1'b1;
    end
	else
	begin
		     data_decode <= 0;
			 if(data_decode == 0)
				data_execute <= 1'b0;
			if(data_execute == 0)
				data_memory <= 1'b0;
			if(data_memory == 0)
				data_writeback <= 1'b0;
	end
		
end

always_comb
	begin
		if (data_read && !data_resp)
			begin
				load_decode = 1'b0;
				load_execute = 1'b0;
				load_memory = 1'b0;
				load_writeback = 1'b0;
			end
		else if (data_write && !data_resp)
			begin
				load_decode = 1'b0;
				load_execute = 1'b0;
				load_memory = 1'b0;
				load_writeback = 1'b0;
			end
		else if (!data_read && !data_resp)
			begin
				load_decode = 1'b1;	//formerly inst_resp
				load_execute = 1'b1;
				load_memory = 1'b1;
				load_writeback = 1'b1;
			end
		
		else if (!data_write && !data_resp)
			begin
				load_decode = inst_resp;
				load_execute = 1'b1;
				load_memory = 1'b1;
				load_writeback = 1'b1;
			end
		else
			begin
				load_decode = 1'b1; //inst_resp;
				load_execute = 1'b1; //data_execute;
				load_memory = 1'b1; //data_memory;
				load_writeback = 1'b1; //data_writeback;
			end
	end
endmodule : stage_decode