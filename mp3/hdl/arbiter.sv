module arbiter
(
    input clk,
    input rst,
	 
	 //from mainmem/L2
	 input [255:0] rdata_L2,
	 input resp_L2,
	 
	 //from I-cache
	 input read_I,
	 input rv32i_word addr_I,
	 input write_I,
	 input [255:0] wdata_I,
	 
	 //from D-cache
	 input read_D,
	 input rv32i_word addr_D,
	 input write_D,
	 input [255:0] wdata_D,
	 
	 //to mainmem/L2
	 output read_L2,
	 output write_L2,
	 output rv32i_word addr_L2,
	 output [255:0] wdata_L2,
	 
	 //to I-cache
	 output [255:0] rdata_I,
	 output arb_resp_I,
	 
	 //to D-cache
	 output [255:0] rdata_D,
	 output arb_resp_D
	 
);

logic instr_access;
logic data_access;

assign instr_access = read_I | write_I;
assign data_access = read_D | write_D;

enum int unsigned {
    /* List of states */
	 RESET,
	 READY,
	 ACCESS_I_CACHE,
	 ACCESS_D_CACHE
} state, next_state;

always_comb
begin : state_actions
	read_L2 = 0;
	write_L2 = 0;
	addr_L2 = 32'b0;
	wdata_L2 = 256'b0;
	rdata_I = 256'b0;
	rdata_D = 256'b0;
	arb_resp_I = 0;
	arb_resp_D = 0;
	unique case (state)
	RESET:
		begin
		end
	READY:
		begin
		end
	ACCESS_I_CACHE:
		begin
			read_L2 = read_I;
			write_L2 = write_I;
			addr_L2 = addr_I;
			wdata_L2 = wdata_I;
			arb_resp_I = resp_L2;
			rdata_I = rdata_L2;
		end
		ACCESS_D_CACHE:
		begin
			read_L2 = read_D;
			write_L2 = write_D;
			addr_L2 = addr_D;
			wdata_L2 = wdata_D;
			arb_resp_D = resp_L2;
			rdata_D = rdata_L2;
		end
		default:
			begin
			end
	endcase
end

always_comb
begin : next
	next_state = state;
	unique case (state)
	RESET:
		begin
			next_state = READY;
		end
	READY:
		begin
		if (instr_access)
			next_state = ACCESS_I_CACHE;
		else if (data_access)
			next_state = ACCESS_D_CACHE;
		else
			next_state = READY;
		end
	ACCESS_I_CACHE:
		begin
		if(resp_L2)
			next_state = READY;
		else
			next_state = ACCESS_I_CACHE;
		end
	ACCESS_D_CACHE:
		begin
		if(resp_L2)
			next_state = READY;
		else
			next_state = ACCESS_D_CACHE;
		end
	endcase
end

always_ff @(posedge clk)
begin
	if (rst)
		state <= RESET;
	else
		state <= next_state;
end

endmodule : arbiter

