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
	 input [1:0] muxA,	
	 input [1:0] muxB,	
	 input rs1d_forw,	
	 input rs2d_forw,	
	 input rs2_forw,	
	 input stall,	
	 input flush,	
	 input wb_mem,
	 output logic inst_read,
	 output [31:0] inst_addr,
	 output data_read,
	 output data_write,
	 output logic [3:0] data_mbe,
	 output [31:0] data_addr,
	 output [31:0] data_wdata,
	 output rv32i_reg rd_e_out,	
	 output rv32i_reg rd_m_out,	
	 output rv32i_reg rd_wb_out,	
	 output rv32i_word rs2_exe,	
	 output rv32i_word rs2_mem,	
	 output rv32i_word rs1_mem,	
	 output rv32i_word rs1_exe,	
	 output rv32i_word rs2_dec,	
	 output rv32i_word rs1_dec,	
	 output rv32i_control_word control_e,	
	 output rv32i_control_word control_wb,	
	 output rv32i_control_word control_m,	
	 output logic br_en_m,	
	 output logic [1:0] branch
);

//Stage Load Values
logic load_decode;
logic load_execute;
logic load_memory;
logic load_writeback;

logic [31:0] d_addr_delay;

//PC values
logic load_pc;
//assign load_pc = inst_resp;
//logic [1:0] branch;
logic [1:0] pcmux_sel_m;
rv32i_word branch_addr_out;
rv32i_word pc_out;
rv32i_word pc_d_out;
rv32i_word pc_e_out;
rv32i_word pc_m_out;
rv32i_word pc_wb_out;
rv32i_word pc_plus4_out;
rv32i_word pcmux_out;
rv32i_word pcmux_out1;

//IR values
logic [2:0] funct3;
logic [2:0] funct3_d;
logic [6:0] funct7;
logic [6:0] funct7_d;
rv32i_opcode opcode;
rv32i_opcode opcode_d;

logic [4:0] rs1;
logic [4:0] rs1_d;
logic [4:0] rs1_e;	
logic [4:0] rs1_m;
logic [4:0] rs2;
logic [4:0] rs2_d;
logic [4:0] rs2_e;	
logic [4:0] rs2_m;
rv32i_reg rd;
rv32i_reg rd_d;
rv32i_reg rd_e;
rv32i_reg rd_m;
rv32i_reg rd_wb;
rv32i_word i_imm;
rv32i_word i_imm_d;
rv32i_word i_imm_e;
rv32i_word u_imm;
rv32i_word u_imm_d;
rv32i_word u_imm_e;
rv32i_word u_imm_m;
rv32i_word u_imm_wb;
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
rv32i_word rs1_d_forw;	
rv32i_word rs2_d_forw;
rv32i_word rs2_reg_e_out;
rv32i_word rs2_reg_m_out;
rv32i_word regfilemux_out;

//ALU values
rv32i_word alu_mux_pc_out;
rv32i_word alumux1_out;
rv32i_word alumux2_out;
rv32i_word alu_out;
rv32i_word alu_reg_m;
rv32i_word alu_reg_out;

//Control Values
rv32i_control_word control_stall;
rv32i_control_word control_d;
rv32i_control_word control_flushM;
//rv32i_control_word control_e;
//rv32i_control_word control_m;
//rv32i_control_word control_wb;

//CMP values
logic br_en;
//logic br_en_m;
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

//forwarding	
rv32i_word aluMuxA;	
rv32i_word aluMuxB;	
rv32i_word rs2_forward;	
assign rd_m_out = rd_m;	
assign rd_wb_out = rd_wb;	
assign rs2_exe = rs2_e;	
assign rs2_mem = rs2_m;	
assign rs1_mem = rs1_m;	
assign rs1_exe = rs1_e;	
assign ir_m_forward = ir_m_out;	
assign ir_wb_forward = ir_wb_out;	
logic [1:0] br_reg_out;	
rv32i_word br_pc_reg;
	
//hazard	
assign rs2_dec = rs2_d;	
assign rs1_dec = rs1_d;	
assign rd_e_out = rd_e;	
logic stall_decode;	
rv32i_word ir_flush;

//extra rvfi
RVFIMonPacket rvfi_packet;	
RVFIMonPacket rvfi_packet_d;	
RVFIMonPacket rvfi_packet_e;	
RVFIMonPacket rvfi_packet_m;	
RVFIMonPacket rvfi_packet_wb;	
RVFIMonPacket rvfi_packet_d_in;	
RVFIMonPacket rvfi_packet_e_in;	
RVFIMonPacket rvfi_packet_m_in;	
RVFIMonPacket rvfi_packet_wb_in;	
RVFIMonPacket rvfi_packet_d_out;	
RVFIMonPacket rvfi_packet_e_out;	
RVFIMonPacket rvfi_packet_m_out;	
RVFIMonPacket rvfi_packet_wb_out;
//RVFIMonPacket rvfi_packet_wb_out2;	
// Assign RVFI signals	
assign rvfi_packet_d_in = rvfi_packet;	
assign rvfi_packet_e_in = rvfi_packet_d;	
assign rvfi_packet_m_in = rvfi_packet_e;	
assign rvfi_packet_wb_in = rvfi_packet_m;	
always_comb	
begin	
  //Fetch/Decode	
  rvfi_packet = 0;	
  rvfi_packet.pc_rdata = pc_out;	
  rvfi_packet.pc_wdata = pcmux_out;	
  rvfi_packet.instruction = inst_rdata;	
  //Decode/Execute	
  rvfi_packet_d = rvfi_packet_d_out;	
  rvfi_packet_d.rs1 = rs1;	
  rvfi_packet_d.rs2 = rs2;	
  rvfi_packet_d.rs1_data = rs1 ? rs1_out : 0;	
  rvfi_packet_d.rs2_data = rs2 ? rs2_out : 0;	
  rvfi_packet_d.load_regfile = control_d.load_regfile;	
  rvfi_packet_d.rd = control_d.load_regfile ? rd : 0;	
  //Execute/Memory	
  rvfi_packet_e = rvfi_packet_e_out;	
  //Memory/Writeback	
  rvfi_packet_m = rvfi_packet_m_out;	
  rvfi_packet_m.mem_addr = data_addr;	
  rvfi_packet_m.mem_rdata = data_rdata;
  rvfi_packet_m.mem_wdata = data_wdata;
  case (load_funct3_t'(funct3))	
    lw: rvfi_packet_m.mem_rmask = 4'b1111;	
    lh, lhu: rvfi_packet_m.mem_rmask = data_addr[1] ? 4'b1100 : 4'b0011;	
    lb, lbu: rvfi_packet_m.mem_rmask = 4'b0001 << data_addr[1:0];	
    default: rvfi_packet_m.mem_rmask = 0;	
  endcase	
  case (store_funct3_t'(funct3))	
    sw: rvfi_packet_m.mem_wmask = 4'b1111;	
    sh: rvfi_packet_m.mem_wmask = data_addr[1] ? 4'b1100 : 4'b0011;	
    sb: rvfi_packet_m.mem_wmask = 4'b0001 << data_addr[1:0];	
    default: rvfi_packet_m.mem_wmask = 0;	
  endcase	
  //Writeback/Commit	
  //rvfi_packet_wb_out2 = rvfi_packet_wb_out;
  //rvfi_packet_wb_out2.rd_wdata = regfilemux_out;	
  //rvfi_packet_wb.mem_wdata = data_wdata;
  rvfi_packet_wb = rvfi_packet_wb_out;	
end

//assign inst_read = (control_e.mem_read & data_resp) | (~control_e.mem_read);
always_comb
begin
	if(control_stall.mem_read && control_flushM.mem_read && control_m.mem_read)
		inst_read = 1'b1;
	else
		inst_read = (~control_m.mem_read);
end
assign inst_addr = pc_out;
assign data_read = control_m.mem_read;	//previously e
assign data_write = control_m.mem_write;

always_comb
begin
	if(control_m.mem_read)
	begin
		if (alu_reg_m[1:0] == 2'b00)
			data_mbe = control_m.r_mask;
		else if (alu_reg_m[1:0] == 2'b01)
			data_mbe = {control_m.r_mask[2:0], 1'b0};
		else if (alu_reg_m[1:0] == 2'b10)
			data_mbe = {control_m.r_mask[1:0], 2'b0};
		else
			data_mbe = {control_m.r_mask[0], 3'b0};
	end
//	else if (control_m.mem_write)
//	begin
//		
//	end
	else
		data_mbe = 4'b1111;
end

//assign data_mbe = 4'b1111;
assign data_addr = alu_reg_m;
//always_comb
//begin
//	if(control_m.opcode == op_load)
//		data_addr = alu_reg_m;
//	else
//		data_addr = alu_out;
//end

//assign opcode_d = rv32i_opcode'(ir_d_out[6:0]);
assign pcmux_sel_m = branch;

////////////////Stage Transitions/////////////

stage_decode STAGE_DECODE(
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
    .load (load_pc || branch != 2'b00), //| (br_en_m == 1 && control_m.opcode == op_br)
    .in   (pcmux_out),
    .out  (pc_out)
);

mux4 PCMUX(
	.clk,
	.rst,
	.select (pcmux_sel_m),
	.in0 (pc_out + 32'h00000004),
	.in1 (alu_reg_m),						//JAL
	.in2 ({alu_reg_m[31:1], 1'b0}),	//JALR
	.in3 (alu_reg_m),						//BR
	.out (pcmux_out)
);

register BRANCH_ADDR(
	.clk (clk),
   .rst (rst),
   .load (br_en_m == 1 && control_m.opcode == op_br),
   .in   (alu_reg_m),
   .out  (branch_addr_out)
);

register PC_Reg_D(
	.clk (clk),
   .rst (rst),
   .load (stall_decode),
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
   .in   (pc_m_out),
   .out  (pc_wb_out)
);
////////////////////////////////////////////////

////////////////IR//////////////////////////////
ir IR(
	.clk (clk),
	.rst (rst),
	.load (1'b1),
	.in (ir_flush),
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

register #(5) RS1_D(
	.clk (clk),
   .rst (rst),
   .load (stall_decode),
   .in   (rs1),
   .out  (rs1_d)
);

register #(5) RS1_E(	
	.clk (clk),	
   .rst (rst),	
   .load (load_execute),	
   .in   (rs1_d),	
   .out  (rs1_e)	
);	

register #(5) RS1_M(	
	.clk (clk),	
   .rst (rst),	
   .load (load_memory),	
   .in   (rs1_e),	
   .out  (rs1_m)	
);

register #(5) RS2_D(
	.clk (clk),
   .rst (rst),
   .load (stall_decode),
   .in   (rs2),
   .out  (rs2_d)
);

	register #(5) RS2_E(	
	.clk (clk),	
   .rst (rst),	
   .load (load_execute),	
   .in   (rs2_d),	
   .out  (rs2_e)	
);	
register #(5) RS2_M(	
	.clk (clk),	
   .rst (rst),	
   .load (load_memory),	
   .in   (rs2_e),	
   .out  (rs2_m)	
);

register #(3) FUNCT3_D(
	.clk (clk),
   .rst (rst),
   .load (stall_decode),
   .in   (funct3),
   .out  (funct3_d)
);

register #(7) FUNCT7_D(
	.clk (clk),
   .rst (rst),
   .load (stall_decode),
   .in   (funct7),
   .out  (funct7_d)
);

opcode_reg OPCODE_D(
	.clk (clk),
   .rst (rst),
   .load (stall_decode),
   .in   (opcode),
   .out  (opcode_d)
);

register #(5) RD_D(
	.clk (clk),
   .rst (rst),
   .load (stall_decode),
   .in   (rd),
   .out  (rd_d)
);

register #(5) RD_E(
	.clk (clk),
   .rst (rst),
   .load (load_execute),
   .in   (rd_d),
   .out  (rd_e)
);

register #(5) RD_M(
	.clk (clk),
   .rst (rst),
   .load (load_memory),
   .in   (rd_e),
   .out  (rd_m)
);

register #(5) RD_WB(
	.clk (clk),
   .rst (rst),
   .load (load_writeback),
   .in   (rd_m),
   .out  (rd_wb)
);

register IR_Reg_D(
	.clk (clk),
   .rst (rst),
   .load (stall_decode),
   .in   (ir_flush),
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

register IR_Reg_D_UIMM(
	.clk (clk),
   .rst (rst),
   .load (stall_decode),
   .in   (u_imm),
   .out  (u_imm_d)
);

register IR_Reg_E_UIMM(
	.clk (clk),
   .rst (rst),
   .load (load_execute),
   .in   (u_imm_d),
   .out  (u_imm_e)
);

register IR_Reg_M_UIMM(
	.clk (clk),
   .rst (rst),
   .load (load_memory),
   .in   (u_imm_e),
   .out  (u_imm_m)
);

register IR_Reg_WB_UIMM(
	.clk (clk),
   .rst (rst),
   .load (load_writeback),
   .in   (u_imm_m),
   .out  (u_imm_wb)
);

register IR_Reg_E_ID_IMM(
	.clk (clk),
   .rst (rst),
   .load (stall_decode),
   .in   (i_imm),
   .out  (i_imm_d)
);

register IR_Reg_E_IIMM(
	.clk (clk),
   .rst (rst),
   .load (load_execute),
   .in   (i_imm_d),
   .out  (i_imm_e)
);

register IR_Reg_D_BIMM(
	.clk (clk),
   .rst (rst),
   .load (stall_decode),
   .in   (b_imm),
   .out  (b_imm_d)
);

register IR_Reg_E_BIMM(
	.clk (clk),
   .rst (rst),
   .load (load_execute),
   .in   (b_imm_d),
   .out  (b_imm_e)
);

register IR_Reg_D_SIMM(
	.clk (clk),
   .rst (rst),
   .load (stall_decode),
   .in   (s_imm),
   .out  (s_imm_d)
);

register IR_Reg_E_SIMM(
	.clk (clk),
   .rst (rst),
   .load (load_execute),
   .in   (s_imm_d),
   .out  (s_imm_e)
);

register IR_Reg_D_JIMM(
	.clk (clk),
   .rst (rst),
   .load (stall_decode),
   .in   (j_imm),
   .out  (j_imm_d)
);

register IR_Reg_E_JIMM(
	.clk (clk),
   .rst (rst),
   .load (load_execute),
   .in   (j_imm_d),
   .out  (j_imm_e)
);
////////////////////////////////////////////////

/////////////////REGFILE////////////////////////
regfile regfile(
	.clk,
	.rst,
	.load (control_wb.load_regfile),
	.in (regfilemux_out),
	.src_a (rs1_d),
	.src_b (rs2_d),
	.dest (rd_wb),
	.reg_a (rs1_out),
	.reg_b (rs2_out)
);


//in2, u_imm: unsure about the stage of u_imm required, u_imm is only selected for LUI instruction
mux9 REGMUX(
	.clk,
	.rst,
	.select (control_wb.regfilemux_sel),
	.in0 (alu_reg_out),
	.in1 (cmp_wb_out),
	.in2 (u_imm_wb),
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
   .in   (rs1_d_forw),
   .out  (rs1_reg_out)
);

register RS2_Reg_E(
	.clk (clk),
   .rst (rst),
   .load (load_execute),
   .in   (rs2_d_forw),
   .out  (rs2_reg_e_out)
);

register RS2_Reg_M(
	.clk (clk),
   .rst (rst),
   .load (load_memory),
   .in   (aluMuxB),
   .out  (rs2_reg_m_out)
);

mux2 mem_forward(	
	.clk,	
	.rst,	
	.select (rs2_forw),	
	.in0 (rs2_reg_m_out),	
	.in1 (regfilemux_out),	
	.out (rs2_forward)	
);
////////////////////////////////////////////////

/////////////Control////////////////////////////
control_rom CONTROL(
	.opcode (opcode_d),
	.funct3 (funct3_d),
	.funct7 (funct7_d),
	.ctrl   (control_d)
);

control_signal_reg CS_REG_E(
	.clk  (clk),
	.rst  (rst),
	.load (load_execute),
	.in   (control_stall),
	.out  (control_e)
);
control_signal_reg CS_REG_M(
	.clk  (clk),
	.rst  (rst),
	.load (load_memory),
	.in   (control_flushM),
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
	.aluop (control_flushM.aluop),
	.a (alumux1_out),
	.b (alumux2_out),
	.f (alu_out)
);

//always_comb
//begin
//		alu_mux_pc_out = pc_e_out;
//end
assign alu_mux_pc_out = pc_e_out;

mux2 ALUMUX1(
	.clk,
	.rst,
	.select (control_flushM.alumux1_sel),
	.in0 (aluMuxA),
	.in1 (alu_mux_pc_out),
	.out (alumux1_out)
);

mux2 #(1) stallMux(	
	.clk,	
	.rst,	
	.select (stall),	
	.in0 (load_decode),	
	.in1 (0),	
	.out (stall_decode)	
);	
mux2 #(1) pcloadmux(	
	.clk,	
	.rst,	
	.select (stall),	
	.in0 (inst_resp),	
	.in1 (0),	
	.out (load_pc)	
);	
mux2 rs1d_forw_mux(	
	.clk,	
	.rst,	
	.select (rs1d_forw),	
	.in0 (rs1_out),	
	.in1 (regfilemux_out),	
	.out (rs1_d_forw)	
);	
mux2 rs2d_forw_mux(	
	.clk,	
	.rst,	
	.select (rs2d_forw),	
	.in0 (rs2_out),	
	.in1 (regfilemux_out),	
	.out (rs2_d_forw)	
);	
ctrl_mux2 ctrlE_stall(	
	.clk,	
	.rst,	
	.select (stall || flush),	
	.in0 (control_d),	
	.in1 (control_flush),	
	.out (control_stall)	
);	
ctrl_mux2 ctrlM_flush(	
	.clk,	
	.rst,	
	.select (flush),	
	.in0 (control_e),	
	.in1 (control_flush),	
	.out (control_flushM)	
);	
ctrl_mux2 ir_flush_mux(	
	.clk,	
	.rst,	
	.select (flush),	
	.in0 (inst_rdata),	
	.in1 (control_flush),	
	.out (ir_flush)	
);

mux6 ALUMUX2(
	.clk,
	.rst,
	.select (control_flushM.alumux2_sel),
	.in0 (i_imm_e),
	.in1 (u_imm_e),
	.in2 ({{20{b_imm_e[11]}}, b_imm_e[11:0]}),
	.in3 (s_imm_e),
	.in4 (j_imm_e),
	.in5 (aluMuxB),
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
	.cmpop (control_flushM.cmpop),
	.a (aluMuxA),
	.b (cmp_mux_out),
	.f (br_en)
);

mux2 CMPMUX(
	.clk,
	.rst,
	.select (control_flushM.cmpmux_sel),
	.in0 (aluMuxB),
	.in1 (i_imm_e),
	.out (cmp_mux_out)
);

zext BR_EN_ZEXT(
	.in (br_en),
	.out (br_en_regmux)
);

register #(1) CMP_Reg_M_NO_EXT(
	.clk (clk),
   .rst (rst),
   .load (load_memory),
   .in   (br_en),
   .out  (br_en_m)
);

always_comb
	begin
		if(rst)
			branch = 2'b00;
		else if (br_en_m == 1 && control_m.opcode == op_br)
			branch = 2'b11;
		else if (control_m.opcode == op_jal)
			branch = 2'b01;
		else if (control_m.opcode == op_jalr)
			branch = 2'b10;
		else
			branch = 2'b00;
	end

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
  .in0 (rs2_forward),
  .in1 (rs2_forward << 8),
  .in2 (rs2_forward << 16),
  .in3 (rs2_forward << 24),
  .out (data_wdata)
);

register DCACHE_OUT(
  .clk,
  .rst,
  .load (1'b1), //formerly load_writeback
  .in   (data_rdata),
  .out  (write_data)
);
////////////////////////////////////////////////

////////LOADS///////////////////////////////////
lh LH(
	.in0 (write_data),
	.select (alu_reg_out[1:0]),
	.out (lh_out)
);

lhu LHU(
	.in0 (write_data),
	.select (alu_reg_out[1:0]),
	.out (lhu_out)
);

lb LB(
	.in0 (write_data),
	.select (alu_reg_out[1:0]),
	.out (lb_out)
);

lbu LBU(
	.in0 (write_data),
	.select (alu_reg_out[1:0]),
	.out (lbu_out)
);

lw LW(
  .in0 (write_data),
  .select (alu_reg_out[1:0]),
  .out (lw_out)
);
////////////////////////////////////////////////
////////////////FORWARDING/////////////////////	
mux4 alu_muxA(	
  .clk,	
  .rst,	
  .select (muxA),	
  .in0 (rs1_reg_out),	
  .in1 (regfilemux_out),	
  .in2 (alu_reg_m),	
  .in3 (data_rdata),	
  .out (aluMuxA)	
);	
mux4 alu_muxB(	
  .clk,	
  .rst,	
  .select (muxB),	
  .in0 (rs2_reg_e_out),	
  .in1 (regfilemux_out),	
  .in2 (alu_reg_m),	
  .in3 (data_rdata),	
  .out (aluMuxB)	
);	
control_rom flushed_control(	
    .opcode (op_imm),	
    .funct3 (3'b0),	
    .funct7 (7'b0),	
    .ctrl   (control_flush)	
);

////////RVFIMon Packets///////////////////////////////////	
rvfi_reg RVFI_Reg_D(	
	.clk (clk),	
   .rst (rst),	
   .load (stall_decode),	
   .in1   (rvfi_packet_d_in),	
   .out1  (rvfi_packet_d_out)
);
rvfi_reg RVFI_Reg_E(	
	.clk (clk),	
   .rst (rst),	
   .load (load_execute),	
   .in1   (rvfi_packet_e_in),	
   .out1  (rvfi_packet_e_out)	
);	
rvfi_reg RVFI_Reg_M(	
	.clk (clk),	
   .rst (rst),	
   .load (load_memory),	
   .in1   (rvfi_packet_m_in),	
   .out1  (rvfi_packet_m_out)	
);	
rvfi_reg_out RVFI_Reg_WB(	
	.clk (clk),	
   .rst (rst),	
   .load (load_writeback),	
   .in1   (rvfi_packet_wb_in),
	.in2 (regfilemux_out),
   .out1  (rvfi_packet_wb_out)	
);	
//rvfi_reg_out RVFI_Reg_OUT(	
//	.clk (clk),	
//   .rst (rst),	
//   .in1   (rvfi_packet_wb_out2),	
//   .out1  (rvfi_packet_wb)	
//);	
////////////////////////////////////////////////
endmodule : datapath