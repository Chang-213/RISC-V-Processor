# AG Report Generated 2020-04-29 12:09
This is a report about mp3cp4 generated for letUsGraduate at 2020-04-29 12:09. The autograder used commit ``6a8c092b4f65`` as a starting point. If you have any questions about this report, please contact the TAs on Piazza.
### Quick Results:
 - Compilation: YES
 - Targeted: 1/4 (25.0%)
### Compilation ![Success][success]
You succesfully compiled. Your report is below.
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
    Info: Processing started: Wed Apr 29 17:07:07 2020
Info: Command: quartus_map mp3 -c mp3
Warning (18236): Number of processors has not been specified which may cause overloading on shared machines.  Set the global assignment NUM_PARALLEL_PROCESSORS in your QSF to an appropriate value for best performance.
Info (20030): Parallel compilation is enabled and will use 4 of the 4 processors detected
Info (12021): Found 1 design units, including 1 entities, in source file hdl/l2_datapath.sv
    Info (12023): Found entity 1: l2_datapath File: /job/student/hdl/l2_datapath.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/l2_data_array.sv
    Info (12023): Found entity 1: l2_data_array File: /job/student/hdl/l2_data_array.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/l2_control.sv
    Info (12023): Found entity 1: l2_control File: /job/student/hdl/l2_control.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/l2_cache.sv
    Info (12023): Found entity 1: l2_cache File: /job/student/hdl/l2_cache.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/l2_array.sv
    Info (12023): Found entity 1: l2_array File: /job/student/hdl/l2_array.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/br_flush.sv
    Info (12023): Found entity 1: br_flush File: /job/student/hdl/br_flush.sv Line: 2
Info (12021): Found 4 design units, including 4 entities, in source file hdl/rvfi_packet.sv
    Info (12023): Found entity 1: rvfi_reg_start File: /job/student/hdl/rvfi_packet.sv Line: 3
    Info (12023): Found entity 2: rvfi_reg File: /job/student/hdl/rvfi_packet.sv Line: 66
    Info (12023): Found entity 3: rvfi_reg_e File: /job/student/hdl/rvfi_packet.sv Line: 126
    Info (12023): Found entity 4: rvfi_reg_out File: /job/student/hdl/rvfi_packet.sv Line: 188
Info (12021): Found 1 design units, including 1 entities, in source file hdl/hazard.sv
    Info (12023): Found entity 1: hazard File: /job/student/hdl/hazard.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/forwarding.sv
    Info (12023): Found entity 1: forwarding File: /job/student/hdl/forwarding.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/ctrl_mux.sv
    Info (12023): Found entity 1: ctrl_mux2 File: /job/student/hdl/ctrl_mux.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache_control_data.sv
    Info (12023): Found entity 1: cache_control_data File: /job/student/hdl/cache_control_data.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache_datapath_data.sv
    Info (12023): Found entity 1: cache_datapath_data File: /job/student/hdl/cache_datapath_data.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache_data.sv
    Info (12023): Found entity 1: cache_data File: /job/student/hdl/cache_data.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cacheline_adapter.sv
    Info (12023): Found entity 1: cacheline_adapter File: /job/student/hdl/cacheline_adapter.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/bus_adapter.sv
    Info (12023): Found entity 1: bus_adapter File: /job/student/hdl/bus_adapter.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/arbiter.sv
    Info (12023): Found entity 1: arbiter File: /job/student/hdl/arbiter.sv Line: 2
Info (12021): Found 7 design units, including 7 entities, in source file hdl/lower_level.sv
    Info (12023): Found entity 1: mux4bit File: /job/student/hdl/lower_level.sv Line: 2
    Info (12023): Found entity 2: mux2bit File: /job/student/hdl/lower_level.sv Line: 24
    Info (12023): Found entity 3: mux3bit File: /job/student/hdl/lower_level.sv Line: 42
    Info (12023): Found entity 4: mux256bit File: /job/student/hdl/lower_level.sv Line: 64
    Info (12023): Found entity 5: comparator File: /job/student/hdl/lower_level.sv Line: 82
    Info (12023): Found entity 6: andgate File: /job/student/hdl/lower_level.sv Line: 99
    Info (12023): Found entity 7: orgate File: /job/student/hdl/lower_level.sv Line: 116
Info (12021): Found 1 design units, including 1 entities, in source file hdl/data_array.sv
    Info (12023): Found entity 1: data_array File: /job/student/hdl/data_array.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache_datapath.sv
    Info (12023): Found entity 1: cache_datapath File: /job/student/hdl/cache_datapath.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache_control.sv
    Info (12023): Found entity 1: cache_control File: /job/student/hdl/cache_control.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/array.sv
    Info (12023): Found entity 1: array File: /job/student/hdl/array.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache.sv
    Info (12023): Found entity 1: cache File: /job/student/hdl/cache.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/opcode_reg.sv
    Info (12023): Found entity 1: opcode_reg File: /job/student/hdl/opcode_reg.sv Line: 3
Warning (12019): Can't analyze file -- file hdl/stage_writeback.sv is missing
Warning (12019): Can't analyze file -- file hdl/stage_memory.sv is missing
Warning (12019): Can't analyze file -- file hdl/stage_execute.sv is missing
Info (12021): Found 1 design units, including 1 entities, in source file hdl/stage_decode.sv
    Info (12023): Found entity 1: stage_decode File: /job/student/hdl/stage_decode.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/control_signals.sv
    Info (12023): Found entity 1: control_signal_reg File: /job/student/hdl/control_signals.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/mp3.sv
    Info (12023): Found entity 1: mp3 File: /job/student/hdl/mp3.sv Line: 2
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
    Info (12022): Found design unit 2: marmux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 10
    Info (12022): Found design unit 3: cmpmux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 17
    Info (12022): Found design unit 4: alumux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 24
    Info (12022): Found design unit 5: regfilemux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 40
Info (12021): Found 2 design units, including 2 entities, in source file hdl/register.sv
    Info (12023): Found entity 1: register File: /job/student/hdl/register.sv Line: 1
    Info (12023): Found entity 2: register_comb File: /job/student/hdl/register.sv Line: 35
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
Warning (10236): Verilog HDL Implicit Net warning at datapath.sv(167): created implicit net for "ir_m_forward" File: /job/student/hdl/datapath.sv Line: 167
Warning (10236): Verilog HDL Implicit Net warning at datapath.sv(168): created implicit net for "ir_wb_forward" File: /job/student/hdl/datapath.sv Line: 168
Info (12127): Elaborating entity "mp3" for the top level hierarchy
Info (12128): Elaborating entity "datapath" for hierarchy "datapath:datapath" File: /job/student/hdl/mp3.sv Line: 174
Warning (10036): Verilog HDL or VHDL warning at datapath.sv(167): object "ir_m_forward" assigned a value but never read File: /job/student/hdl/datapath.sv Line: 167
Warning (10036): Verilog HDL or VHDL warning at datapath.sv(168): object "ir_wb_forward" assigned a value but never read File: /job/student/hdl/datapath.sv Line: 168
Warning (10036): Verilog HDL or VHDL warning at datapath.sv(184): object "rvfi_packet_wb" assigned a value but never read File: /job/student/hdl/datapath.sv Line: 184
Warning (10230): Verilog HDL assignment warning at datapath.sv(167): truncated value with size 32 to match size of target (1) File: /job/student/hdl/datapath.sv Line: 167
Warning (10230): Verilog HDL assignment warning at datapath.sv(168): truncated value with size 32 to match size of target (1) File: /job/student/hdl/datapath.sv Line: 168
Warning (10230): Verilog HDL assignment warning at datapath.sv(214): truncated value with size 32 to match size of target (5) File: /job/student/hdl/datapath.sv Line: 214
Info (12128): Elaborating entity "stage_decode" for hierarchy "datapath:datapath|stage_decode:STAGE_DECODE" File: /job/student/hdl/datapath.sv Line: 345
Warning (10036): Verilog HDL or VHDL warning at stage_decode.sv(18): object "data_writeback" assigned a value but never read File: /job/student/hdl/stage_decode.sv Line: 18
Info (12128): Elaborating entity "pc_register" for hierarchy "datapath:datapath|pc_register:PC" File: /job/student/hdl/datapath.sv Line: 356
Info (12128): Elaborating entity "mux4" for hierarchy "datapath:datapath|mux4:PCMUX" File: /job/student/hdl/datapath.sv Line: 367
Info (12128): Elaborating entity "register" for hierarchy "datapath:datapath|register:BRANCH_ADDR" File: /job/student/hdl/datapath.sv Line: 375
Info (12128): Elaborating entity "ir" for hierarchy "datapath:datapath|ir:IR" File: /job/student/hdl/datapath.sv Line: 427
Info (12128): Elaborating entity "register" for hierarchy "datapath:datapath|register:RS1_D" File: /job/student/hdl/datapath.sv Line: 435
Info (12128): Elaborating entity "register" for hierarchy "datapath:datapath|register:FUNCT3_D" File: /job/student/hdl/datapath.sv Line: 482
Info (12128): Elaborating entity "register" for hierarchy "datapath:datapath|register:FUNCT7_D" File: /job/student/hdl/datapath.sv Line: 490
Info (12128): Elaborating entity "opcode_reg" for hierarchy "datapath:datapath|opcode_reg:OPCODE_D" File: /job/student/hdl/datapath.sv Line: 498
Info (12128): Elaborating entity "regfile" for hierarchy "datapath:datapath|regfile:regfile" File: /job/student/hdl/datapath.sv Line: 672
Info (12128): Elaborating entity "mux9" for hierarchy "datapath:datapath|mux9:REGMUX" File: /job/student/hdl/datapath.sv Line: 690
Info (12128): Elaborating entity "mux2" for hierarchy "datapath:datapath|mux2:mem_forward" File: /job/student/hdl/datapath.sv Line: 723
Info (12128): Elaborating entity "control_rom" for hierarchy "datapath:datapath|control_rom:CONTROL" File: /job/student/hdl/datapath.sv Line: 732
Warning (10036): Verilog HDL or VHDL warning at control.sv(15): object "alu_op3" assigned a value but never read File: /job/student/hdl/control.sv Line: 15
Info (10041): Inferred latch for "ctrl.load_ir" at control.sv(26) File: /job/student/hdl/control.sv Line: 26
Info (12128): Elaborating entity "control_signal_reg" for hierarchy "datapath:datapath|control_signal_reg:CS_REG_E" File: /job/student/hdl/datapath.sv Line: 740
Info (12128): Elaborating entity "alu" for hierarchy "datapath:datapath|alu:ALU" File: /job/student/hdl/datapath.sv Line: 763
Info (12128): Elaborating entity "mux2" for hierarchy "datapath:datapath|mux2:stallMux" File: /job/student/hdl/datapath.sv Line: 787
Info (12128): Elaborating entity "ctrl_mux2" for hierarchy "datapath:datapath|ctrl_mux2:ctrlE_stall" File: /job/student/hdl/datapath.sv Line: 819
Info (12128): Elaborating entity "mux6" for hierarchy "datapath:datapath|mux6:ALUMUX2" File: /job/student/hdl/datapath.sv Line: 848
Info (12128): Elaborating entity "cmp" for hierarchy "datapath:datapath|cmp:CMP" File: /job/student/hdl/datapath.sv Line: 874
Info (12128): Elaborating entity "zext" for hierarchy "datapath:datapath|zext:BR_EN_ZEXT" File: /job/student/hdl/datapath.sv Line: 888
Info (12128): Elaborating entity "register" for hierarchy "datapath:datapath|register:CMP_Reg_M_NO_EXT" File: /job/student/hdl/datapath.sv Line: 896
Info (12128): Elaborating entity "lh" for hierarchy "datapath:datapath|lh:LH" File: /job/student/hdl/datapath.sv Line: 955
Info (12128): Elaborating entity "lhu" for hierarchy "datapath:datapath|lhu:LHU" File: /job/student/hdl/datapath.sv Line: 961
Info (12128): Elaborating entity "lb" for hierarchy "datapath:datapath|lb:LB" File: /job/student/hdl/datapath.sv Line: 967
Info (12128): Elaborating entity "lbu" for hierarchy "datapath:datapath|lbu:LBU" File: /job/student/hdl/datapath.sv Line: 973
Info (12128): Elaborating entity "lw" for hierarchy "datapath:datapath|lw:LW" File: /job/student/hdl/datapath.sv Line: 979
Info (12128): Elaborating entity "rvfi_reg_start" for hierarchy "datapath:datapath|rvfi_reg_start:RVFI_Reg_D" File: /job/student/hdl/datapath.sv Line: 1018
Info (12128): Elaborating entity "rvfi_reg_e" for hierarchy "datapath:datapath|rvfi_reg_e:RVFI_Reg_E" File: /job/student/hdl/datapath.sv Line: 1027
Info (12128): Elaborating entity "rvfi_reg" for hierarchy "datapath:datapath|rvfi_reg:RVFI_Reg_M" File: /job/student/hdl/datapath.sv Line: 1039
Info (12128): Elaborating entity "rvfi_reg_out" for hierarchy "datapath:datapath|rvfi_reg_out:RVFI_Reg_WB" File: /job/student/hdl/datapath.sv Line: 1049
Info (12128): Elaborating entity "forwarding" for hierarchy "forwarding:forwarding" File: /job/student/hdl/mp3.sv Line: 195
Info (12128): Elaborating entity "hazard" for hierarchy "hazard:hazard" File: /job/student/hdl/mp3.sv Line: 205
Info (12128): Elaborating entity "br_flush" for hierarchy "br_flush:br_flush" File: /job/student/hdl/mp3.sv Line: 212
Info (12128): Elaborating entity "cache" for hierarchy "cache:l1icache" File: /job/student/hdl/mp3.sv Line: 235
Warning (10036): Verilog HDL or VHDL warning at cache.sv(38): object "mem_rdata256" assigned a value but never read File: /job/student/hdl/cache.sv Line: 38
Info (12128): Elaborating entity "cache_control" for hierarchy "cache:l1icache|cache_control:control" File: /job/student/hdl/cache.sv Line: 110
Info (12128): Elaborating entity "cache_datapath" for hierarchy "cache:l1icache|cache_datapath:datapath" File: /job/student/hdl/cache.sv Line: 141
Warning (10036): Verilog HDL or VHDL warning at cache_datapath.sv(68): object "general_hit" assigned a value but never read File: /job/student/hdl/cache_datapath.sv Line: 68
Info (12128): Elaborating entity "mux2bit" for hierarchy "cache:l1icache|cache_datapath:datapath|mux2bit:VALID_BIT" File: /job/student/hdl/cache_datapath.sv Line: 118
Info (12128): Elaborating entity "mux2bit" for hierarchy "cache:l1icache|cache_datapath:datapath|mux2bit:TAG_OUT" File: /job/student/hdl/cache_datapath.sv Line: 127
Info (12128): Elaborating entity "mux2bit" for hierarchy "cache:l1icache|cache_datapath:datapath|mux2bit:PMEM_ADDRESS" File: /job/student/hdl/cache_datapath.sv Line: 145
Info (12128): Elaborating entity "mux2bit" for hierarchy "cache:l1icache|cache_datapath:datapath|mux2bit:PMEM_WDATA" File: /job/student/hdl/cache_datapath.sv Line: 155
Info (12128): Elaborating entity "mux4bit" for hierarchy "cache:l1icache|cache_datapath:datapath|mux4bit:WRITE_ENABLE0" File: /job/student/hdl/cache_datapath.sv Line: 166
Info (12128): Elaborating entity "array" for hierarchy "cache:l1icache|cache_datapath:datapath|array:VALID0" File: /job/student/hdl/cache_datapath.sv Line: 188
Warning (10036): Verilog HDL or VHDL warning at array.sv(28): object "_dataout" assigned a value but never read File: /job/student/hdl/array.sv Line: 28
Info (12128): Elaborating entity "array" for hierarchy "cache:l1icache|cache_datapath:datapath|array:TAG0" File: /job/student/hdl/cache_datapath.sv Line: 210
Warning (10036): Verilog HDL or VHDL warning at array.sv(28): object "_dataout" assigned a value but never read File: /job/student/hdl/array.sv Line: 28
Info (12128): Elaborating entity "data_array" for hierarchy "cache:l1icache|cache_datapath:datapath|data_array:DATA0" File: /job/student/hdl/cache_datapath.sv Line: 254
Info (12128): Elaborating entity "bus_adapter" for hierarchy "cache:l1icache|bus_adapter:bus_adapter" File: /job/student/hdl/cache.sv Line: 152
Info (12128): Elaborating entity "cache_data" for hierarchy "cache_data:l1dcache" File: /job/student/hdl/mp3.sv Line: 257
Warning (10036): Verilog HDL or VHDL warning at cache_data.sv(40): object "mem_rdata256" assigned a value but never read File: /job/student/hdl/cache_data.sv Line: 40
Info (12128): Elaborating entity "register_comb" for hierarchy "cache_data:l1dcache|register_comb:mem_rdata_save" File: /job/student/hdl/cache_data.sv Line: 82
Info (12128): Elaborating entity "cache_control_data" for hierarchy "cache_data:l1dcache|cache_control_data:control" File: /job/student/hdl/cache_data.sv Line: 127
Info (12128): Elaborating entity "cache_datapath_data" for hierarchy "cache_data:l1dcache|cache_datapath_data:datapath" File: /job/student/hdl/cache_data.sv Line: 158
Warning (10036): Verilog HDL or VHDL warning at cache_datapath_data.sv(68): object "general_hit" assigned a value but never read File: /job/student/hdl/cache_datapath_data.sv Line: 68
Info (12128): Elaborating entity "l2_cache" for hierarchy "l2_cache:L2CACHE" File: /job/student/hdl/mp3.sv Line: 279
Info (12128): Elaborating entity "l2_control" for hierarchy "l2_cache:L2CACHE|l2_control:control" File: /job/student/hdl/l2_cache.sv Line: 86
Info (12128): Elaborating entity "l2_datapath" for hierarchy "l2_cache:L2CACHE|l2_datapath:datapath" File: /job/student/hdl/l2_cache.sv Line: 118
Warning (10036): Verilog HDL or VHDL warning at l2_datapath.sv(69): object "general_hit" assigned a value but never read File: /job/student/hdl/l2_datapath.sv Line: 69
Info (12128): Elaborating entity "l2_array" for hierarchy "l2_cache:L2CACHE|l2_datapath:datapath|l2_array:VALID0" File: /job/student/hdl/l2_datapath.sv Line: 198
Warning (10036): Verilog HDL or VHDL warning at l2_array.sv(28): object "_dataout" assigned a value but never read File: /job/student/hdl/l2_array.sv Line: 28
Info (12128): Elaborating entity "l2_array" for hierarchy "l2_cache:L2CACHE|l2_datapath:datapath|l2_array:TAG0" File: /job/student/hdl/l2_datapath.sv Line: 220
Warning (10036): Verilog HDL or VHDL warning at l2_array.sv(28): object "_dataout" assigned a value but never read File: /job/student/hdl/l2_array.sv Line: 28
Info (12128): Elaborating entity "l2_data_array" for hierarchy "l2_cache:L2CACHE|l2_datapath:datapath|l2_data_array:DATA0" File: /job/student/hdl/l2_datapath.sv Line: 264
Info (12128): Elaborating entity "arbiter" for hierarchy "arbiter:arbiter" File: /job/student/hdl/mp3.sv Line: 314
Warning (10036): Verilog HDL or VHDL warning at arbiter.sv(57): object "read_L2_in" assigned a value but never read File: /job/student/hdl/arbiter.sv Line: 57
Warning (10036): Verilog HDL or VHDL warning at arbiter.sv(58): object "write_L2_in" assigned a value but never read File: /job/student/hdl/arbiter.sv Line: 58
Warning (10036): Verilog HDL or VHDL warning at arbiter.sv(59): object "addr_L2_in" assigned a value but never read File: /job/student/hdl/arbiter.sv Line: 59
Warning (10036): Verilog HDL or VHDL warning at arbiter.sv(60): object "wdata_L2_in" assigned a value but never read File: /job/student/hdl/arbiter.sv Line: 60
Warning (10958): SystemVerilog warning at arbiter.sv(235): unique or priority keyword makes case statement complete File: /job/student/hdl/arbiter.sv Line: 235
Info (12128): Elaborating entity "register_comb" for hierarchy "arbiter:arbiter|register_comb:rdata_L2_save" File: /job/student/hdl/arbiter.sv Line: 168
Info (12128): Elaborating entity "cacheline_adapter" for hierarchy "cacheline_adapter:CA" File: /job/student/hdl/mp3.sv Line: 335
Warning (12241): 3 hierarchies have connectivity warnings - see the Connectivity Checks report folder
Warning (13024): Output pins are stuck at VCC or GND
    Warning (13410): Pin "pmem_addr[0]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 25
    Warning (13410): Pin "pmem_addr[1]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 25
    Warning (13410): Pin "pmem_addr[2]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 25
    Warning (13410): Pin "pmem_addr[3]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 25
    Warning (13410): Pin "pmem_addr[4]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 25
Info (286030): Timing-Driven Synthesis is running
Info (17049): 155 registers lost all their fanouts during netlist optimizations.
Info (144001): Generated suppressed messages file /job/student/output_files/mp3.map.smsg
Info (16010): Generating hard_block partition "hard_block:auto_generated_inst"
    Info (16011): Adding 0 node(s), including 0 DDIO, 0 PLL, 0 transceiver and 0 LCELL
Info (21057): Implemented 31553 device resources after synthesis - the final resource count might be different
    Info (21058): Implemented 67 input pins
    Info (21059): Implemented 98 output pins
    Info (21061): Implemented 31388 logic cells
Info: Quartus Prime Analysis & Synthesis was successful. 0 errors, 35 warnings
    Info: Peak virtual memory: 1380 megabytes
    Info: Processing ended: Wed Apr 29 17:09:01 2020
    Info: Elapsed time: 00:01:54
    Info: Total CPU time (on all processors): 00:02:07
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
    Info: Processing started: Wed Apr 29 17:09:01 2020
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
    Info: Peak virtual memory: 809 megabytes
    Info: Processing ended: Wed Apr 29 17:09:02 2020
    Info: Elapsed time: 00:00:01
    Info: Total CPU time (on all processors): 00:00:01
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
vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/l2_datapath.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/l2_datapath.sv 
# -- Compiling module l2_datapath
# 
# Top level modules:
# 	l2_datapath
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/l2_data_array.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/l2_data_array.sv 
# -- Compiling module l2_data_array
# 
# Top level modules:
# 	l2_data_array
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/l2_control.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/l2_control.sv 
# -- Compiling module l2_control
# 
# Top level modules:
# 	l2_control
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/l2_cache.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/l2_cache.sv 
# -- Compiling module l2_cache
# 
# Top level modules:
# 	l2_cache
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/l2_array.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/l2_array.sv 
# -- Compiling module l2_array
# 
# Top level modules:
# 	l2_array
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/cache_control_data.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/cache_control_data.sv 
# -- Compiling module cache_control_data
# 
# Top level modules:
# 	cache_control_data
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/cache_datapath_data.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/cache_datapath_data.sv 
# -- Compiling module cache_datapath_data
# 
# Top level modules:
# 	cache_datapath_data
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/cache_data.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/cache_data.sv 
# -- Compiling module cache_data
# 
# Top level modules:
# 	cache_data
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/cacheline_adapter.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/cacheline_adapter.sv 
# -- Compiling module cacheline_adapter
# 
# Top level modules:
# 	cacheline_adapter
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/bus_adapter.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/bus_adapter.sv 
# -- Compiling module bus_adapter
# 
# Top level modules:
# 	bus_adapter
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/lower_level.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/lower_level.sv 
# -- Compiling module mux4bit
# -- Compiling module mux2bit
# -- Compiling module mux3bit
# -- Compiling module mux256bit
# -- Compiling module comparator
# -- Compiling module andgate
# -- Compiling module orgate
# 
# Top level modules:
# 	mux4bit
# 	mux2bit
# 	mux3bit
# 	mux256bit
# 	comparator
# 	andgate
# 	orgate
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/data_array.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/data_array.sv 
# -- Compiling module data_array
# 
# Top level modules:
# 	data_array
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/cache_datapath.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/cache_datapath.sv 
# -- Compiling module cache_datapath
# 
# Top level modules:
# 	cache_datapath
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/cache_control.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/cache_control.sv 
# -- Compiling module cache_control
# 
# Top level modules:
# 	cache_control
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/array.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/array.sv 
# -- Compiling module array
# 
# Top level modules:
# 	array
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/cache.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/cache.sv 
# -- Compiling module cache
# 
# Top level modules:
# 	cache
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/stage_decode.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/stage_decode.sv 
# -- Compiling module stage_decode
# 
# Top level modules:
# 	stage_decode
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/loads.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
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
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/zext.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/zext.sv 
# -- Compiling module zext
# 
# Top level modules:
# 	zext
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/mux.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
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
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/rv32i_mux_types.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/rv32i_mux_types.sv 
# -- Compiling package pcmux
# -- Compiling package marmux
# -- Compiling package cmpmux
# -- Compiling package alumux
# -- Compiling package regfilemux
# 
# Top level modules:
# 	--none--
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/register.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/register.sv 
# -- Compiling module register
# -- Compiling module register_comb
# 
# Top level modules:
# 	register
# 	register_comb
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/regfile.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/regfile.sv 
# -- Compiling module regfile
# 
# Top level modules:
# 	regfile
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/pc_reg.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/pc_reg.sv 
# -- Compiling module pc_register
# 
# Top level modules:
# 	pc_register
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/rv32i_types.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
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
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/br_flush.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/br_flush.sv 
# -- Compiling package br_flush_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module br_flush
# 
# Top level modules:
# 	br_flush
# End time: 17:09:03 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/rvfi_packet.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:03 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/rvfi_packet.sv 
# -- Compiling package rvfi_packet_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module rvfi_reg_start
# -- Compiling module rvfi_reg
# -- Compiling module rvfi_reg_e
# -- Compiling module rvfi_reg_out
# 
# Top level modules:
# 	rvfi_reg_start
# 	rvfi_reg
# 	rvfi_reg_e
# 	rvfi_reg_out
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/hazard.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:04 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/hazard.sv 
# -- Compiling package hazard_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module hazard
# 
# Top level modules:
# 	hazard
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/forwarding.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:04 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/forwarding.sv 
# -- Compiling package forwarding_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module forwarding
# 
# Top level modules:
# 	forwarding
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/ctrl_mux.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:04 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/ctrl_mux.sv 
# -- Compiling package ctrl_mux_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module ctrl_mux2
# 
# Top level modules:
# 	ctrl_mux2
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/arbiter.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:04 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/arbiter.sv 
# -- Compiling package arbiter_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module arbiter
# 
# Top level modules:
# 	arbiter
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/opcode_reg.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:04 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/opcode_reg.sv 
# -- Compiling package opcode_reg_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module opcode_reg
# 
# Top level modules:
# 	opcode_reg
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/control_signals.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:04 on Apr 29,2020
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
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/mp3.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:04 on Apr 29,2020
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
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/ir.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:04 on Apr 29,2020
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
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/control.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:04 on Apr 29,2020
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
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/cmp.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:04 on Apr 29,2020
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
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/alu.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:04 on Apr 29,2020
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
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/datapath.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:04 on Apr 29,2020
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
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> 
> 
vlog -vlog01compat -work work +incdir+/job/student/hvl {/job/student/hvl/rvfimon.v}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:04 on Apr 29,2020
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
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hvl {/job/student/hvl/source_tb.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:04 on Apr 29,2020
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
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 1
ModelSim> vlog -sv -work work +incdir+/job/student/hvl {/job/student/hvl/top.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 17:09:04 on Apr 29,2020
# vlog -sv -work work "+incdir+/job/student/hvl" /job/student/hvl/top.sv 
# -- Compiling module mp3_tb
# 
# Top level modules:
# 	mp3_tb
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> 
> 
vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriaii_hssi_ver -L arriaii_pcie_hip_ver -L arriaii_ver -L rtl_work -L work -voptargs="+acc"  mp3_tb
# vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriaii_hssi_ver -L arriaii_pcie_hip_ver -L arriaii_ver -L rtl_work -L work -voptargs=""+acc"" mp3_tb 
# Start time: 17:09:04 on Apr 29,2020
# Loading sv_std.std
# Loading work.mp3_tb
# Loading work.tb_itf
# Loading work.rvfi_itf
# Loading work.ag_rv32i_types
# Loading work.source_tb_sv_unit
# Loading work.source_tb
# Loading work.riscv_formal_monitor_rv32imc
# Loading work.riscv_formal_monitor_rv32imc_isa_spec
# Loading work.riscv_formal_monitor_rv32imc_insn_add
# Loading work.riscv_formal_monitor_rv32imc_insn_addi
# Loading work.riscv_formal_monitor_rv32imc_insn_and
# Loading work.riscv_formal_monitor_rv32imc_insn_andi
# Loading work.riscv_formal_monitor_rv32imc_insn_auipc
# Loading work.riscv_formal_monitor_rv32imc_insn_beq
# Loading work.riscv_formal_monitor_rv32imc_insn_bge
# Loading work.riscv_formal_monitor_rv32imc_insn_bgeu
# Loading work.riscv_formal_monitor_rv32imc_insn_blt
# Loading work.riscv_formal_monitor_rv32imc_insn_bltu
# Loading work.riscv_formal_monitor_rv32imc_insn_bne
# Loading work.riscv_formal_monitor_rv32imc_insn_c_add
# Loading work.riscv_formal_monitor_rv32imc_insn_c_addi
# Loading work.riscv_formal_monitor_rv32imc_insn_c_addi16sp
# Loading work.riscv_formal_monitor_rv32imc_insn_c_addi4spn
# Loading work.riscv_formal_monitor_rv32imc_insn_c_and
# Loading work.riscv_formal_monitor_rv32imc_insn_c_andi
# Loading work.riscv_formal_monitor_rv32imc_insn_c_beqz
# Loading work.riscv_formal_monitor_rv32imc_insn_c_bnez
# Loading work.riscv_formal_monitor_rv32imc_insn_c_j
# Loading work.riscv_formal_monitor_rv32imc_insn_c_jal
# Loading work.riscv_formal_monitor_rv32imc_insn_c_jalr
# Loading work.riscv_formal_monitor_rv32imc_insn_c_jr
# Loading work.riscv_formal_monitor_rv32imc_insn_c_li
# Loading work.riscv_formal_monitor_rv32imc_insn_c_lui
# Loading work.riscv_formal_monitor_rv32imc_insn_c_lw
# Loading work.riscv_formal_monitor_rv32imc_insn_c_lwsp
# Loading work.riscv_formal_monitor_rv32imc_insn_c_mv
# Loading work.riscv_formal_monitor_rv32imc_insn_c_or
# Loading work.riscv_formal_monitor_rv32imc_insn_c_slli
# Loading work.riscv_formal_monitor_rv32imc_insn_c_srai
# Loading work.riscv_formal_monitor_rv32imc_insn_c_srli
# Loading work.riscv_formal_monitor_rv32imc_insn_c_sub
# Loading work.riscv_formal_monitor_rv32imc_insn_c_sw
# Loading work.riscv_formal_monitor_rv32imc_insn_c_swsp
# Loading work.riscv_formal_monitor_rv32imc_insn_c_xor
# Loading work.riscv_formal_monitor_rv32imc_insn_div
# Loading work.riscv_formal_monitor_rv32imc_insn_divu
# Loading work.riscv_formal_monitor_rv32imc_insn_jal
# Loading work.riscv_formal_monitor_rv32imc_insn_jalr
# Loading work.riscv_formal_monitor_rv32imc_insn_lb
# Loading work.riscv_formal_monitor_rv32imc_insn_lbu
# Loading work.riscv_formal_monitor_rv32imc_insn_lh
# Loading work.riscv_formal_monitor_rv32imc_insn_lhu
# Loading work.riscv_formal_monitor_rv32imc_insn_lui
# Loading work.riscv_formal_monitor_rv32imc_insn_lw
# Loading work.riscv_formal_monitor_rv32imc_insn_mul
# Loading work.riscv_formal_monitor_rv32imc_insn_mulh
# Loading work.riscv_formal_monitor_rv32imc_insn_mulhsu
# Loading work.riscv_formal_monitor_rv32imc_insn_mulhu
# Loading work.riscv_formal_monitor_rv32imc_insn_or
# Loading work.riscv_formal_monitor_rv32imc_insn_ori
# Loading work.riscv_formal_monitor_rv32imc_insn_rem
# Loading work.riscv_formal_monitor_rv32imc_insn_remu
# Loading work.riscv_formal_monitor_rv32imc_insn_sb
# Loading work.riscv_formal_monitor_rv32imc_insn_sh
# Loading work.riscv_formal_monitor_rv32imc_insn_sll
# Loading work.riscv_formal_monitor_rv32imc_insn_slli
# Loading work.riscv_formal_monitor_rv32imc_insn_slt
# Loading work.riscv_formal_monitor_rv32imc_insn_slti
# Loading work.riscv_formal_monitor_rv32imc_insn_sltiu
# Loading work.riscv_formal_monitor_rv32imc_insn_sltu
# Loading work.riscv_formal_monitor_rv32imc_insn_sra
# Loading work.riscv_formal_monitor_rv32imc_insn_srai
# Loading work.riscv_formal_monitor_rv32imc_insn_srl
# Loading work.riscv_formal_monitor_rv32imc_insn_srli
# Loading work.riscv_formal_monitor_rv32imc_insn_sub
# Loading work.riscv_formal_monitor_rv32imc_insn_sw
# Loading work.riscv_formal_monitor_rv32imc_insn_xor
# Loading work.riscv_formal_monitor_rv32imc_insn_xori
# Loading work.riscv_formal_monitor_rv32imc_rob
# Loading work.shadow_memory
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
# Loading work.stage_decode
# Loading work.pc_register
# Loading work.mux4
# Loading work.register
# Loading work.ir_sv_unit
# Loading work.ir
# Loading work.opcode_reg_sv_unit
# Loading work.opcode_reg
# Loading work.regfile
# Loading work.mux9
# Loading work.mux2
# Loading work.control_sv_unit
# Loading work.control_rom
# Loading work.control_signals_sv_unit
# Loading work.control_signal_reg
# Loading work.alu_sv_unit
# Loading work.alu
# Loading work.ctrl_mux_sv_unit
# Loading work.ctrl_mux2
# Loading work.mux6
# Loading work.cmp_sv_unit
# Loading work.cmp
# Loading work.zext
# Loading work.lh
# Loading work.lhu
# Loading work.lb
# Loading work.lbu
# Loading work.lw
# Loading work.rvfi_packet_sv_unit
# Loading work.rvfi_reg_start
# Loading work.rvfi_reg_e
# Loading work.rvfi_reg
# Loading work.rvfi_reg_out
# Loading work.forwarding_sv_unit
# Loading work.forwarding
# Loading work.hazard_sv_unit
# Loading work.hazard
# Loading work.br_flush_sv_unit
# Loading work.br_flush
# Loading work.cache
# Loading work.cache_control
# Loading work.cache_datapath
# Loading work.mux2bit
# Loading work.mux4bit
# Loading work.array
# Loading work.data_array
# Loading work.bus_adapter
# Loading work.cache_data
# Loading work.register_comb
# Loading work.cache_control_data
# Loading work.cache_datapath_data
# Loading work.l2_cache
# Loading work.l2_control
# Loading work.l2_datapath
# Loading work.l2_array
# Loading work.l2_data_array
# Loading work.arbiter_sv_unit
# Loading work.arbiter
# Loading work.cacheline_adapter
# Loading work.ParamMemory
# ** Warning: (vsim-3015) /job/student/hvl/source_tb.sv(228): [PCDPC] - Port size (5) does not match connection size (32) for port 'rvfi_rd_addr'. The port definition is at: /job/student/hvl/rvfimon.v(21).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/tb/monitor File: /job/student/hvl/rvfimon.v
# ** Warning: (vsim-3015) /job/student/hdl/datapath.sv(780): [PCDPC] - Port size (1) does not match connection size (32) for port 'in1'. The port definition is at: /job/student/hdl/mux.sv(7).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/dut/datapath/stallMux File: /job/student/hdl/mux.sv
# ** Warning: (vsim-3015) /job/student/hdl/datapath.sv(788): [PCDPC] - Port size (1) does not match connection size (32) for port 'in1'. The port definition is at: /job/student/hdl/mux.sv(7).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/dut/datapath/pcloadmux File: /job/student/hdl/mux.sv
# ** Warning: (vsim-3015) /job/student/hdl/datapath.sv(828): [PCDPC] - Port size (43) does not match connection size (32) for port 'in0'. The port definition is at: /job/student/hdl/ctrl_mux.sv(7).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/dut/datapath/ir_flush_mux File: /job/student/hdl/ctrl_mux.sv
# ** Warning: (vsim-3015) /job/student/hdl/datapath.sv(828): [PCDPC] - Port size (43) does not match connection size (32) for port 'out'. The port definition is at: /job/student/hdl/ctrl_mux.sv(8).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/dut/datapath/ir_flush_mux File: /job/student/hdl/ctrl_mux.sv
# ** Warning: (vsim-3015) /job/student/hdl/datapath.sv(930): [PCDPC] - Port size (2) does not match connection size (3) for port 'select'. The port definition is at: /job/student/hdl/mux.sv(45).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/dut/datapath/correctedpath File: /job/student/hdl/mux.sv
# ** Warning: (vsim-3015) /job/student/hdl/cache_data.sv(84): [PCDPC] - Port size (32) does not match connection size (1) for port 'in'. The port definition is at: /job/student/hdl/register.sv(6).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/dut/l1dcache/mem_resp_more_cheese File: /job/student/hdl/register.sv
# ** Warning: (vsim-3015) /job/student/hdl/cache_data.sv(84): [PCDPC] - Port size (32) does not match connection size (1) for port 'out'. The port definition is at: /job/student/hdl/register.sv(7).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/dut/l1dcache/mem_resp_more_cheese File: /job/student/hdl/register.sv
# ** Warning: (vsim-3015) /job/student/hdl/l2_datapath.sv(121): [PCDPC] - Port size (24) does not match connection size (23) for port 'in0'. The port definition is at: /job/student/hdl/lower_level.sv(29).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/dut/L2CACHE/datapath/TAG_OUT File: /job/student/hdl/lower_level.sv
# ** Warning: (vsim-3015) /job/student/hdl/l2_datapath.sv(121): [PCDPC] - Port size (24) does not match connection size (23) for port 'in1'. The port definition is at: /job/student/hdl/lower_level.sv(29).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/dut/L2CACHE/datapath/TAG_OUT File: /job/student/hdl/lower_level.sv
# ** Warning: (vsim-3015) /job/student/hdl/l2_datapath.sv(121): [PCDPC] - Port size (24) does not match connection size (23) for port 'out'. The port definition is at: /job/student/hdl/lower_level.sv(30).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/dut/L2CACHE/datapath/TAG_OUT File: /job/student/hdl/lower_level.sv
# ** Warning: (vsim-3015) /job/student/hdl/arbiter.sv(144): [PCDPC] - Port size (32) does not match connection size (256) for port 'out'. The port definition is at: /job/student/hdl/register.sv(7).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/dut/arbiter/wdata_D_reg File: /job/student/hdl/register.sv
# ** Warning: (vsim-3839) /job/student/hdl/cache.sv(47): Variable '/mp3_tb/dut/l1icache/lru_out', driven via a port connection, is multiply driven. See /job/student/hdl/cache.sv(112).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/dut/l1icache File: /job/student/hdl/cache.sv
# ** Warning: (vsim-3839) /job/student/hdl/cache_data.sv(49): Variable '/mp3_tb/dut/l1dcache/lru_out', driven via a port connection, is multiply driven. See /job/student/hdl/cache_data.sv(129).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/dut/l1dcache File: /job/student/hdl/cache_data.sv
# ** Warning: (vsim-3839) /job/student/hdl/l2_cache.sv(34): Variable '/mp3_tb/dut/L2CACHE/lru_out', driven via a port connection, is multiply driven. See /job/student/hdl/l2_cache.sv(88).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/dut/L2CACHE File: /job/student/hdl/l2_cache.sv
# ** Warning: (vsim-3838) /job/student/hvl/top.sv(121): Variable '/mp3_tb/itf/data_resp' written by continuous and procedural assignments. 
# One of the assignments is implicit. See hvl/tb_itf.sv(76).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb File: /job/student/hvl/top.sv
# ** Warning: (vsim-3838) /job/student/hvl/top.sv(119): Variable '/mp3_tb/itf/data_rdata' written by continuous and procedural assignments. 
# One of the assignments is implicit. See hvl/tb_itf.sv(76).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb File: /job/student/hvl/top.sv
# ** Warning: (vsim-3838) /job/student/hvl/top.sv(115): Variable '/mp3_tb/itf/inst_resp' written by continuous and procedural assignments. 
# One of the assignments is implicit. See hvl/tb_itf.sv(76).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb File: /job/student/hvl/top.sv
# ** Warning: (vsim-3838) /job/student/hvl/top.sv(114): Variable '/mp3_tb/itf/inst_rdata' written by continuous and procedural assignments. 
# One of the assignments is implicit. See hvl/tb_itf.sv(76).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb File: /job/student/hvl/top.sv
VSIM 48> 
> 
add wave *
VSIM 49> view structure
VSIM 50> # 
# <EOF>
# 0: RVMODEL NULL (Expected)
# End time: 17:09:04 on Apr 29,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 19

```

</details>


### Targeted Tests: 
<ul>
<li> <b>cp1_cache</b> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png" alt="success" ></img></li>
<li> <b>cp2</b> <img alt="failure" width="13" height="13" src="https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Red_x.svg/13px-Red_x.svg.png" ></img></li>
<li> <b>cp3</b> <img alt="failure" width="13" height="13" src="https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Red_x.svg/13px-Red_x.svg.png" ></img></li>
<li> <b>cp4</b> <img alt="failure" width="13" height="13" src="https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Red_x.svg/13px-Red_x.svg.png" ></img></li>
</ul>

---
Staff use: 5ea9b43543219a3f87ad5400

[success]: https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png 
[failure]: https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Red_x.svg/13px-Red_x.svg.png 
