import rv32i_types::*;

module opcode_reg 
(
    input clk,
    input rst,
    input load,
    input rv32i_opcode in,
    output rv32i_opcode out
);

rv32i_opcode data = rv32i_opcode'(7'b0010011);

always_ff @(posedge clk)
begin
    if (rst)
    begin
        data <= rv32i_opcode'(7'b0010011);
    end
    else if (load)
    begin
        data <= in;
    end
    else
    begin
        data <= data;
    end
end

always_comb
begin
    out = data;
end

endmodule : opcode_reg
