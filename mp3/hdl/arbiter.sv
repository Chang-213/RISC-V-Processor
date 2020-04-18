import rv32i_types::*;
module arbiter
(
    input clk,
    input rst,
	 
	 //from mainmem/L2
	 input logic [255:0] rdata_L2,
	 input logic resp_L2,
	 
	 //from I-cache
	 input logic read_I,
	 input rv32i_word addr_I,
	 input logic write_I,
	 input logic [255:0] wdata_I,
	 
	 //from D-cache
	 input logic read_D,
	 input rv32i_word addr_D,
	 input logic write_D,
	 input logic [255:0] wdata_D,
	 
	 //to mainmem/L2
	 output logic read_L2,
	 output logic write_L2,
	 output rv32i_word addr_L2,
	 output logic [255:0] wdata_L2,
	 
	 //to I-cache
	 output logic [255:0] rdata_I,
	 output logic arb_resp_I,
	 
	 //to D-cache
	 output logic [255:0] rdata_D,
	 output logic arb_resp_D
	 
);

rv32i_word addr_D_reg_out;
rv32i_word addr_I_reg_out;
logic read_I_reg_out;
logic read_D_reg_out;
logic write_D_reg_out;
logic write_I_reg_out;
logic [255:0] wdata_D_reg_out;

//rv32i_word addr_D_reg_out_in;
//rv32i_word addr_I_reg_out_in;
//rv32i_word read_I_reg_out_in;
//rv32i_word read_D_reg_out_in;
//rv32i_word write_D_reg_out_in;
//rv32i_word write_I_reg_out_in;
//rv32i_word wdata_D_reg_out_in;

logic [255:0] rdata_L2_reg;

logic read_L2_in;
logic write_L2_in;
rv32i_word addr_L2_in;
logic [255:0] wdata_L2_in;

logic instr_access;
logic data_access;
assign instr_access = read_I | write_I;
assign data_access = read_D | write_D;

 always_ff @ (posedge clk)
    begin
        if (rst)
        begin
			read_L2_in <= 1'b0;
			write_L2_in <= 1'b0;
			addr_L2_in <= 1'b0;
			wdata_L2_in <= 1'b0;
        end
        else 
        begin
		   read_L2_in <= read_L2;
			write_L2_in <= write_L2;
			addr_L2_in <= addr_L2;
			wdata_L2_in <= wdata_L2;
        end
    end
	 
//	 always_comb
//    begin
//		addr_D_reg_out = addr_D_reg_out_in;
//		addr_I_reg_out = addr_I_reg_out_in;
//		read_I_reg_out = read_I_reg_out_in;
//		read_D_reg_out = read_D_reg_out_in;
//		write_D_reg_out = write_D_reg_out_in;
//		write_I_reg_out = write_I_reg_out_in;
//		wdata_D_reg_out = wdata_D_reg_out_in;
//	 end

register #(1) read_I_reg(
	.clk (clk),
   .rst (rst),
   .load (1'b1),
   .in   (read_I),
   .out  (read_I_reg_out)
);

register #(1) read_D_reg(
	.clk (clk),
   .rst (rst),
   .load (1'b1),
   .in   (read_D),
   .out  (read_D_reg_out)
);

register #(1) write_I_reg(
	.clk (clk),
   .rst (rst),
   .load (1'b1),
   .in   (write_I),
   .out  (write_I_reg_out)
);

register #(1) write_D_reg(
	.clk (clk),
   .rst (rst),
   .load (1'b1),
   .in   (write_D),
   .out  (write_D_reg_out)
);

register addr_I_reg(
	.clk (clk),
   .rst (rst),
   .load (1'b1),
   .in   (addr_I),
   .out  (addr_I_reg_out)
);

register addr_D_reg(
	.clk (clk),
   .rst (rst),
   .load (1'b1),
   .in   (addr_D),
   .out  (addr_D_reg_out)
);

register wdata_D_reg(
	.clk (clk),
   .rst (rst),
   .load (1'b1),
   .in   (addr_D),
   .out  (wdata_D_reg_out)
);

enum int unsigned {
    /* List of states */
	 READY,
	 ACCESS_I_CACHE,
	 ACCESS_D_CACHE,
	 WAITING,
	 WAITING2,
	 WAITING3
} state, next_state;

register_comb #(256) rdata_L2_save(
	.clk (clk),
   .rst (rst),
   .load (resp_L2),
   .in   (rdata_L2),
   .out  (rdata_L2_reg)
);

always_comb
begin : state_actions
	read_L2 = 0;
	write_L2 = 0;
	addr_L2 = 0;
	wdata_L2 = 0;
	rdata_I = 256'b0;
	rdata_D = rdata_L2_reg; //formerly 0
	arb_resp_I = 0;
	arb_resp_D = 0;
	unique case (state)
	READY:
		begin
		end
	ACCESS_I_CACHE:
		begin
			read_L2 = read_I;
			write_L2 = write_I;
			addr_L2 = addr_I;
			wdata_L2 = wdata_I;
			if(resp_L2)
			begin
				arb_resp_I = resp_L2;
				rdata_I = rdata_L2;
			end
		end
		ACCESS_D_CACHE:
		begin
			read_L2 = read_D;
			write_L2 = write_D;
			addr_L2 = addr_D;
			wdata_L2 = wdata_D;
			if(resp_L2)
			begin
				arb_resp_D = resp_L2;
				//rdata_D = rdata_L2;
			end
		end
		WAITING:
		begin
			read_L2 = read_D;
			write_L2 = write_D;
			addr_L2 = addr_D;
			wdata_L2 = wdata_D;
			if(resp_L2)
			begin
				arb_resp_D = resp_L2;
				//rdata_D = rdata_L2;
			end
		end
		WAITING2:
		begin
		end
		WAITING3:
		begin
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
	READY:
		begin
		if (data_access)
			next_state = ACCESS_D_CACHE;
		else if (instr_access)
			next_state = ACCESS_I_CACHE;
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
		if(resp_L2 && data_access)
			next_state = WAITING;
		else
			next_state = ACCESS_D_CACHE;
		end
	WAITING:
	begin
		if(data_access)
			next_state = ACCESS_D_CACHE;
		else
		next_state = READY;
	end
//	WAITING2:
//	begin
//		next_state = WAITING3;
//	end
//	WAITING3:
//	begin
//	if(data_access)
//			next_state = ACCESS_D_CACHE;
//	else
//			next_state = READY;
//	end
	endcase
end

always_ff @(posedge clk)
begin
	if (rst)
		state <= READY;
	else
		state <= next_state;
end

endmodule : arbiter

