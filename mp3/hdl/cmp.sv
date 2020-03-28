import rv32i_types::*;

module cmp
(
    input branch_funct3_t cmpop,
    input rv32i_word a,
    input rv32i_word b,
    output logic f
);

always_comb
begin
    case (cmpop)
        beq:  f = a == b ? 1'b1 : 1'b0;
        bne:  f = a != b ? 1'b1 : 1'b0;
        blt:  f = $signed(a) < $signed(b) ? 1'b1 : 1'b0;
        bge:  f = $signed(a) >= $signed(b) ? 1'b1 : 1'b0;
        bltu:  f = $unsigned(a) < $unsigned(b) ? 1'b1 : 1'b0;
        bgeu:  f = $unsigned(a) >= $unsigned(b) ? 1'b1 : 1'b0;
    endcase
end

endmodule : cmp
