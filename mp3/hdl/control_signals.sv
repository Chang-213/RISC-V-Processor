import rv32i_types::*;

module control_signal_reg #(parameter width = 32)
(
    input clk,
    input rst,
    input load,
    input rv32i_control_word in,
    output rv32i_control_word out
);

logic [width-1:0] data = 1'b0;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        data <= '0;
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

endmodule : control_signal_reg
