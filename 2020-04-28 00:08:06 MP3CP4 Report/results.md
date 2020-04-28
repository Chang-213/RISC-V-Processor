# AG Report Generated 2020-04-28 00:08
This is a report about mp3cp4 generated for letUsGraduate at 2020-04-28 00:08. The autograder used commit ``e12663d2bbab`` as a starting point. If you have any questions about this report, please contact the TAs on Piazza.
### Quick Results:
 - Compilation: NO
 - Targeted: 0/4 (0.0%)
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
    Info: Processing started: Tue Apr 28 05:07:50 2020
Info: Command: quartus_map mp3 -c mp3
Warning (18236): Number of processors has not been specified which may cause overloading on shared machines.  Set the global assignment NUM_PARALLEL_PROCESSORS in your QSF to an appropriate value for best performance.
Info (20030): Parallel compilation is enabled and will use 4 of the 4 processors detected
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
Warning (10236): Verilog HDL Implicit Net warning at datapath.sv(166): created implicit net for "ir_m_forward" File: /job/student/hdl/datapath.sv Line: 166
Warning (10236): Verilog HDL Implicit Net warning at datapath.sv(167): created implicit net for "ir_wb_forward" File: /job/student/hdl/datapath.sv Line: 167
Warning (10236): Verilog HDL Implicit Net warning at datapath.sv(770): created implicit net for "control_flush" File: /job/student/hdl/datapath.sv Line: 770
Error (10932): SystemVerilog error at datapath.sv(766): can't resolve implicit port connection(s) to instance "ctrlE_stall" without a module declaration or an extern equivalent File: /job/student/hdl/datapath.sv Line: 766
Error (10932): SystemVerilog error at datapath.sv(774): can't resolve implicit port connection(s) to instance "ctrlM_flush" without a module declaration or an extern equivalent File: /job/student/hdl/datapath.sv Line: 774
Error (10932): SystemVerilog error at datapath.sv(782): can't resolve implicit port connection(s) to instance "ir_flush_mux" without a module declaration or an extern equivalent File: /job/student/hdl/datapath.sv Line: 782
Info (144001): Generated suppressed messages file /job/student/output_files/mp3.map.smsg
Error: Quartus Prime Analysis & Synthesis was unsuccessful. 3 errors, 7 warnings
    Error: Peak virtual memory: 986 megabytes
    Error: Processing ended: Tue Apr 28 05:08:03 2020
    Error: Elapsed time: 00:00:13
    Error: Total CPU time (on all processors): 00:00:36

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
<li> <b>cp3</b> <img src="https://upload.wikimedia.org/wikipedia/en/thumb/7/74/Ambox_warning_yellow.svg/40px-Ambox_warning_yellow.svg.png" alt="error" width="13" height="13" ></img><details>
<summary>Error Occurred</summary>

```
An error occured when running this test.
If your code did not successfully compile, that is likely the reason.
If your code did compile, then please reach out to a TA on Piazza
```

</details>
</li>
<li> <b>cp4</b> <img src="https://upload.wikimedia.org/wikipedia/en/thumb/7/74/Ambox_warning_yellow.svg/40px-Ambox_warning_yellow.svg.png" alt="error" width="13" height="13" ></img><details>
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
Staff use: 5ea7b97d52680ce0e28d2101

[success]: https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png 
[failure]: https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Red_x.svg/13px-Red_x.svg.png 