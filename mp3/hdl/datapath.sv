`define BAD_MUX_SEL $fatal("%0t %s %0d: Illegal mux select", $time, `__FILE__, `__LINE__)

import rv32i_types::*;

module datapath
(
    input clk,
    input rst,
	 input inst_resp,
	 input [31:0] inst_rdata,
	 input data_resp,
	 input [31:0] data_rdata,
	 output inst_read,
	 output [31:0] inst_addr,
	 output data_read,
	 output data_write,
	 output [3:0] data_mbe,
	 output [31:0] data_addr,
	 output [31:0] data_wdata
);

//Stage Load Values
logic load_decode = 1'b0;
logic load_execute = 1'b0;
logic load_memory = 1'b0;
logic load_writeback = 1'b0;

//PC values
logic load_pc;
logic [1:0] pcmux_sel_m;
rv32i_word pc_out;
rv32i_word pc_d_out;
rv32i_word pc_e_out;
rv32i_word pc_m_out;
rv32i_word pc_wb_out;
rv32i_word pc_plus4_out;
rv32i_word pcmux_out;

//IR values
logic [2:0] funct3;
logic [6:0] funct7;
rv32i_opcode opcode;
logic [4:0] rs1;
logic [4:0] rs2;

rv32i_reg rd;
rv32i_word i_imm;
rv32i_word i_imm_e;
rv32i_word u_imm;
rv32i_word u_imm_e;
rv32i_word b_imm;
rv32i_word b_imm_e;
rv32i_word s_imm;
rv32i_word s_imm_e;
rv32i_word j_imm;
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
rv32i_word alu_out;
rv32i_word alu_reg_m;
rv32i_word alu_reg_out;

//Control Values
rv32i_control_word control_d;
rv32i_control_word control_e;
rv32i_control_word control_m;
rv32i_control_word control_wb;

//CMP values
logic br_en;
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
rv32i_word write_data;

//load MAR signal
assign inst_read = 1'b1;
assign inst_addr = pc_out;
assign data_read = control_m.mem_read;
assign data_write = control_m.mem_write;
assign data_mbe = 4'b1111;
assign data_addr = alu_reg_m;


//////////////////PC Initial signals///////////
always_comb
begin
	if(load_memory == 1)
		begin
		   pcmux_sel_m = control_m.pcmux_sel;
		end
	else
		begin
			pcmux_sel_m = 2'b00;
		end
end

always_comb
begin
	if(inst_resp == 1 && !load_decode && !load_execute && !load_memory && !load_writeback)
		begin
		   load_pc = 1'b1;
		end
	else
		begin
			load_pc = control_d.load_pc;
		end
end
//////////////////////////////////////////////

////////////////Stage Transitions/////////////
//initial
//begin
//	load_decode = 1'b0;
//	load_execute = 1'b0;
//	load_memory = 1'b0;
//	load_writeback = 1'b0;
//end
//
//assign load_decode = inst_resp & !data_read & !data_write & !load_writeback; 
//assign load_execute = !data_read & !data_write & inst_resp & !load_decode;  
//assign load_memory = !data_read & !data_write & data_resp !load_execute;
//assign load_writeback = data_resp & !load_memory;
stage STAGE(
	.clk					(clk),
	.rst					(rst),
	.inst_resp			(inst_resp),
	.data_resp			(data_resp),
	.data_read			(data_read),
	.data_write			(data_write),
	.load_decode		(load_decode),
	.load_execute		(load_execute),
	.load_memory		(load_memory),
	.load_writeback	(load_writeback)
);
//////////////////////////////////////////////

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
	.select (pcmux_sel_m),
	.in0 (pc_out + 32'h00000004),
	.in1 (alu_reg_m),
	.in2 ({alu_reg_m[31:1], 1'b0}),
	.out (pcmux_out)
);

register PC_Reg_D(
	.clk (clk),
   .rst (rst),
   .load (load_decode),
   .in   (pc_out),
   .out  (pc_d_out)
);

register PC_Reg_E(
	.clk (clk),
   .rst (rst),
   .load (load_execute),
   .in   (pc_d_out),
   .out  (pc_e_out)
);

register PC_Reg_M(
	.clk (clk),
   .rst (rst),
   .load (load_memory),
   .in   (pc_e_out),
   .out  (pc_m_out)
);

register PC_Reg_WB(
	.clk (clk),
   .rst (rst),
   .load (load_writeback),
   .in   (pc_m_out + 32'h00000004),
   .out  (pc_wb_out)
);
////////////////////////////////////////////////

////////////////IR//////////////////////////////
ir IR(
	.clk (clk),
	.rst (rst),
	.load (load_decode),
	.in (ir_d_out),
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
   .load (load_decode),
   .in   (inst_rdata),
   .out  (ir_d_out)
);

register IR_Reg_E(
	.clk (clk),
   .rst (rst),
   .load (load_execute),
   .in   (ir_d_out),
   .out  (ir_e_out)
);

register IR_Reg_M(
	.clk (clk),
   .rst (rst),
   .load (load_memory),
   .in   (ir_e_out),
   .out  (ir_m_out)
);

register IR_Reg_WB(
	.clk (clk),
   .rst (rst),
   .load (load_writeback),
   .in   (ir_m_out),
   .out  (ir_wb_out)
);

register IR_Reg_E_UIMM(
	.clk (clk),
   .rst (rst),
   .load (load_execute),
   .in   (u_imm),
   .out  (u_imm_e)
);

register IR_Reg_E_IIMM(
	.clk (clk),
   .rst (rst),
   .load (load_execute),
   .in   (i_imm),
   .out  (i_imm_e)
);

register IR_Reg_E_BIMM(
	.clk (clk),
   .rst (rst),
   .load (load_execute),
   .in   (b_imm),
   .out  (b_imm_e)
);

register IR_Reg_E_SIMM(
	.clk (clk),
   .rst (rst),
   .load (load_execute),
   .in   (s_imm),
   .out  (s_imm_e)
);

register IR_Reg_E_JIMM(
	.clk (clk),
   .rst (rst),
   .load (load_execute),
   .in   (j_imm),
   .out  (j_imm_e)
);
////////////////////////////////////////////////

/////////////////REGFILE////////////////////////
regfile regfile(
	.clk,
	.rst,
	.load (control_d.load_regfile),
	.in (regfilemux_out),
	.src_a (rs1),
	.src_b (rs2),
	.dest (rd),
	.reg_a (rs1_out),
	.reg_b (rs2_out)
);
//Write_Reg signal???

//in2, u_imm: unsure about the stage of u_imm required, u_imm is only selected for LUI instruction
mux9 REGMUX(
	.clk,
	.rst,
	.select (control_wb.regfilemux_sel),
	.in0 (alu_reg_out),
	.in1 (cmp_wb_out),
	.in2 (u_imm),
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
   .load (load_execute),
   .in   (rs1_out),
   .out  (rs1_reg_out)
);

register RS2_Reg_E(
	.clk (clk),
   .rst (rst),
   .load (load_execute),
   .in   (rs2_out),
   .out  (rs2_reg_e_out)
);

register RS2_Reg_M(
	.clk (clk),
   .rst (rst),
   .load (load_memory),
   .in   (rs2_reg_e_out),
   .out  (rs2_reg_m_out)
);
////////////////////////////////////////////////

/////////////Control////////////////////////////
control_rom CONTROL(
	.opcode (opcode),
	.funct3 (funct3),
	.funct7 (funct7),
	.ctrl   (control_d)
);

control_signal_reg CS_REG_E(
	.clk  (clk),
	.rst  (rst),
	.load (load_execute),
	.in   (control_d),
	.out  (control_e)
);
control_signal_reg CS_REG_M(
	.clk  (clk),
	.rst  (rst),
	.load (load_memory),
	.in   (control_e),
	.out  (control_m)
);
control_signal_reg CS_REG_WB(
	.clk  (clk),
	.rst  (rst),
	.load (load_writeback),
	.in   (control_m),
	.out  (control_wb)
);
////////////////////////////////////////////////

///////////ALU & Muxes//////////////////////////
alu ALU(
	.aluop (control_e.aluop),
	.a (alumux1_out),
	.b (alumux2_out),
	.f (alu_out)
);

mux2 ALUMUX1(
	.clk,
	.rst,
	.select (control_e.alumux1_sel),
	.in0 (rs1_reg_out),
	.in1 (pc_e_out),
	.out (alumux1_out)
);

mux6 ALUMUX2(
	.clk,
	.rst,
	.select (control_e.alumux2_sel),
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
   .load (load_memory),
   .in   (alu_out),
   .out  (alu_reg_m)
);

register ALU_Reg_WB(
	.clk (clk),
   .rst (rst),
   .load (load_writeback),
   .in   (alu_reg_m),
   .out  (alu_reg_out)
);
////////////////////////////////////////////////

/////////////CMP & MUXES////////////////////////
//DONT FORGET BR_EN_REG
cmp CMP(
	.cmpop (control_e.cmpop),
	.a (rs1_reg_out),
	.b (cmp_mux_out),
	.f (br_en)
);

mux2 CMPMUX(
	.clk,
	.rst,
	.select (control_e.cmpmux_sel),
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
   .load (load_memory),
   .in   (br_en_regmux),
   .out  (cmp_m_out)
);

register CMP_Reg_WB(
	.clk (clk),
   .rst (rst),
   .load (load_writeback),
   .in   (cmp_m_out),
   .out  (cmp_wb_out)
);
////////////////////////////////////////////////

////////////////Data Cache Mux For Stores///////
mux4 correctedpath(
  .clk,
  .rst,
  .select (control_m.store_type),
  .in0 (rs2_reg_m_out),
  .in1 (rs2_reg_m_out << 8),
  .in2 (rs2_reg_m_out << 16),
  .in3 (rs2_reg_m_out << 24),
  .out (data_wdata)
);

register DCACHE_OUT(
  .clk,
  .rst,
  .load (load_writeback),
  .in   (data_rdata),
  .out  (write_data)
);
////////////////////////////////////////////////

////////LOADS///////////////////////////////////
lh LH(
	.in0 (write_data),
	.select (control_wb.store_type),
	.out (lh_out)
);

lhu LHU(
	.in0 (write_data),
	.select (control_wb.store_type),
	.out (lhu_out)
);

lb LB(
	.in0 (write_data),
	.select (control_wb.store_type),
	.out (lb_out)
);

lbu LBU(
	.in0 (write_data),
	.select (control_wb.store_type),
	.out (lbu_out)
);

lw LW(
  .in0 (write_data),
  .select (control_wb.store_type),
  .out (lw_out)
);
////////////////////////////////////////////////
endmodule : datapath