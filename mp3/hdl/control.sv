import rv32i_types::*;

module control_rom
(
    input rv32i_opcode opcode,
    /* ... other inputs ... */
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    input logic br_en,
    input logic [4:0] rs1,
    input logic [4:0] rs2,

    input mem_resp,

    output rv32i_control_word ctrl
);

// logic [4:0] rs1_addr, rs2_addr;

branch_funct3_t branch_funct3;
store_funct3_t store_funct3;
load_funct3_t load_funct3;
arith_funct3_t arith_funct3;

assign arith_funct3 = arith_funct3_t'(funct3);
assign branch_funct3 = branch_funct3_t'(funct3);
assign load_funct3 = load_funct3_t'(funct3);
assign store_funct3 = store_funct3_t'(funct3);
// assign rs1_addr = rs1;
// assign rs2_addr = rs2;


always_comb
begin
    /* Default assignments */
    ctrl.opcode = opcode;
    ctrl.load_regfile = 1'b0;
    /* ... other defaults ... */
    ctrl.load_pc = 1'b0;
    ctrl.load_data_out = 1'b0;
    ctrl.pcmux_sel = pcmux::pc_plus4;
    ctrl.cmpop = branch_funct3;
    ctrl.alumux1_sel = alumux::rs1_out;
    ctrl.alumux2_sel = alumux::i_imm;
    ctrl.regfilemux_sel = regfilemux::alu_out;
    // ctrl.marmux_sel = marmux::pc_out;
    ctrl.cmpmux_sel = cmpmux::rs2_out;
    ctrl.aluop = alu_ops'(funct3);
    // ctrl.mem_byte_enable = 4'b1111;
    // ctrl.mem_write = 1'b0;
    // ctrl.mem_read = 1'b0;
    ctrl.store_type = 2'b00;

    /* Assign control signals based on opcode */
    case(opcode)
        op_auipc: begin
            ctrl.aluop = alu_add;
        end

        /* ... other opcodes ... */
        op_lui: begin
          ctrl.load_regfile = 1'b1;
          ctrl.load_pc = 1'b1;
          ctrl.regfilemux_sel = regfilemux::u_imm;
        end
        op_load: begin
          ctrl.aluop = alu_add;
          // load_mar = 1'b1;
          // ctrl.marmux_sel = marmux::alu_out;
        end
        op_store: begin
          case (store_funct3)
            sw: store_type = 2'b00;
            sh: store_type = 2'b01;
            sb: store_type = 2'b10;
            default: store_type = 2'b00;
          endcase
          ctrl.alumux2_sel = alumux::s_imm;
          ctrl.aluop = alu_add;
          // load_mar = 1'b1;
          ctrl.load_data_out = 1'b1;
          // marmux_sel = marmux::alu_out;
        end
        op_imm: begin
           case (arith_funct3)
            slt:
            begin
              ctrl.load_regfile = 1'b1;
              ctrl.load_pc = 1'b1;
              ctrl.cmpop = blt;
              ctrl.regfilemux_sel = regfilemux::br_en;
              ctrl.cmpmux_sel = cmpmux::i_imm;
            end
            sltu:
            begin
              ctrl.load_regfile = 1'b1;
              ctrl.load_pc = 1'b1;
              ctrl.cmpop = bltu;
              ctrl.regfilemux_sel = regfilemux::br_en;
              ctrl.cmpmux_sel = cmpmux::i_imm;
            end
            sr:
            begin
              ctrl.load_regfile = 1'b1;
              ctrl.load_pc = 1'b1;
              case(funct7)
                7'b0100000: ctrl.aluop = alu_sra;
                7'b0000000: ctrl.aluop = alu_srl;
                default: ctrl.aluop = alu_sra;
              endcase
            end
            default:
            begin
              ctrl.load_regfile = 1'b1;
              ctrl.load_pc = 1'b1;
              ctrl.aluop = alu_ops'(funct3);
            end
          endcase
        end
        op_reg: begin

        end
        op_br: begin
          ctrl.pcmux_sel = br_en ? pcmux::alu_out : pcmux::pc_plus4;
          ctrl.load_pc = 1'b1;
          ctrl.alumux1_sel = alumux::pc_out;
          ctrl.alumux2_sel = alumux::b_imm;
          ctrl.aluop = alu_add;
        end
        default: begin
            ctrl = 0;   /* Unknown opcode, set control word to zero */
        end
    endcase
end
endmodule : control_rom
