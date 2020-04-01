`define BAD_MUX_SEL $fatal("%0t %s %0d: Illegal mux select", $time, `__FILE__, `__LINE__)

import rv32i_types::*;

module datapath
(
    input clk,
    input rst,

	 //Control to Datapath
	 //PC signals
	 input load_pc,
	 input load_pc_reg_d,
	 input load_pc_reg_e,
	 input load_pc_reg_m,
	 input load_pc_wb,

	 //IR signals
	 input load_ir,
	 input load_ir_d,
	 input load_ir_e,
	 input load_ir_m,
	 input load_ir_wb,
	 input load_ir_d_uimm,
	 input load_ir_e_uimm,
	 input load_ir_d_iimm,
	 input load_ir_e_iimm,
	 input load_ir_d_bimm,
	 input load_ir_e_bimm,
	 input load_ir_d_simm,
	 input load_ir_e_simm,
	 input load_ir_d_jimm,
	 input load_ir_e_jimm,
	 input rv32i_word mem_rdata,
	 output rv32i_opcode opcode,
   output rv32i_word alu_out,
	 output [2:0] funct3,
	 output [6:0] funct7,
	 output [4:0] rs1,
	 output [4:0] rs2,

	 //regfile signals
	 input load_regfile,
	 input load_rs1_reg,
	 input load_rs2_reg_e,
	 input load_rs2_reg_m,
	 input regfilemux::regfilemux_sel_t regfilemux_sel,

	 //ALU signals
	 input alu_ops aluop,
	 input load_alu_reg_m,
	 input load_alu_reg_wb,

	 //CMP signals
	 input load_cmp_reg_m,
	 input load_cmp_reg_wb,
	 input branch_funct3_t cmpop,

	 input load_data_out,
	 input pcmux::pcmux_sel_t pcmux_sel,
	 input alumux::alumux1_sel_t alumux1_sel,
	 input alumux::alumux2_sel_t alumux2_sel,
	 input marmux::marmux_sel_t marmux_sel,
	 input cmpmux::cmpmux_sel_t cmpmux_sel,
    input rv32i_control_word ctrl,

    output rv32i_word mem_wdata // signal used by RVFI Monitor
);
//PC values
rv32i_word pc_out;
rv32i_word pc_d_out;
rv32i_word pc_e_out;
rv32i_word pc_m_out;
rv32i_word pc_wb_out;
rv32i_word pc_plus4_out;
rv32i_word pcmux_out;

//IR values
rv32i_reg rd;
rv32i_word i_imm;
rv32i_word i_imm_d;
rv32i_word i_imm_e;
rv32i_word u_imm;
rv32i_word u_imm_d;
rv32i_word u_imm_e;
rv32i_word b_imm;
rv32i_word b_imm_d;
rv32i_word b_imm_e;
rv32i_word s_imm;
rv32i_word s_imm_d;
rv32i_word s_imm_e;
rv32i_word j_imm;
rv32i_word j_imm_d;
rv32i_word j_imm_e;
rv32i_word ir_d_out;
rv32i_word ir_e_out;
rv32i_word ir_m_out;
rv32i_word ir_wb_out;
rv32i_word mdrreg_out;

//Regfile values
rv32i_word rs1_out;
rv32i_word rs1_reg_out;
rv32i_word rs2_out;
rv32i_word rs2_reg_e_out;
rv32i_word rs2_reg_m_out;
rv32i_word regfilemux_out;

//ALU values
rv32i_word alumux1_out;
rv32i_word alumux2_out;
rv32i_word alu_reg_m;
rv32i_word alu_reg_out;

//CMP values
rv32i_word cmp_mux_out;
rv32i_word br_en_regmux;
rv32i_word cmp_m_out;
rv32i_word cmp_wb_out;

//LOAD values
rv32i_word lh_out;
rv32i_word lhu_out;
rv32i_word lb_out;
rv32i_word lbu_out;
rv32i_word lw_out;

//Data Cache
rv32i_word corrected;

rv32i_word mem_addr;

//PC AND PCMUX AND PCREG///////////////////////
pc_register PC(
    .clk  (clk),
    .rst (rst),
    .load (load_pc),
    .in   (pcmux_out),
    .out  (pc_out)
);

mux3 PCMUX(
	.clk,
	.rst,
	.select (pcmux_sel),
	.in0 (pc_out + 32'h00000004),
	.in1 (alu_out),
	.in2 ({alu_out[31:1], 1'b0}),
	.out (pcmux_out)
);

register PC_Reg_D(
	.clk (clk),
   .rst (rst),
   .load (load_pc_reg_d),
   .in   (pc_out),
   .out  (pc_d_out)
);

register PC_Reg_E(
	.clk (clk),
   .rst (rst),
   .load (load_pc_reg_e),
   .in   (pc_d_out),
   .out  (pc_e_out)
);

register PC_Reg_M(
	.clk (clk),
   .rst (rst),
   .load (load_pc_reg_m),
   .in   (pc_e_out),
   .out  (pc_m_out)
);

register PC_Reg_WB(
	.clk (clk),
   .rst (rst),
   .load (load_pc_wb),
   .in   (pc_m_out + 32'h00000004),
   .out  (pc_wb_out)
);
////////////////////////////////////////////////

////////////////IR//////////////////////////////
ir IR(
	.clk (clk),
	.rst (rst),
	.load (load_ir),
	.in (mdrreg_out),
	.funct3 (funct3),
	.funct7 (funct7),
	.opcode (opcode),
	.i_imm (i_imm),
	.s_imm (s_imm),
	.b_imm (b_imm),
	.u_imm (u_imm),
	.j_imm (j_imm),
	.rs1 (rs1),
	.rs2 (rs2),
	.rd (rd)
);

register IR_Reg_D(
	.clk (clk),
   .rst (rst),
   .load (load_ir_d),
   .in   (mdrreg_out),
   .out  (ir_d_out)
);

register IR_Reg_E(
	.clk (clk),
   .rst (rst),
   .load (load_ir_e),
   .in   (ir_d_out),
   .out  (ir_e_out)
);

register IR_Reg_M(
	.clk (clk),
   .rst (rst),
   .load (load_ir_m),
   .in   (ir_e_out),
   .out  (ir_m_out)
);

register IR_Reg_WB(
	.clk (clk),
   .rst (rst),
   .load (load_ir_wb),
   .in   (ir_m_out),
   .out  (ir_wb_out)
);

register IR_Reg_D_UIMM(
	.clk (clk),
   .rst (rst),
   .load (load_ir_d_uimm),
   .in   (u_imm),
   .out  (u_imm_d)
);

register IR_Reg_E_UIMM(
	.clk (clk),
   .rst (rst),
   .load (load_ir_e_uimm),
   .in   (u_imm_d),
   .out  (u_imm_e)
);

register IR_Reg_D_IIMM(
	.clk (clk),
   .rst (rst),
   .load (load_ir_d_iimm),
   .in   (i_imm),
   .out  (i_imm_d)
);

register IR_Reg_E_IIMM(
	.clk (clk),
   .rst (rst),
   .load (load_ir_e_iimm),
   .in   (i_imm_d),
   .out  (i_imm_e)
);

register IR_Reg_D_BIMM(
	.clk (clk),
   .rst (rst),
   .load (load_ir_d_bimm),
   .in   (b_imm),
   .out  (b_imm_d)
);

register IR_Reg_E_BIMM(
	.clk (clk),
   .rst (rst),
   .load (load_ir_e_bimm),
   .in   (b_imm_d),
   .out  (b_imm_e)
);

register IR_Reg_D_SIMM(
	.clk (clk),
   .rst (rst),
   .load (load_ir_d_simm),
   .in   (s_imm),
   .out  (s_imm_d)
);

register IR_Reg_E_SIMM(
	.clk (clk),
   .rst (rst),
   .load (load_ir_e_simm),
   .in   (s_imm_d),
   .out  (s_imm_e)
);

register IR_Reg_D_JIMM(
	.clk (clk),
   .rst (rst),
   .load (load_ir_d_jimm),
   .in   (j_imm),
   .out  (j_imm_d)
);

register IR_Reg_E_JIMM(
	.clk (clk),
   .rst (rst),
   .load (load_ir_e_jimm),
   .in   (j_imm_d),
   .out  (j_imm_e)
);
////////////////////////////////////////////////

/////////////////REGFILE////////////////////////
regfile regfile(
	.clk,
	.rst,
	.load (load_regfile),
	.in (regfilemux_out),
	.src_a (rs1),
	.src_b (rs2),
	.dest (rd),
	.reg_a (rs1_out),
	.reg_b (rs2_out)
);
//Write_Reg signal???

mux9 REGMUX(
	.clk,
	.rst,
	.select (regfilemux_sel),
	.in0 (alu_reg_out),
	.in1 (cmp_wb_out),
	.in2 (u_imm_d),
	.in3 (lw_out),	//lw
	.in4 (pc_wb_out),
	.in5 (lb_out),	//lb
	.in6 (lbu_out),	//lbu
	.in7 (lh_out),	//lh
	.in8 (lhu_out),	//lhu
	.out (regfilemux_out)
);

register RS1_Reg(
	.clk (clk),
   .rst (rst),
   .load (load_rs1_reg),
   .in   (rs1_out),
   .out  (rs1_reg_out)
);

register RS2_Reg_E(
	.clk (clk),
   .rst (rst),
   .load (load_rs2_reg_e),
   .in   (rs2_out),
   .out  (rs2_reg_e_out)
);

register RS2_Reg_M(
	.clk (clk),
   .rst (rst),
   .load (load_rs2_reg_m),
   .in   (rs2_reg_e_out),
   .out  (rs2_reg_m_out)
);
////////////////////////////////////////////////

/////////////Control////////////////////////////

////////////////////////////////////////////////

///////////ALU & Muxes//////////////////////////
alu ALU(
	.aluop (aluop),
	.a (alumux1_out),
	.b (alumux2_out),
	.f (alu_out)
);

mux2 ALUMUX1(
	.clk,
	.rst,
	.select (alumux1_sel),
	.in0 (rs1_reg_out),
	.in1 (pc_e_out),
	.out (alumux1_out)
);

mux6 ALUMUX2(
	.clk,
	.rst,
	.select (alumux2_sel),
	.in0 (i_imm_e),
	.in1 (u_imm_e),
	.in2 (b_imm_e),
	.in3 (s_imm_e),
	.in4 (j_imm_e),
	.in5 (rs2_reg_e_out),
	.out (alumux2_out)
);

register ALU_Reg_M(
	.clk (clk),
   .rst (rst),
   .load (load_alu_reg_m),
   .in   (alu_out),
   .out  (alu_reg_m)
);

register ALU_Reg_WB(
	.clk (clk),
   .rst (rst),
   .load (load_alu_reg_wb),
   .in   (alu_reg_m),
   .out  (alu_reg_out)
);
////////////////////////////////////////////////

/////////////CMP & MUXES////////////////////////
//DONT FORGET BR_EN_REG
cmp CMP(
	.cmpop (cmpop),
	.a (rs1_reg_out),
	.b (cmp_mux_out),
	.f (br_en)
);

mux2 CMPMUX(
	.clk,
	.rst,
	.select (cmpmux_sel),
	.in0 (rs2_reg_e_out),
	.in1 (i_imm_e),
	.out (cmp_mux_out)
);

zext BR_EN_ZEXT(
	.in (br_en),
	.out (br_en_regmux)
);

register CMP_Reg_M(
	.clk (clk),
   .rst (rst),
   .load (load_cmp_reg_m),
   .in   (br_en_regmux),
   .out  (cmp_m_out)
);

register CMP_Reg_WB(
	.clk (clk),
   .rst (rst),
   .load (load_cmp_reg_wb),
   .in   (cmp_m_out),
   .out  (cmp_wb_out)
);
////////////////////////////////////////////////

////////////////Data Cache Mux//////////////////
mux4 correctedpath(
  .clk,
  .rst,
  .select (alu_reg_m[1:0]),
  .in0 (rs2_reg_m_out),
  .in1 (rs2_reg_m_out << 8),
  .in2 (rs2_reg_m_out << 16),
  .in3 (rs2_reg_m_out << 24),
  .out (corrected)
);
////////////////////////////////////////////////

////////LOADS///////////////////////////////////
lh LH(
	.in0 (ir_wb_out),
	.select (alu_reg_out[1:0]),
	.out (lh_out)
);

lhu LHU(
	.in0 (ir_wb_out),
	.select (alu_reg_out[1:0]),
	.out (lhu_out)
);

lb LB(
	.in0 (ir_wb_out),
	.select (alu_reg_out[1:0]),
	.out (lb_out)
);

lbu LBU(
	.in0 (ir_wb_out),
	.select (alu_reg_out[1:0]),
	.out (lbu_out)
);

lw LW(
  .in0 (ir_wb_out),
  .select (alu_reg_out[1:0]),
  .out (lw_out)
);
////////////////////////////////////////////////
endmodule : datapath
