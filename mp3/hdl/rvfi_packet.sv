import rv32i_types::*;

module rvfi_reg
(
    input clk,
    input rst,
    input load,
    input RVFIMonPacket in1,
    output RVFIMonPacket out1
);

RVFIMonPacket data;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        data <= '0;
    end
    else if (load)
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

endmodule : rvfi_reg

module rvfi_reg_out
(
    input clk,
    input rst,
	 input load,
    input RVFIMonPacket in1,
	 input rv32i_word	in2,
    output RVFIMonPacket out1
);

always_ff @(posedge clk)
begin
    if (rst)
    begin
        out1 <= '0;
    end
    else if (load)
    begin
        out1 <= in1;
		  out1.rd_wdata <= in2;
    end
end

endmodule : rvfi_reg_out
