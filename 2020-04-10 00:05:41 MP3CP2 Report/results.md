# AG Report Generated 2020-04-10 00:05
This is a report about mp3cp2 generated for letUsGraduate at 2020-04-10 00:05. The autograder used commit ``0d64fb62b54c`` as a starting point. If you have any questions about this report, please contact the TAs on Piazza.
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
    Info: Processing started: Fri Apr 10 05:05:24 2020
Info: Command: quartus_map mp3 -c mp3
Warning (18236): Number of processors has not been specified which may cause overloading on shared machines.  Set the global assignment NUM_PARALLEL_PROCESSORS in your QSF to an appropriate value for best performance.
Info (20030): Parallel compilation is enabled and will use 4 of the 4 processors detected
Warning (12019): Can't analyze file -- file hdl/stage.sv is missing
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
    Info (12022): Found design unit 2: marmux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 10
    Info (12022): Found design unit 3: cmpmux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 17
    Info (12022): Found design unit 4: alumux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 24
    Info (12022): Found design unit 5: regfilemux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 40
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
Info (12128): Elaborating entity "pc_register" for hierarchy "datapath:datapath|pc_register:PC" File: /job/student/hdl/datapath.sv Line: 219
Info (12128): Elaborating entity "mux4" for hierarchy "datapath:datapath|mux4:PCMUX" File: /job/student/hdl/datapath.sv Line: 230
Info (12128): Elaborating entity "register" for hierarchy "datapath:datapath|register:PC_Reg_D" File: /job/student/hdl/datapath.sv Line: 238
Info (12128): Elaborating entity "ir" for hierarchy "datapath:datapath|ir:IR" File: /job/student/hdl/datapath.sv Line: 282
Info (12128): Elaborating entity "register" for hierarchy "datapath:datapath|register:RS1_D" File: /job/student/hdl/datapath.sv Line: 290
Info (12128): Elaborating entity "register" for hierarchy "datapath:datapath|register:FUNCT3_D" File: /job/student/hdl/datapath.sv Line: 306
Info (12128): Elaborating entity "register" for hierarchy "datapath:datapath|register:FUNCT7_D" File: /job/student/hdl/datapath.sv Line: 314
Info (12128): Elaborating entity "regfile" for hierarchy "datapath:datapath|regfile:regfile" File: /job/student/hdl/datapath.sv Line: 496
Info (12128): Elaborating entity "mux9" for hierarchy "datapath:datapath|mux9:REGMUX" File: /job/student/hdl/datapath.sv Line: 514
Info (12128): Elaborating entity "control_rom" for hierarchy "datapath:datapath|control_rom:CONTROL" File: /job/student/hdl/datapath.sv Line: 547
Info (10041): Inferred latch for "ctrl.load_ir" at control.sv(24) File: /job/student/hdl/control.sv Line: 24
Info (12128): Elaborating entity "control_signal_reg" for hierarchy "datapath:datapath|control_signal_reg:CS_REG_E" File: /job/student/hdl/datapath.sv Line: 555
Info (12128): Elaborating entity "alu" for hierarchy "datapath:datapath|alu:ALU" File: /job/student/hdl/datapath.sv Line: 578
Info (12128): Elaborating entity "mux2" for hierarchy "datapath:datapath|mux2:ALUMUX1" File: /job/student/hdl/datapath.sv Line: 595
Info (12128): Elaborating entity "mux6" for hierarchy "datapath:datapath|mux6:ALUMUX2" File: /job/student/hdl/datapath.sv Line: 608
Info (12128): Elaborating entity "cmp" for hierarchy "datapath:datapath|cmp:CMP" File: /job/student/hdl/datapath.sv Line: 634
Info (12128): Elaborating entity "zext" for hierarchy "datapath:datapath|zext:BR_EN_ZEXT" File: /job/student/hdl/datapath.sv Line: 648
Info (12128): Elaborating entity "register" for hierarchy "datapath:datapath|register:CMP_Reg_M_NO_EXT" File: /job/student/hdl/datapath.sv Line: 656
Info (12128): Elaborating entity "lh" for hierarchy "datapath:datapath|lh:LH" File: /job/student/hdl/datapath.sv Line: 715
Info (12128): Elaborating entity "lhu" for hierarchy "datapath:datapath|lhu:LHU" File: /job/student/hdl/datapath.sv Line: 721
Info (12128): Elaborating entity "lb" for hierarchy "datapath:datapath|lb:LB" File: /job/student/hdl/datapath.sv Line: 727
Info (12128): Elaborating entity "lbu" for hierarchy "datapath:datapath|lbu:LBU" File: /job/student/hdl/datapath.sv Line: 733
Info (12128): Elaborating entity "lw" for hierarchy "datapath:datapath|lw:LW" File: /job/student/hdl/datapath.sv Line: 739
Error (12006): Node instance "STAGE_DECODE" instantiates undefined entity "stage_decode". Ensure that required library paths are specified correctly, define the specified entity, or change the instantiation. If this entity represents Intel FPGA or third-party IP, generate the synthesis files for the IP. File: /job/student/hdl/datapath.sv Line: 182
Error (12006): Node instance "OPCODE_D" instantiates undefined entity "opcode_reg". Ensure that required library paths are specified correctly, define the specified entity, or change the instantiation. If this entity represents Intel FPGA or third-party IP, generate the synthesis files for the IP. File: /job/student/hdl/datapath.sv Line: 322
Error: Quartus Prime Analysis & Synthesis was unsuccessful. 2 errors, 2 warnings
    Error: Peak virtual memory: 995 megabytes
    Error: Processing ended: Fri Apr 10 05:05:38 2020
    Error: Elapsed time: 00:00:14
    Error: Total CPU time (on all processors): 00:00:38

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
Staff use: 5e8ffe7d52680ce0e28cf1b6

[success]: https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png 
[failure]: https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Red_x.svg/13px-Red_x.svg.png 
