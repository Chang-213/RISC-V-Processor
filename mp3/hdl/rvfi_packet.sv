import rv32i_types::*;

module rvfi_reg_start
(
    input clk,
    input rst,
    input load,
	 input flush,
    input RVFIMonPacket in1,
	 input rv32i_word pcmux_out,
    output RVFIMonPacket out1
);

RVFIMonPacket data;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        data.instruction <= '0;
		  data.rs1 <= '0;
		  data.rs2 <= '0;
		  data.rs1_data <= '0;
		  data.rs2_data <= '0;
		  data.load_regfile <= '0;
		  data.rd <= '0;
		  data.rd_wdata <= '0;
		  data.pc_rdata <= '0;
		  data.pc_wdata <= '0;
		  data.mem_addr <= '0;
		  data.mem_rmask <= '0;
		  data.mem_wmask <= '0;
		  data.mem_rdata <= '0;
		  data.mem_wdata <= '0;
		  data.commit <= 0;
    end
    else if (load & flush)
    begin
        data <= in1;
		  data.pc_wdata <= pcmux_out;
		  data.commit <= 0;
		  data.instruction <= '0;
    end
	 else if (load & !flush)
	 begin
		  data <= in1;
		  data.pc_wdata <= pcmux_out;
	 end
    else
    begin
        data <= data;
    end
end

always_comb
begin
    out1 = data;
//	 if (rst)
//	 begin
//	 out1.pc_rdata = in1.pc_rdata;
//	 end
end

endmodule : rvfi_reg_start

module rvfi_reg
(
    input clk,
    input rst,
    input load,
	 input flush,
    input RVFIMonPacket in1,
    output RVFIMonPacket out1
);

RVFIMonPacket data;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        data.instruction <= '0;
		  data.rs1 <= '0;
		  data.rs2 <= '0;
		  data.rs1_data <= '0;
		  data.rs2_data <= '0;
		  data.load_regfile <= '0;
		  data.rd <= '0;
		  data.rd_wdata <= '0;
		  data.pc_rdata <= '0;
		  data.pc_wdata <= '0;
		  data.mem_addr <= '0;
		  data.mem_rmask <= '0;
		  data.mem_wmask <= '0;
		  data.mem_rdata <= '0;
		  data.mem_wdata <= '0;
		  data.commit <= 0;
    end
    else if (load & flush)
    begin
        data <= in1;
		  data.commit <= 0;
		  data.instruction <= '0;
    end
	 else if (load & !flush)
	 begin
		  data <= in1;
	 end
    else
    begin
        data <= data;
    end
end

always_comb
begin
    out1 = data;
//	 if (rst)
//	 begin
//	 out1.pc_rdata = in1.pc_rdata;
//	 end
end

endmodule : rvfi_reg

module rvfi_reg_e
(
    input clk,
    input rst,
    input load,
	 input flush,
    input RVFIMonPacket in1,
	 input stall,
    output RVFIMonPacket out1
);

RVFIMonPacket data;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        data.instruction <= '0;
		  data.rs1 <= '0;
		  data.rs2 <= '0;
		  data.rs1_data <= '0;
		  data.rs2_data <= '0;
		  data.load_regfile <= '0;
		  data.rd <= '0;
		  data.rd_wdata <= '0;
		  data.pc_rdata <= '0;
		  data.pc_wdata <= '0;
		  data.mem_addr <= '0;
		  data.mem_rmask <= '0;
		  data.mem_wmask <= '0;
		  data.mem_rdata <= '0;
		  data.mem_wdata <= '0;
		  data.commit <= 0;
    end
	 else if (stall)
	 begin
	 data <= in1;
	 data.instruction <= '0;
	 end
    else if (load & flush)
    begin
        data <= in1;
		  data.commit <= 0;
		  data.instruction <= '0;
    end
	 else if (load & !flush)
	 begin
		  data <= in1;
	 end
    else
    begin
        data <= data;
    end
end

always_comb
begin
    out1 = data;
end

endmodule : rvfi_reg_e

module rvfi_reg_out
(
    input clk,
    input rst,
	 input load,
	 input flush,
    input RVFIMonPacket in1,
	 input rv32i_word	in2,
	 input logic stall_decode,
    output RVFIMonPacket out1
);

RVFIMonPacket data;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        data.instruction <= '0;
		  data.rs1 <= '0;
		  data.rs2 <= '0;
		  data.rs1_data <= '0;
		  data.rs2_data <= '0;
		  data.load_regfile <= '0;
		  data.rd <= '0;
		  data.rd_wdata <= '0;
		  data.pc_rdata <= '0;
		  data.pc_wdata <= '0;
		  data.mem_addr <= '0;
		  data.mem_rmask <= '0;
		  data.mem_wmask <= '0;
		  data.mem_rdata <= '0;
		  data.mem_wdata <= '0;
    end
	 else if (load && in1.instruction != '0)
	 begin
			data <= in1;
			data.commit <= 1;
			//data.mem_wdata <= data_wdata;
	 end
    else if (load)
    begin
        data <= in1;
		  //data.mem_wdata <= data_wdata;
    end
    else
    begin
        data <= data;
    end
end

always_comb
begin
    out1 = data;
	 if(data.rd != '0)
	 out1.rd_wdata = in2;
	 if(load == '0 || (data.instruction == in1.instruction) )
	 out1.commit = 0;

end

endmodule : rvfi_reg_out
