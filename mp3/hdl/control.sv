import rv32i_types::*;

module control_rom
(
    input rv32i_opcode opcode,
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    output rv32i_control_word ctrl
);

branch_funct3_t branch_funct3;
store_funct3_t store_funct3;
load_funct3_t load_funct3;
arith_funct3_t arith_funct3;
alu_ops alu_op3;

assign arith_funct3 = arith_funct3_t'(funct3);
assign branch_funct3 = branch_funct3_t'(funct3);
assign load_funct3 = load_funct3_t'(funct3);
assign store_funct3 = store_funct3_t'(funct3);
assign alu_op3 = alu_ops'(funct3);

always_comb
begin
    /* Default assignments */
    ctrl.opcode = opcode;
    ctrl.load_regfile = 1'b0;
	 ctrl.load_pc = 1'b0;
	 ctrl.mem_read = 1'b0;
    ctrl.mem_write = 1'b0;
    ctrl.pcmux_sel = pcmux::pc_plus4;
    ctrl.cmpop = branch_funct3;
    ctrl.alumux1_sel = alumux::rs1_out;
    ctrl.alumux2_sel = alumux::i_imm;
    ctrl.regfilemux_sel = regfilemux::alu_out;
	 ctrl.cmpmux_sel = cmpmux::rs2_out;
    ctrl.aluop = alu_ops'(funct3);
	 ctrl.store_type = store_funct3;
	 ctrl.r_mask = 4'b0;
	 ctrl.w_mask = 4'b0;
	 ctrl.load_type = load_funct3;
    /* Assign control signals based on opcode */
    case(opcode)
        op_auipc: begin
            ctrl.aluop = alu_add;
				ctrl.alumux1_sel = alumux::pc_out;
				ctrl.alumux2_sel = alumux::u_imm;
				ctrl.load_regfile = 1'b1;
        end

        /* ... other opcodes ... */
			
		op_lui: begin
          ctrl.load_regfile = 1'b1;
          ctrl.load_pc = 1'b1;
          ctrl.regfilemux_sel = regfilemux::u_imm;
        end
        op_load: begin
          ctrl.aluop = alu_add;
          ctrl.load_regfile = 1'b1;
          case(load_funct3)
			 //MUST CHANGE STORE_TYPE LATER FOR LW,LHU,LH, etc....
            lw: begin
				ctrl.regfilemux_sel = regfilemux::lw;
				ctrl.store_type = 2'b00;
				ctrl.r_mask = 4'b1111;
				end
            lh: begin
				ctrl.regfilemux_sel = regfilemux::lh;
				ctrl.store_type = 2'b00;
				ctrl.r_mask = 4'b0011;
				end
            lhu: begin
				ctrl.regfilemux_sel = regfilemux::lhu;
				ctrl.store_type = 2'b00;
				ctrl.r_mask = 4'b0011;
				end
            lb: begin
				ctrl.regfilemux_sel = regfilemux::lb;
				ctrl.store_type = 2'b00;
				ctrl.r_mask = 4'b0001;
				end
            lbu: begin
				ctrl.regfilemux_sel = regfilemux::lbu;
				ctrl.store_type = 2'b00;
				ctrl.r_mask = 4'b0001;
				end
          endcase
			 ctrl.mem_read = 1'b1;
          ctrl.load_pc = 1'b1;
          // load_mar = 1'b1;
          // ctrl.marmux_sel = marmux::alu_out;
        end
        op_store: begin
          case (store_funct3)
            sw: ctrl.store_type = 2'b00;
            sh: ctrl.store_type = 2'b01;
            sb: ctrl.store_type = 2'b10;
            default: ctrl.store_type = 2'b00;
          endcase
          ctrl.alumux2_sel = alumux::s_imm;
          ctrl.aluop = alu_add;
          // load_mar = 1'b1;
          ctrl.mem_write = 1'b1;
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
          case(arith_funct3)
            add: begin
              case (funct7)
                7'b0100000: ctrl.aluop = alu_sub;
                7'b0000000: ctrl.aluop = alu_add;
                default: ctrl.aluop = alu_add;
              endcase
              ctrl.alumux2_sel = alumux::rs2_out;
              ctrl.load_regfile = 1'b1;
              ctrl.load_pc = 1'b1;
            end
            slt: begin
              ctrl.load_regfile = 1'b1;
              ctrl.load_pc = 1'b1;
              ctrl.cmpop = blt;
              ctrl.regfilemux_sel = regfilemux::br_en;
              ctrl.alumux2_sel = alumux::rs2_out;
              ctrl.cmpmux_sel = cmpmux::rs2_out;
            end
            sltu: begin
              ctrl.load_regfile = 1'b1;
              ctrl.load_pc = 1'b1;
              ctrl.cmpop = bltu;
              ctrl.regfilemux_sel = regfilemux::br_en;
              ctrl.alumux2_sel = alumux::rs2_out;
              ctrl.cmpmux_sel = cmpmux::rs2_out;
            end
            sr: begin
              ctrl.load_regfile = 1'b1;
              ctrl.load_pc = 1'b1;
              ctrl.alumux2_sel = alumux::rs2_out;
              case(funct7)
                7'b0100000: ctrl.aluop = alu_sra;
                7'b0000000: ctrl.aluop = alu_srl;
                default: ctrl.aluop = alu_sra;
              endcase
            end
            default: begin
              ctrl.alumux2_sel = alumux::rs2_out;
              ctrl.load_regfile = 1'b1;
              ctrl.load_pc = 1'b1;
              ctrl.aluop = alu_ops'(funct3);
            end
          endcase
        end
        op_br: begin
          // ctrl.pcmux_sel = br_en ? pcmux::alu_out : pcmux::pc_plus4;
          ctrl.pcmux_sel = pcmux::alu_out;
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
