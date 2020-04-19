# AG Report Generated 2020-04-07 16:08
This is a report about mp3cp2 generated for letUsGraduate at 2020-04-07 16:08. The autograder used commit ``fa07e03483b1`` as a starting point. If you have any questions about this report, please contact the TAs on Piazza.
### Quick Results:
 - Compilation: NO
 - Targeted: 0/2 (0.0%)
### Compilation ![Failure][failure]
You did not succesfully compile. Your report is below.
<details>
<summary>Compilation Report</summary>

```
Info: *******************************************************************
Info: Running Quartus Prime Analysis & Synthesis
    Info: Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition
    Info: Copyright (C) 2018  Intel Corporation. All rights reserved.
    Info: Your use of Intel Corporation's design tools, logic functions 
    Info: and other software and tools, and its AMPP partner logic 
    Info: functions, and any output files from any of the foregoing 
    Info: (including device programming or simulation files), and any 
    Info: associated documentation or information are expressly subject 
    Info: to the terms and conditions of the Intel Program License 
    Info: Subscription Agreement, the Intel Quartus Prime License Agreement,
    Info: the Intel FPGA IP License Agreement, or other applicable license
    Info: agreement, including, without limitation, that your use is for
    Info: the sole purpose of programming logic devices manufactured by
    Info: Intel and sold by Intel or its authorized distributors.  Please
    Info: refer to the applicable agreement for further details.
    Info: Processing started: Tue Apr  7 21:08:12 2020
Info: Command: quartus_map mp3 -c mp3
Warning (18236): Number of processors has not been specified which may cause overloading on shared machines.  Set the global assignment NUM_PARALLEL_PROCESSORS in your QSF to an appropriate value for best performance.
Info (20030): Parallel compilation is enabled and will use 4 of the 4 processors detected
Info (12021): Found 1 design units, including 1 entities, in source file hdl/stage.sv
    Info (12023): Found entity 1: stage File: /job/student/hdl/stage.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/control_signals.sv
    Info (12023): Found entity 1: control_signal_reg File: /job/student/hdl/control_signals.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/mp3.sv
    Info (12023): Found entity 1: mp3 File: /job/student/hdl/mp3.sv Line: 3
Info (12021): Found 5 design units, including 5 entities, in source file hdl/loads.sv
    Info (12023): Found entity 1: lh File: /job/student/hdl/loads.sv Line: 3
    Info (12023): Found entity 2: lhu File: /job/student/hdl/loads.sv Line: 31
    Info (12023): Found entity 3: lb File: /job/student/hdl/loads.sv Line: 59
    Info (12023): Found entity 4: lbu File: /job/student/hdl/loads.sv Line: 88
    Info (12023): Found entity 5: lw File: /job/student/hdl/loads.sv Line: 116
Info (12021): Found 1 design units, including 1 entities, in source file hdl/zext.sv
    Info (12023): Found entity 1: zext File: /job/student/hdl/zext.sv Line: 3
Info (12021): Found 5 design units, including 5 entities, in source file hdl/mux.sv
    Info (12023): Found entity 1: mux2 File: /job/student/hdl/mux.sv Line: 2
    Info (12023): Found entity 2: mux3 File: /job/student/hdl/mux.sv Line: 21
    Info (12023): Found entity 3: mux4 File: /job/student/hdl/mux.sv Line: 41
    Info (12023): Found entity 4: mux6 File: /job/student/hdl/mux.sv Line: 61
    Info (12023): Found entity 5: mux9 File: /job/student/hdl/mux.sv Line: 87
Info (12021): Found 1 design units, including 1 entities, in source file hdl/ir.sv
    Info (12023): Found entity 1: ir File: /job/student/hdl/ir.sv Line: 3
Info (12021): Found 1 design units, including 0 entities, in source file hdl/rv32i_types.sv
    Info (12022): Found design unit 1: rv32i_types (SystemVerilog) File: /job/student/hdl/rv32i_types.sv Line: 1
Info (12021): Found 5 design units, including 0 entities, in source file hdl/rv32i_mux_types.sv
    Info (12022): Found design unit 1: pcmux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 1
    Info (12022): Found design unit 2: marmux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 9
    Info (12022): Found design unit 3: cmpmux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 16
    Info (12022): Found design unit 4: alumux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 23
    Info (12022): Found design unit 5: regfilemux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 39
Info (12021): Found 1 design units, including 1 entities, in source file hdl/register.sv
    Info (12023): Found entity 1: register File: /job/student/hdl/register.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/regfile.sv
    Info (12023): Found entity 1: regfile File: /job/student/hdl/regfile.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/pc_reg.sv
    Info (12023): Found entity 1: pc_register File: /job/student/hdl/pc_reg.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/datapath.sv
    Info (12023): Found entity 1: datapath File: /job/student/hdl/datapath.sv Line: 5
Info (12021): Found 0 design units, including 0 entities, in source file hdl/cpu.sv
Info (12021): Found 1 design units, including 1 entities, in source file hdl/control.sv
    Info (12023): Found entity 1: control_rom File: /job/student/hdl/control.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cmp.sv
    Info (12023): Found entity 1: cmp File: /job/student/hdl/cmp.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/alu.sv
    Info (12023): Found entity 1: alu File: /job/student/hdl/alu.sv Line: 3
Info (12127): Elaborating entity "mp3" for the top level hierarchy
Info (12128): Elaborating entity "datapath" for hierarchy "datapath:datapath" File: /job/student/hdl/mp3.sv Line: 34
Info (12128): Elaborating entity "stage" for hierarchy "datapath:datapath|stage:STAGE" File: /job/student/hdl/datapath.sv Line: 161
Info (12128): Elaborating entity "pc_register" for hierarchy "datapath:datapath|pc_register:PC" File: /job/student/hdl/datapath.sv Line: 171
Info (12128): Elaborating entity "mux3" for hierarchy "datapath:datapath|mux3:PCMUX" File: /job/student/hdl/datapath.sv Line: 181
Info (12128): Elaborating entity "register" for hierarchy "datapath:datapath|register:PC_Reg_D" File: /job/student/hdl/datapath.sv Line: 189
Info (12128): Elaborating entity "ir" for hierarchy "datapath:datapath|ir:IR" File: /job/student/hdl/datapath.sv Line: 233
Info (12128): Elaborating entity "regfile" for hierarchy "datapath:datapath|regfile:regfile" File: /job/student/hdl/datapath.sv Line: 319
Info (12128): Elaborating entity "mux9" for hierarchy "datapath:datapath|mux9:REGMUX" File: /job/student/hdl/datapath.sv Line: 337
Info (12128): Elaborating entity "control_rom" for hierarchy "datapath:datapath|control_rom:CONTROL" File: /job/student/hdl/datapath.sv Line: 370
Info (10041): Inferred latch for "ctrl.load_ir" at control.sv(24) File: /job/student/hdl/control.sv Line: 24
Info (12128): Elaborating entity "control_signal_reg" for hierarchy "datapath:datapath|control_signal_reg:CS_REG_E" File: /job/student/hdl/datapath.sv Line: 378
Warning (10230): Verilog HDL assignment warning at control_signals.sv(32): truncated value with size 32 to match size of target (31) File: /job/student/hdl/control_signals.sv Line: 32
Info (12128): Elaborating entity "alu" for hierarchy "datapath:datapath|alu:ALU" File: /job/student/hdl/datapath.sv Line: 401
Info (12128): Elaborating entity "mux2" for hierarchy "datapath:datapath|mux2:ALUMUX1" File: /job/student/hdl/datapath.sv Line: 410
Info (12128): Elaborating entity "mux6" for hierarchy "datapath:datapath|mux6:ALUMUX2" File: /job/student/hdl/datapath.sv Line: 423
Info (12128): Elaborating entity "cmp" for hierarchy "datapath:datapath|cmp:CMP" File: /job/student/hdl/datapath.sv Line: 449
Info (12128): Elaborating entity "zext" for hierarchy "datapath:datapath|zext:BR_EN_ZEXT" File: /job/student/hdl/datapath.sv Line: 463
Info (12128): Elaborating entity "mux4" for hierarchy "datapath:datapath|mux4:correctedpath" File: /job/student/hdl/datapath.sv Line: 492
Info (12128): Elaborating entity "lh" for hierarchy "datapath:datapath|lh:LH" File: /job/student/hdl/datapath.sv Line: 508
Info (12128): Elaborating entity "lhu" for hierarchy "datapath:datapath|lhu:LHU" File: /job/student/hdl/datapath.sv Line: 514
Info (12128): Elaborating entity "lb" for hierarchy "datapath:datapath|lb:LB" File: /job/student/hdl/datapath.sv Line: 520
Info (12128): Elaborating entity "lbu" for hierarchy "datapath:datapath|lbu:LBU" File: /job/student/hdl/datapath.sv Line: 526
Info (12128): Elaborating entity "lw" for hierarchy "datapath:datapath|lw:LW" File: /job/student/hdl/datapath.sv Line: 532
Warning (13024): Output pins are stuck at VCC or GND
    Warning (13410): Pin "inst_read" is stuck at VCC File: /job/student/hdl/mp3.sv Line: 11
    Warning (13410): Pin "inst_addr[0]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 12
    Warning (13410): Pin "inst_addr[1]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 12
    Warning (13410): Pin "data_read" is stuck at GND File: /job/student/hdl/mp3.sv Line: 13
    Warning (13410): Pin "data_write" is stuck at GND File: /job/student/hdl/mp3.sv Line: 14
    Warning (13410): Pin "data_mbe[0]" is stuck at VCC File: /job/student/hdl/mp3.sv Line: 15
    Warning (13410): Pin "data_mbe[1]" is stuck at VCC File: /job/student/hdl/mp3.sv Line: 15
    Warning (13410): Pin "data_mbe[2]" is stuck at VCC File: /job/student/hdl/mp3.sv Line: 15
    Warning (13410): Pin "data_mbe[3]" is stuck at VCC File: /job/student/hdl/mp3.sv Line: 15
    Warning (13410): Pin "data_addr[0]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[1]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[2]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[3]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[4]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[5]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[6]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[7]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[8]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[9]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[10]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[11]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[12]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[13]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[14]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[15]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[16]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[25]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[26]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[27]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[28]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[29]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[30]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_addr[31]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 16
    Warning (13410): Pin "data_wdata[0]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[1]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[2]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[3]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[4]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[5]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[6]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[7]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[8]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[9]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[10]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[11]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[12]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[13]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[14]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[15]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[16]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[17]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[18]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[19]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[20]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[21]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[22]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[23]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[24]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[25]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[26]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[27]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[28]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[29]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[30]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
    Warning (13410): Pin "data_wdata[31]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 18
Info (286030): Timing-Driven Synthesis is running
Info (17049): 19 registers lost all their fanouts during netlist optimizations.
Info (144001): Generated suppressed messages file /job/student/output_files/mp3.map.smsg
Info (16010): Generating hard_block partition "hard_block:auto_generated_inst"
    Info (16011): Adding 0 node(s), including 0 DDIO, 0 PLL, 0 transceiver and 0 LCELL
Warning (21074): Design contains 33 input pin(s) that do not drive logic
    Warning (15610): No output dependent on input pin "data_resp" File: /job/student/hdl/mp3.sv Line: 9
    Warning (15610): No output dependent on input pin "data_rdata[0]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[24]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[16]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[8]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[1]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[9]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[25]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[17]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[2]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[10]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[26]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[18]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[3]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[11]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[27]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[19]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[4]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[12]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[28]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[20]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[5]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[13]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[29]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[21]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[6]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[14]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[30]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[22]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[7]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[31]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[23]" File: /job/student/hdl/mp3.sv Line: 10
    Warning (15610): No output dependent on input pin "data_rdata[15]" File: /job/student/hdl/mp3.sv Line: 10
Info (21057): Implemented 567 device resources after synthesis - the final resource count might be different
    Info (21058): Implemented 68 input pins
    Info (21059): Implemented 103 output pins
    Info (21061): Implemented 396 logic cells
Info: Quartus Prime Analysis & Synthesis was successful. 0 errors, 102 warnings
    Info: Peak virtual memory: 1223 megabytes
    Info: Processing ended: Tue Apr  7 21:08:29 2020
    Info: Elapsed time: 00:00:17
    Info: Total CPU time (on all processors): 00:00:41
Info: *******************************************************************
Info: Running Quartus Prime Shell
    Info: Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition
    Info: Copyright (C) 2018  Intel Corporation. All rights reserved.
    Info: Your use of Intel Corporation's design tools, logic functions 
    Info: and other software and tools, and its AMPP partner logic 
    Info: functions, and any output files from any of the foregoing 
    Info: (including device programming or simulation files), and any 
    Info: associated documentation or information are expressly subject 
    Info: to the terms and conditions of the Intel Program License 
    Info: Subscription Agreement, the Intel Quartus Prime License Agreement,
    Info: the Intel FPGA IP License Agreement, or other applicable license
    Info: agreement, including, without limitation, that your use is for
    Info: the sole purpose of programming logic devices manufactured by
    Info: Intel and sold by Intel or its authorized distributors.  Please
    Info: refer to the applicable agreement for further details.
    Info: Processing started: Tue Apr  7 21:08:30 2020
Info: Command: quartus_sh -t /opt/altera/quartus/common/tcl/internal/nativelink/qnativesim.tcl --gen_script --rtl_sim mp3 mp3
Info: Quartus(args): --gen_script --rtl_sim mp3 mp3
Info: Info: Start Nativelink Simulation process
Info: Info: NativeLink has detected Verilog design -- Verilog simulation models will be used
Info: Info: Starting NativeLink simulation with ModelSim-Altera software
Info: Info: Generated ModelSim-Altera script file /job/student/simulation/modelsim/mp3_run_msim_rtl_verilog.do File: /job/student/simulation/modelsim/mp3_run_msim_rtl_verilog.do Line: 0
Info: Info: NativeLink simulation flow was successful
Info: Info: For messages from NativeLink scripts, check the file /job/student/mp3_nativelink_simulation.rpt File: /job/student/mp3_nativelink_simulation.rpt Line: 0
Info (23030): Evaluation of Tcl script /opt/altera/quartus/common/tcl/internal/nativelink/qnativesim.tcl was successful
Info: Quartus Prime Shell was successful. 0 errors, 0 warnings
    Info: Peak virtual memory: 789 megabytes
    Info: Processing ended: Tue Apr  7 21:08:30 2020
    Info: Elapsed time: 00:00:00
    Info: Total CPU time (on all processors): 00:00:00
Reading pref.tcl

# 10.5b

ModelSim> transcript on
ModelSim> > > if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
ModelSim> vlib rtl_work
ModelSim> vmap work rtl_work
# Model Technology ModelSim - Intel FPGA Edition vmap 10.5b Lib Mapping Utility 2016.10 Oct  5 2016
# vmap work rtl_work 
# Modifying /opt/altera/modelsim_ase/linuxaloem/../modelsim.ini
ModelSim> 
> 
vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/stage.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:31 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/stage.sv 
# ** Error: /job/student/hdl/stage.sv(1): (vlog-13006) Could not find the package (rv32i_types).  Design read will continue, but expect a cascade of errors after this failure.  Furthermore if you experience a vopt-7 error immediately before this error then please check the package names or the library search paths on the command line.
# End time: 21:08:31 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 1, Warnings: 0
# /opt/altera/modelsim_ase/linuxaloem/vlog failed.
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/loads.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:31 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/loads.sv 
# -- Compiling module lh
# -- Compiling module lhu
# -- Compiling module lb
# -- Compiling module lbu
# -- Compiling module lw
# 
# Top level modules:
# 	lh
# 	lhu
# 	lb
# 	lbu
# 	lw
# End time: 21:08:31 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/zext.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:31 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/zext.sv 
# -- Compiling module zext
# 
# Top level modules:
# 	zext
# End time: 21:08:31 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/mux.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:31 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/mux.sv 
# -- Compiling module mux2
# -- Compiling module mux3
# -- Compiling module mux4
# -- Compiling module mux6
# -- Compiling module mux9
# 
# Top level modules:
# 	mux2
# 	mux3
# 	mux4
# 	mux6
# 	mux9
# End time: 21:08:31 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/rv32i_mux_types.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:31 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/rv32i_mux_types.sv 
# -- Compiling package pcmux
# -- Compiling package marmux
# -- Compiling package cmpmux
# -- Compiling package alumux
# -- Compiling package regfilemux
# 
# Top level modules:
# 	--none--
# End time: 21:08:31 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/register.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:31 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/register.sv 
# -- Compiling module register
# 
# Top level modules:
# 	register
# End time: 21:08:31 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/regfile.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:31 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/regfile.sv 
# -- Compiling module regfile
# 
# Top level modules:
# 	regfile
# End time: 21:08:31 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/pc_reg.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:31 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/pc_reg.sv 
# -- Compiling module pc_register
# 
# Top level modules:
# 	pc_register
# End time: 21:08:31 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/rv32i_types.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:31 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/rv32i_types.sv 
# -- Compiling package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# 
# Top level modules:
# 	--none--
# End time: 21:08:31 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/control_signals.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:31 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/control_signals.sv 
# -- Compiling package control_signals_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module control_signal_reg
# 
# Top level modules:
# 	control_signal_reg
# End time: 21:08:32 on Apr 07,2020, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/ir.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:32 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/ir.sv 
# -- Compiling package ir_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module ir
# 
# Top level modules:
# 	ir
# End time: 21:08:32 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/datapath.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:32 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/datapath.sv 
# -- Compiling package datapath_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module datapath
# 
# Top level modules:
# 	datapath
# End time: 21:08:32 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/control.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:32 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/control.sv 
# -- Compiling package control_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module control_rom
# 
# Top level modules:
# 	control_rom
# End time: 21:08:32 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/cmp.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:32 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/cmp.sv 
# -- Compiling package cmp_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module cmp
# 
# Top level modules:
# 	cmp
# End time: 21:08:32 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/alu.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:32 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/alu.sv 
# -- Compiling package alu_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module alu
# 
# Top level modules:
# 	alu
# End time: 21:08:32 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/mp3.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:32 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/mp3.sv 
# -- Compiling package mp3_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module mp3
# 
# Top level modules:
# 	mp3
# End time: 21:08:32 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> 
> 
vlog -vlog01compat -work work +incdir+/job/student/hvl {/job/student/hvl/rvfimon.v}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:32 on Apr 07,2020
# vlog -vlog01compat -work work "+incdir+/job/student/hvl" /job/student/hvl/rvfimon.v 
# -- Compiling module riscv_formal_monitor_rv32imc
# -- Compiling module riscv_formal_monitor_rv32imc_rob
# -- Compiling module riscv_formal_monitor_rv32imc_isa_spec
# -- Compiling module riscv_formal_monitor_rv32imc_insn_add
# -- Compiling module riscv_formal_monitor_rv32imc_insn_addi
# -- Compiling module riscv_formal_monitor_rv32imc_insn_and
# -- Compiling module riscv_formal_monitor_rv32imc_insn_andi
# -- Compiling module riscv_formal_monitor_rv32imc_insn_auipc
# -- Compiling module riscv_formal_monitor_rv32imc_insn_beq
# -- Compiling module riscv_formal_monitor_rv32imc_insn_bge
# -- Compiling module riscv_formal_monitor_rv32imc_insn_bgeu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_blt
# -- Compiling module riscv_formal_monitor_rv32imc_insn_bltu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_bne
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_add
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_addi
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_addi16sp
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_addi4spn
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_and
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_andi
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_beqz
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_bnez
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_j
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_jal
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_jalr
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_jr
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_li
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_lui
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_lw
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_lwsp
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_mv
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_or
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_slli
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_srai
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_srli
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_sub
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_sw
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_swsp
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_xor
# -- Compiling module riscv_formal_monitor_rv32imc_insn_div
# -- Compiling module riscv_formal_monitor_rv32imc_insn_divu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_jal
# -- Compiling module riscv_formal_monitor_rv32imc_insn_jalr
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lb
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lbu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lh
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lhu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lui
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lw
# -- Compiling module riscv_formal_monitor_rv32imc_insn_mul
# -- Compiling module riscv_formal_monitor_rv32imc_insn_mulh
# -- Compiling module riscv_formal_monitor_rv32imc_insn_mulhsu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_mulhu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_or
# -- Compiling module riscv_formal_monitor_rv32imc_insn_ori
# -- Compiling module riscv_formal_monitor_rv32imc_insn_rem
# -- Compiling module riscv_formal_monitor_rv32imc_insn_remu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sb
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sh
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sll
# -- Compiling module riscv_formal_monitor_rv32imc_insn_slli
# -- Compiling module riscv_formal_monitor_rv32imc_insn_slt
# -- Compiling module riscv_formal_monitor_rv32imc_insn_slti
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sltiu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sltu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sra
# -- Compiling module riscv_formal_monitor_rv32imc_insn_srai
# -- Compiling module riscv_formal_monitor_rv32imc_insn_srl
# -- Compiling module riscv_formal_monitor_rv32imc_insn_srli
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sub
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sw
# -- Compiling module riscv_formal_monitor_rv32imc_insn_xor
# -- Compiling module riscv_formal_monitor_rv32imc_insn_xori
# 
# Top level modules:
# 	riscv_formal_monitor_rv32imc
# End time: 21:08:32 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hvl {/job/student/hvl/source_tb.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:32 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hvl" /job/student/hvl/source_tb.sv 
# -- Compiling module magic_memory_dp
# -- Compiling module ParamMemory
# ** Warning: ** while parsing file included at /job/student/hvl/source_tb.sv(14)
# ** at hvl/param_memory.sv(25): (vlog-2244) Variable 'iteration' is implicitly static. You must either explicitly declare it as static or automatic
# or remove the initialization in the declaration of variable.
# -- Compiling interface rvfi_itf
# -- Compiling module shadow_memory
# -- Compiling interface tb_itf
# -- Compiling package ag_rv32i_types
# -- Compiling package source_tb_sv_unit
# -- Importing package ag_rv32i_types
# -- Compiling module source_tb
# 
# Top level modules:
# 	source_tb
# End time: 21:08:32 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 1
ModelSim> vlog -sv -work work +incdir+/job/student/hvl {/job/student/hvl/top.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:08:32 on Apr 07,2020
# vlog -sv -work work "+incdir+/job/student/hvl" /job/student/hvl/top.sv 
# -- Compiling module mp3_tb
# 
# Top level modules:
# 	mp3_tb
# End time: 21:08:32 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> 
> 
vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriaii_hssi_ver -L arriaii_pcie_hip_ver -L arriaii_ver -L rtl_work -L work -voptargs="+acc"  mp3_tb
# vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriaii_hssi_ver -L arriaii_pcie_hip_ver -L arriaii_ver -L rtl_work -L work -voptargs=""+acc"" mp3_tb 
# Start time: 21:08:32 on Apr 07,2020
# Loading sv_std.std
# Loading work.mp3_tb
# Loading work.tb_itf
# Loading work.rvfi_itf
# Loading work.ag_rv32i_types
# Loading work.source_tb_sv_unit
# Loading work.source_tb
# Loading work.regfilemux
# Loading work.alumux
# Loading work.cmpmux
# Loading work.marmux
# Loading work.pcmux
# Loading work.rv32i_types
# Loading work.mp3_sv_unit
# Loading work.mp3
# Loading work.datapath_sv_unit
# Loading work.datapath
# ** Error: (vsim-3033) /job/student/hdl/datapath.sv(150): Instantiation of 'stage' failed. The design unit was not found.
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/dut/datapath File: /job/student/hdl/datapath.sv
#         Searched libraries:
#             /opt/altera/modelsim_ase/altera/verilog/altera
#             /opt/altera/modelsim_ase/altera/verilog/220model
#             /opt/altera/modelsim_ase/altera/verilog/sgate
#             /opt/altera/modelsim_ase/altera/verilog/altera_mf
#             /opt/altera/modelsim_ase/altera/verilog/altera_lnsim
#             /opt/altera/modelsim_ase/altera/verilog/arriaii_hssi
#             /opt/altera/modelsim_ase/altera/verilog/arriaii_pcie_hip
#             /opt/altera/modelsim_ase/altera/verilog/arriaii
#             /job/student/rtl_work
#             /job/student/rtl_work
# Loading work.pc_register
# Loading work.mux3
# Loading work.register
# Loading work.ir_sv_unit
# Loading work.ir
# Loading work.regfile
# Loading work.mux9
# Loading work.control_sv_unit
# Loading work.control_rom
# Loading work.control_signals_sv_unit
# Loading work.control_signal_reg
# Loading work.alu_sv_unit
# Loading work.alu
# Loading work.mux2
# Loading work.mux6
# Loading work.cmp_sv_unit
# Loading work.cmp
# Loading work.zext
# Loading work.mux4
# Loading work.lh
# Loading work.lhu
# Loading work.lb
# Loading work.lbu
# Loading work.lw
# Error loading design
# End time: 21:08:32 on Apr 07,2020, Elapsed time: 0:00:00
# Errors: 1, Warnings: 0

```

</details>


### Targeted Tests: 
<ul>
<li> <b>cp1_cache</b> <img src="https://upload.wikimedia.org/wikipedia/en/thumb/7/74/Ambox_warning_yellow.svg/40px-Ambox_warning_yellow.svg.png" alt="error" width="13" height="13" ></img><details>
<summary>Error Occurred</summary>

```
An error occured when running this test.
If your code did not successfully compile, that is likely the reason.
If your code did compile, then please reach out to a TA on Piazza
```

</details>
</li>
<li> <b>cp2</b> <img src="https://upload.wikimedia.org/wikipedia/en/thumb/7/74/Ambox_warning_yellow.svg/40px-Ambox_warning_yellow.svg.png" alt="error" width="13" height="13" ></img><details>
<summary>Error Occurred</summary>

```
An error occured when running this test.
If your code did not successfully compile, that is likely the reason.
If your code did compile, then please reach out to a TA on Piazza
```

</details>
</li>
</ul>

---
Staff use: 5e8ceafe52680ce0e28cea0a

[success]: https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png 
[failure]: https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Red_x.svg/13px-Red_x.svg.png 