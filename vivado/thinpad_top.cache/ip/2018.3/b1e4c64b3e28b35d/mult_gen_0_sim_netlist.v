// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Thu Oct 10 22:36:36 2019
// Host        : monell-ubuntu running 64-bit Ubuntu 18.04.2 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a12ticsg325-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [7:0]P;

  wire [3:0]A;
  wire [3:0]B;
  wire CLK;
  wire [7:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "7" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "1" *) (* C_A_WIDTH = "4" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "4" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "0" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "7" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [3:0]A;
  input [3:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [7:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [3:0]A;
  wire [3:0]B;
  wire CLK;
  wire [7:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "7" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
g7azmhtm6FcP7uNFjuXJjN8Z6yccOPk3SSjzvKB27peFKmnPmQmov5+YTGwYqqN9LpdyiUExk8K6
vPnJqontvQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
MFrqn2K0Cr7TmQ5al162oDGiY83d+AkTWOgFyXPYrTNznygR/tx44RAp24ytphNK9p6shs2EFMg/
Qqz0l8DCWiVEoJ/T8vMpnAn7Y+poGVGS1qAR3qE2njrl81VcGBZJeFaWIudhfr/DLTuuf2T/dWDU
YpelM3KbfYNPPiPy8PU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FZca5XZouG+/BYoQ8qrJTmnJanku4IprIWRkO6VciHehE5WehR0wsZJhfKlqLEeY1oTPA4bXaxmY
NjYkrop4EOwW8t47/hj2kFLI1OKUAE/TAhCGg/aNSOViUbB3dUomG/y+TBuDt9L6g0Arj1vb/5Pt
IChc5ZdEfRr1lJMTpFfP+5qmEH6lePPdzgPZATPB4Zrj0P6EyiEsU1FKBuAKd9iYNGiLCxVomaz0
3/RwK2Nl+/l4mc7PJt5Hso+4s1qHb4s2wD+OgbIwdH26ZkEnKVFpaLiuWQKu9uhDLGnsBMPf7XDE
p29f+mrvP9Zi/3nonA2aBKrTwR7XuH+ZYoakxA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jP68OjlYJglq3zpmKrXOhq7Sex8XNW8fQKp4hUNmuw06OOoKhQASNTnjtyVjAIk/VXb64ViBu1ds
cNMJybDSWBhnChfJq4h9PNybShGJXxSm3NDOo5wUHKf10Eti3fSotB9rVks+tNdTEZo4O97kgfdD
G1FNOqlsYcQiShEGLLiEQ2yYtgJBxJ+jc8mFjIEfPhAYy1ElrvtFEpnhkNS2LfE7xdWOQdO/XoKK
ibeY08pgncTI3pvO6TMbXushf0AX2S7hgfk8ysZrT+0gktqFrJnyR6oljS6VVPLtRNW2vo/cC8XQ
Bzvwwt4cpSo5KLS4XxB6qClZipItck2AUEdIbQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
o7jAZIoXlFbFtDYmtXhfRBlb07dhBb6Wp03mlT4T0FXtvccSHWhWZgc+VUNwt6TohLihOwvSipPP
XVXpGL4pUVYNdQBCVpFzhMkt6jhyUgsF5t10yI5Of6YEfQrDHigceoBukM3+/zJHPprrPQE6FUvC
wXSGhBCXnHJs1R+n4l0714w8/WftPQhlD9QGQp1qT2VARQXUKBRxcRjxe9TcLfs0P4xnN7uHu0R6
JTmV+MHmhGpetSZGx+B2Wa1MQofUPURqwE70IwBoUhdXH8+39DT5I6x2+wMY6RcVATnhNd2BCgPd
RzAhwfrcqRiU9aB+eNNdFR8ve9M2nGMmV2JxZg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Cl1Dz+fZIDYEIQuUd0pSg+5jknmtX/JERd+yOZ2SRaVra/4pU/eCTjEXMzhz4VFGYB6dgUxMsGBk
nL2WNdn/uaSPpi6mNF0UHQvZik4pUkYPrnRbFveVqW8i1t95SG0RW96uD19206lWrp5U1lqc4fH7
sfKHi8ZpU3MAg0DOO0E=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Qqp76m2aV9ue8Qai7QUavb+lhRYdu/txrnwYLzwTe0vS0S2OD1vxr8VeIT3bF/ZuXlTGm4S/UCSF
bgOPp7VqEOeGNfsSPK+VpQ+foQMENCQYccwKquBDSg/sLjpPK9uuoGLBLxjw2OwsRzplVFXiPcRN
LYK1/FmCP7RJBNgmhh/ti99a+WSl6i2YIIRGocNplQlG8FXq8ZTTHd/x2Gtdf/zGvJOy/fNsos6S
Oq9yJ0rMmbGeWbri5c04gZM08pUmXBsivgOHm2IVEZZFM4SBqrsi0xa52hs2kelc3iKJcWiTvU3X
0fJP9qNFuIjXBPPZvEYwhVtIh6DwiIC2viSscQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OEpX1nEV8KExdG139/iezydDJA9V+BFzI8aZJ+Z9QNnr+89Y4AvvuhWF1cCwmtchhGs671Yb+6Oz
JY9dLtmEA5QjQle/YrDYUEMJssIK8yrqcnqZm9OmVOa8GSxaW+WxsjHZXJiH5ios4KOJZBnd5nQg
+G0BmTV15ajpXyAJ3VQ+hQseThAzTfPrWMCL1WJ/EDyRUfUzXbIdVB1sIQm+Od+cvbQZTjH8nFpI
NnWYM6zpgJafwOTgJS8mYhbGnMQKXJJh3uDCcfuNyzbIPI6BLWtI6uKhuNPaUMAMhUbC5rjA7pie
eEp0kAAQOXun10vYN1QUxBaBR9Z6OeWorHHy0Q==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bHvN3cKnWWJ5/QZaNYHDhnkJmUvHerw6CtXc0YrnRM0XZv9dC9lhLPYlqB0rYf2oBMXpkNOt/YAH
R+CsNQ+n1efdgpYplInmjOSXG/fIq8Jj7etKmtAHqtjKubHIvyB0kc3WRvE0AebGQhQL4OXoXCcS
FFcZbmXht/j+TzwWo1aOgmbdsi7vbppZbHKrp9rGPQx/+3K2Sf4dKGmxEBbFCSRVykP8Z8HbG/px
8j7Qn4Js+cIXEYEZl3D6Ksl1GCyOr9CLmCXAuaXL8qrsAq9525/USQ2vmqQxKylybrjIEBzg5u8R
9onaKpMFX86FzbefSksd7hsR2VQLLYZerXw6MA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19872)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
