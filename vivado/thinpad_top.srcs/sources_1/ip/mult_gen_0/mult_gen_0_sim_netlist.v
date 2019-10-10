// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Thu Oct 10 22:36:37 2019
// Host        : monell-ubuntu running 64-bit Ubuntu 18.04.2 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/monell/code/IntoMips/vivado/thinpad_top.srcs/sources_1/ip/mult_gen_0/mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a12ticsg325-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module mult_gen_0
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
  mult_gen_0_mult_gen_v12_0_14 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_14" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_0_mult_gen_v12_0_14
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
  mult_gen_0_mult_gen_v12_0_14_viv i_mult
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
qFBtoxDBeEtqb6jUb/p3sEKofOJBlGmQQVeyfDzYwFd6kcEpx3gip6JD0WfqvL6je6RToW+xjZAS
Vs9p2rt1thEawwZZlCtxgVSLmy1EM06xxhaAdKbaM/5WdUv3ldHER/05jE2NSIdEnNakslNLp77J
AjXakn2ugSuvtQ5yXsfDSiqjEl3vq17UUrrT/kOjUwafxfMU6Z/0YyIXP/aUoQtI5rMm/WoXMrfd
PsKFN2rIkS7Np/sJ4kzWqz/vNdgpTFSmVO4D3/pTUjPrVYBhBoIOMs2ZLW0F9aVqA6o2ssTnP7Hi
RUPLFma5hvocl3H2NqlhNro3v5xK2PVYOIOVGA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a1DyS9CutRjk61fQ4Gf500FFtP/XEo0IiN5lEEBW4Zkmbo0RZI9kJ8Qzp4wLIQWMDeDVa678VE7P
2GHQ/jjTzEZ0fKHjgl+6zkuDgBtO+wxMHeVZWaNxttIyxJIUERi3/WWzWusqP6he4cBzURwB9gGj
H9BS3KS52EQht19gCMfsIrDwL0iIt7lroS2RMwXRSvF/7TE2CuNKiNtRnGaJQdAIldgpRpS/Z+XS
xcrcYPCHrjoUzncAna4JHursN5TfDwEl2otC6XElOcxGmMofPgNgxyEbwmaZNkcwb3VD3vW1C44o
bnJkrEc87X23+O5tzJY6DNbsvXo9jk0RGiePRg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19856)
`pragma protect data_block
RR/OJ6e2L+gKY5hUueovwKNCeCRe8RcaOWSLccUUYShyzGdW5rd1MrXld4D1xBV+LCq/8jXpfFBn
PU5+eas4AopylgMyxT3vVysEiEI0WnE64mn0t9Z6mhG6kn/hJPZQvVHF6BTeKE4103gi597CYIVC
tUomDPadJ2FYuNAAPf6dEAdu8AhkW50+5l8vdhL8K/u3Jn1HnbpeIf9Ll1RvoN7PwtTzQvh4ovZ6
yJLHX0nurmfMfG0wBWIfOZ4G0bL8ukf1o+vHI7V1MXHURGyXgTPvJhb50lZ0b4SJ0BIXgYZECjuY
8b+RHWa/kJXMqagT0E+Lw8VanlxQ6ZjHWe3EBPEsJ4JBpiYaXMwlHLRd0PgoKxeQtC1O6l2TPXR7
FyzJQGEcCAqLxtOfve9Gfz1mSarobO4bJ33bzzecrzXPztVrKD9vVAE+QG3rmvzXrFPcOhlLjuxy
yN5GX0wvzYnM8qLnZHgxImQg1cOsKhxWbb6RQQVynHzt3xLYVdLrPBJYW2MyHwEUXto1rZILNmFB
ESil0xKxSXdyIDwEoQyeG6KsCPAmSOQ6tITMoG2K0fWr9kxqbki9hTLDXPUAUenIDGBONViYyPk3
uAtoh0CcZ09IV1AubUrGHq3eG5j2A5a4NtXtBI/fBrIrDctLucpuEgOz4Hd16nHrgblGaoLZ8yWi
qeZVfU6Zr8RYylzf46x5OVNcC/d/UrFVPiYpU9bQlnDKStoC477poSFHlRYZbQ2UgAtMdAghzQES
bHeWL3zOb0/C7sqcIon2JviIV3ipPo6S+9Vx/OdASjuSTmSD09c5kWSHyYPrawKMV8HoZtdXeLdc
hu/7pbhZvhusgBy2VWvIxdgE5GqCwa1jNdaPYpQ2mHR/jK6j3a9hXJ+fbMVA4gA9dW5RI95UoKvJ
cyza8Bf/2J9s3PNgZQjtAys7HJiy5NnOb2tV19gtUAFXcwijCJktHosBrm9RSZR7m/ItNPFD9PY7
LxVJttPWCRJBE2+MWNZd+xcXAZLJSFF+5HOprn7CfrCl0hiCCR+nyD0b4JjJzOH7YIpyQYU0hsr1
kh28a08S8TbwjSAxiKPn9YmOMSauvs1Ca0XxW4Gc+lkVh03WfWiGea1uLb+FLYJM/A7qy6ov5GTv
WaPoM5ytk4sa4vVbuvt1snFVCkJ94jwwRcWEiXjRrJsS2u9Hhx0Hd3Fu62iwCPkmyWvRZcSRc0q1
7XunDDlJsiRGyD1a1/E6RDq3lac8F/yYKGxmExg/cleQTX5yveLFCT7vhdVVaDItMwnYUv4l+oJe
7mBAQsHafhSvYS9VxJn2gb1LZlGL8f/OX0tejgvejSVRLQZLtuniWbmgpQd2jnTpjqoWl6rZeOJe
bZCUdKOkP0eJsGfWbDmk33lViPpKad9TEE2yVkL53KtF09uBczr17YrXTKN5j70WDeivS3Ztm2LG
n6M6+4VWDLGsxUnNW7RhXuA2LbroigE91thRb5f/Hu7Ouk5r18MCVULHjNFugxfbJRUtq4oZxCLC
HX+h2lvRpiKaHpnIsqpkh/h5ZijSH5MMXzwHHXc4+3+fwEkR6+4CaO/7EJth4fEyzfrWhqyguPk0
Y2/8Xk2t6qzKl+EOptVD7zicFDjzcRnSnmwuM9h8ODqRqOsw6SsDNxI9IpYDXvbC+DCW6DOZ10Xj
W1vAuXZuqF+JVAP5WVoNeLaosGlPNFz3yOW7uJVxWaMkWXvQ9Jik/vi3pRed9u+RRkwcV6anEJA5
K17+Yn7wp0JZFh9rGtCzNDtC9/I0k1DM1CjkiB8W2Hx6W2gsNRfCNioce1yaK6lSpMGyWjzr9IT1
Jp4qfmdifoQm56KVhRzuOCWeY6IHdn9W4Cro09u2C1WsTe31ZU8L7Yh2TODs3EnCikkYkDFUBo8F
iG8c+2I7SvuEaYntrqGsWOxP2fJENFQsaijNls3llT4DH3RYKLfBjKSh5ICZqp/EzOO4gbkKhP+Z
SGLRFjoXNGq+T84IqSRhrOG1PXBVJ6jDW3lfs6VeUNKpx4PPTMdUVw88/ciNC1qdT1UuB+LyrqJE
Hnbad6fQE75W3Vieaz7ylgFxnjO7Kt/M49DcQekXU/fKrstgs1cssszzsZ8wKGN/6K9gdqaqt/3z
0EqqaSU+rU+X62wkpq9XLpG1h+uB+ZEai0+iMcVxRYw9XKQiCHDjV+oYicm3abXGmHKnXXzeJlnJ
7yYQKelV0C514Z25iNz/CBUMOssSKpXZIFifgnTvs8Z2zpjOvOV5TBFXSbKLVq4qqkhYYI6Jwpqc
vh5Lvpdny8qCmquTRFO9+YtIqNs46OZdvkrC5G+fx/xDJv+UF678weErVmOSmgeQqj6UcYzMTwSN
ygRw9CDK/n/vahzNEXuWV0eviJ74eIHLBo2R2tbr8Zhl4brC54IZvOUe0lt96/EheY+QcMvXPjYT
1yJ0fujv/TqwKdExe9gjraRKBU79P6X5gfXs3G0HdVRosR1FMhLw/UFHC2gxQr+HnhMEE475ejRS
6Me/u9e+LaoMF/L7tK54IkMC3omotQKMoiHxe1qkdmvHVu056I6ZXgizN5pI9xWLNmM1t2wFodw9
nb3S88+t4/vwB3RQqHw+wGHMYIo5hwsKYmDSdREgZN5UNOckiFQf8iHHho9iwlJa+PidjZ+1LDzR
KjWMsNmBLjjcRyCLuhwO7pjBsseXin7MlbaJDVW9SSu0LMvqRr01Vd+xhgyzfsg6sFaTsn2rUW1t
yHb7xIOP+EIAHrleQ98W2OgnsOzhNZ9oJgBalCe0lF2R47AdTgACwoYbnbMibDA8JnKQEVphBuRJ
QnPf5A9FaQVECFV9ZfdHrJgpMYLL1jurLUbtwYuuqrNDQOMNFNAgOH3wGFr91/ILU9aMSa0kWHPu
Tr5Ur6slQ9h+neSxtvl8FduyCuDhVD9aLNM84Cgw8DmAhQlTJPZ1qJZetI5IprNMHNjArEdXeVOZ
I6MMNBIyaYux5GWhiMGav5/peBVrRqicAEZgzAhhd0XpRSpwbvg4e1urO0vXBp9Y0Jq3fRt/X80D
a7oe8vdxK2fTwkD8Nj7FA2a8q3ngsOYB0v4T13RGi58B2V6vegxcnjNRgVnwp9K2O+e/KANg1law
ejxR7r0GSvd8jpeDo1M/i3uLNvxseYGxwMsRhC0o1rUsDGpZVEXbb5KooQnn1KtXyhzEluMTLofM
+hrJ8cHtt9U9fFlsVZyJ1mYVE6K0Hzc0gBIrkhAu/++vx7UZJelsT6ezjeA7pnK8/IzkE0DvcI/d
hH/Yem5KKCpTXPN17FyWHb5NiH7Js7xRkLhz01BCHrFkbeBiLA0OXmgQcHWvdOjerxMjmbrJNEt9
XVDWd/paPx3Wc/ZZ0PlsqmM9bFtZbb0zIAncJiMiMt7ZGsn/yN5DnTek13mpHmfpHSPHF5dXc43r
ZoK0L+pbnca06b8EfThd6HmOfhvkpUSUaCjHTxhRuzpA7F8LDDchU8AU+88UsVaSbj6zbStw5Z8G
xRsC+1ytsx4tvkFxdqH8uDtr5G/zQfTvsaJEYtaJFNtN5e0UNGAUxvk8Zgu6HGXaM07gYlN1KAP9
KvgN/0oU/4gqRoPHZVxTQd2JcqwCxRN6sLvlD+ilHdKy31II7ILoVpNvTRM+voDeok0YfxYR9BZI
aJl2qYhGLvz9OeOkKYNP7cZ9hZV5f5bkrr7bz0eaOGP6egXrokmUI8y6AoA49u1z0frQmTFt8Nh2
/AynuML0sP0KBgxDsig/JDUc8m3wE2jh/ob30CXCFKd/KlcIL1ud8+XxHO0rLpNIbrji54tTakiL
25GZe5a3S0u62+N868Da29wPff8oT3hn8z63KLoNETsLY4Ge5UKC1OmTDQHJkR8u4W+TXvPIp9KF
o9hjqOCnpR+4+eUmWT1f97Tpjz9L+LRAwLb2S+zDgQdAX5VI6gqgo1dkvAddGMsyeQQ+rfa7Alvv
xVwlsM5W6MbuOZbgWjvZ1fXjuV1P3A79Q+NZTfiFjFMYNdKj/KjAvbBtc6bmxyL926UjBiPevt09
fCZdMQDMroFdALm6CBNlqckAG5EPHvTtUankU8xGYvQz3Ytqf1yCx0CnyMFE1Qqf7iFst+OEC6wY
0VJNIJioYjXJ5OBMzcsxesbTbzrSFyTBYKPiDKAGHm9RWop+IaLyQalUTdwrK6JJoB5KeyiVrUfH
TujdkkAIzCGFRgIW2/RxUEV3QJjJSsW4j0LYLVMpy+zmQ/NLRm24jj8sXdOleIAK4xh6DwQicIRo
IzG9MqeHLh/hloBkOGNZXE9FhJWnaltW4exRrZv0ytyH2JTTQ9Fvt4G4vgBPZ771531D7r/trXl7
2xU7ORRgJ0hpD/T+k6RBeKwD1/OwNa7+DFqaaHJr6ZY0ly2QpND42IHn71Q94PbL8FyD1Du8ahKS
ULTXJeG+tb+kzyv+Z+TfaULhjRgtzv9miaORJ5rnEUKCuosHkVt7UiX3wNLgU0f1eFqh3qDmFe7E
TiB8h43pzz4KU3oSJYYiq4OzjUD/Gn/H8fTXdGvBK8jobAgy5dMvSCSttzZDaX5BySAo5eH3IXjY
6JYTGXUlLwI1LfEMKeyn+FHmqDJEx28apWKRvtxIyeVlJMsqBxFizCCnxYk2NauYYo8O8arcSiYD
WE3aJEE1f1gex4z19oZchgQ7njoXw/LggMKSuzRqb+NRe3lpoqP1SLcbX3oUD9n3mLY3KgEX5Q25
vbqI6zHXvi76OfQ/uyi8qdL0bZ6U0LI7toVufXwuYYUMESrVP178eNJtfrqUYreWpsBFSDN1WHlK
ZrFS9mTZXkTei6ziJM9elKBEjd76RGVUgVOg9AA6OACX/qXi4OxRREidYoOfUp9onLxE8QAbslNG
iJwabf9QDUeU0MFFC32O7R0ShjiH9gxSPHvQdTDuHMC49KA4uomx/3vca5gKloESvGf3Xxq+zmfG
68U/462vkB+hTSBU4j7YV39syyui9h/08Qdp8v1YCFP2xZYKNs5qjAB8Mbfi2B1l+i7QWByw1p1g
ONGgTxcuTWFsBtaNp/eejfvtqkLxDXAmSG0YUCAKTGNLnoB3v7q2sSeEg7X51bKV2OqPgdwwoQ23
TDXp4pbjk8HLHFug7W9OILjXs40j909h9pjMCO+ttFGsbHoT09faOkxlCWkcU2pDBMta6Vsihkyq
Zpyce1rScmeCJpNqCoPly+PNqb3RsrRHHN481qn1Uje/E1NXjBWTO7R2r5UD2e9AyUiThQebMc8f
kYnBMbiX/on4MVV+BTnaHg74MaV9M1CP/AnXz5mseeEiW6xwWA0ouLnocmZXy71hyDBGZugeuDTr
ts//LWGM3T+KKzFKsNpEerhMZy7qAxbBBxPOSEzfonJecXqxHkMn83y5fgsOrZwQHqrZNcbunTZJ
bp8AfVhJBbrrZzS9BE+2NuLMZRRjc8c6NW4gFptnVsIylWRZvGZil+uH4dzCOG8BNRN0gVfSQ8ZD
zPa9VAqNrgwOnfhNGbdPhaOGMNG0Ui4kj3I5S/4PiW95zJb4vvHGkCIz5ncJ0ovGVrRsDDfSf4YR
qpNfSPxWOhb49s9sG/Igp9g5eCMqsDfHKh+qZ/cgZ0T4rKWXK1uQQXFwFNEfE/KzPJXoXjiz1jR9
15z2o8bDncInQf46WZ25sxJxxI3ZitVMcsWZUtBDufcrzUd4rtiU8Ou+n7e2ZEeR42Cbt2z23WHr
siXcylailp9A/VHbFFzQPlFZob1T7GvP8R54J0McYblBpeJDhI3eqUyXxgqmb3Xh1YjdshrOgvjZ
wXhRZVqlIs3F+m4wwEUoJRcPmHzO6zLzs/hLMugzRrmNJUQioK1gasE56M5aLbukLKV+ypFHnc29
2eygVRlZW6MpIMBgD5fT4yLgeqX8dn/eal0Gwws2y2demuyVJlXE1krfgK/5LiaPfVv9e6sQoU5H
ud/iU4hPvsC2Zh4n3tEQ4V3ty5jh32vHLFcgodCNT1NI5hX/efIZ0v6QBJ1PXVPbfgJZRzRtXErW
dxCA5vldjjtdFIoS+SXr6Cu23gDpmidbB7zp/P5r2qFUD6kUX/iy6WY8qwIhk0kkXwNKr25t1DGo
D0rRtM4W+o9xKhnjExeI8B0qANahrMwI2G4wuSltfst2pql+ruiV/U3y7eftiEARFYnNQoDdjFG3
CQB6qkz2IIyeYmAYJHNATUbPDDO4B/GyQNx/swbbeEul4LZz9xLR2n+rZY87PThXiiYi89oNxt1X
ZYmwqHtn28fPtVL4HkpkUfqUCBVIOvtXNc8snQHIcKYPLgLQiATpVz62Bj0zPKPOzvS7SFyO8l1J
HgmbjE1BA2VFneVaJyCnFo1sx+S8XWkVxKE7EzYgtPCqGO0jnxku5z5S25HIKXVrY598I0+xHvIv
uTP7ttY+Ff7lg/doEG+UhoLzvOLkIB5ztgUxD55ofuwsjcS1GgAclFYzgGk6Acm0THr4EgcQASwP
goqpAFUyyg1qBYE/y0yx3bMREm2CbEx+c03ZUKwCBazSxQ8HaEZNEpd5QlbLpWVYnksrQaFesOm2
oBj7yRR6G1yMvKFyRfrxNcQTWMxUlAP0MqaDRROJSfkhF8lt4tPe9yON/t015ea6s8//sRItRRub
fMIAJxvuCOFLFkL/hqgeUBUUZEVFxppYEp3AHMx0Q9qpEMWFBUHPB5FZ/TNOoWO7LTs4w3C7SDLw
lx7sRZZoYWv/fVjecD8GDKv2lAtRaNwjMFILwvWYwxHZ/mKijaBo782UpkjiuujBexOHG8nPiUDL
Shy5zws6djhTG8OsF5bhjOPYOP1WawQzG8debSNyH4QzyxH/XmKusfc2xeZsqeP2SEN/4piulA92
ewoPoORlRLR6ek4uOITUyDmEBBCuXdG9sFP2+BlURHWuV+I3HVWU7JEEeeF0hGOveNNfnP7PmtQq
QI3Cg9Oiutx9badbR7CpvXZeeKSGubTyUHIlrMFKlRfNuk+F32HZQVMjlo/kDjiru7ale1m+wc3q
fjYpVbPrYEEeic4dSVqwLMnV/sQFGQ6IKzYXJ48epNMXwrVMAmXlvzymK8rXxYBRMLVFfeF+jtPZ
e6pzFm6xSCFugdQ8gH8Y4ah62e+LYaqaSBxnF8VUe+/rwoJla/wBK6FFMxeItY0+/wWk9T9FBteY
s3/cN0p2jHk8lLLXArNJN+VeGKX9IPAuJ5dzdn4CA7nrjyA2wNr2S6ND8NDvFh5ePtbHiz4arKZJ
Kkh+eMesUmQsDyXN20EuXcBSou1r6cDg+Shx8ozOdDl+O8h8SXC/5pbY4chLX40MFFyh0s7C+S3j
09tsP1Q6KFhL9Tzf+Tlu8IZCinNlH2ljrBbQXYORVQVLyZSSYsQRzp30pZyxTYldWtMDG2AmK3R4
+bC6/ls7wMRvitG5nUTpwsChzdZz2t509xU3Agio2dJ0UnFTng7DpaItdogXqtLhRydszUEh7dee
xwttjIxKPd8uOasXSePNucQo+/Pk2R1GRECgsxcZr/p3TDwLAM6d3IPvqNySId1Cs0qL8TVjr9pT
PA4e/qkuEbgjpFnpp1MRkgMcnNhUZSup0O6OHgwdb3Mi8nEg85Ij1RYvaOUp7rz2PYLJ4sfBB0iz
L+6snyOMkbieCyMWl7JeiMnzJ5W0r2QbgwLX2BzCPgjM5RJpYSHBMoaaCFV+GpghCd0F1YOnqc58
LbPXZYnDV3K+n/uxbu6DEnf2IdcchpB2XxCPjHimqd09R2BnJ6qKZm/0IMjJ45E/5422WUYkSp+Z
7eR7OOCQRrzh/GxtR4WQDNMM28N7jhsryAefoAdBpJ04avZnR0ouwYTF8Tc8lqwFieCEY14PBrSO
O+zCi0WlGdK/OoRXssycw4SnRcXThv7xHweSdNF8MZJy53OWnx3p7/2KFrfx60OOpJH3wIaGtLle
FVy9uZf8XWkM2dTQbsez7NRVnem6oaxNAKIyu5fHA0gwVwoUq0jt99qrcTzAThKNf/beWbeHvRm2
22vkt5eJ/2o4gykQHN+ASQHtyU5TF9xca7/kiHnQliuowsNzutNvSsT76jOa2W+vvjj9rOG5VBuw
dH4VJEMQFh7pyNOZ7FwI20mpt0IXwv93JuJPTtblO3hzAMi+El8IJt5vLZN0GJk11afC1ApznNLJ
np0+H13yXj6c5iXCQ2sIPhCT8xnIa55ThJbl0sm62uVOgW+qgGkBvRjmS0E7Db6la1DYXwKbI+W6
e1a/xa7gp9SimsPSLWnkpm5EqcS2Ni2Ehbe9nUO8fe2aHm6tMqXkIYcCkIFz+jwag4NCQH1Fqp2W
os2w1q5rwStb3TcO0rcu2zckWl29+emyVsqR/t0wdvWu/IYss4AQISVKRGjWwkIKT3lpt8yCRUbe
zDOxlbrnGP7TkV8ef4sqR1DH31cJNeS3ggu5pRruOqB+/yxFH9aw8JbPwfAVi24QNWuYj2NLP64T
qofNBwe6QsOTjcEFae4SUHJnxioBUAW7c0qDxwBRLDGolxRif+kAq/emAXb+dAY0sNrXh0zu0aJQ
GKsI9B7v5m4KHNMG3frwylFrfGqA/mNWBf0c9Wt4sgsdBXl6gphHOtxUXRzuLd5WH4eg4CTSvzwL
Wc6nYGjMvsfUgi5N3l73urTxXj92DKsYRVYHcZAzRn48NTmVgyL1UbWhKrNA9HYvxWIfAkwNLca3
JkaGzPhnBtGF61WMxZ0d+qllyUPyD0GtMDZ4bxUv4IEMbnEfvubjN/BYKejUWmdPPq6izBnYlaB4
v7uneU7Zonvkd7Hl2aSNgwZ9YKuBor4ghHl1XPMosjw/f/ETBO+FB9ieU5gcx2WDg1eyPP7dboRc
J+OE1bamf9KtkLJ9viun0kHnhVlKB9L+HHCnp2exYDGeill+vsYVG1B8mYEQpHm70tOzEkXPp/q/
L8ysi3xJeUy9ag+z88jkW6xTusVMUm5B5YNfcYnAOrKpImMTyb+eFpAnT7Vev55hG2O3jocJPGlK
kWIGU4AOUwUrVJUhUg8cRgyrcfeUz8WWvWKarj84lsxVM5mHmkO47wihf9AwNUddQcwSsW/6Cz7u
8TC5NxKel8Z29XsbZbFUQW9E9zs1pU6/NxZbwAb6tW6Sn6T904BHtNq7+Awn737OttRWeXf45Mzo
GC/mQ3CDffUQY/e+ouSCTMQSxNICl8hsoseYgNyrc/KTNif/voReDC95/Gf6IUYS6ccKTfKREl0X
txMbkPWwG9U8BLpz9pxzgljEaNomfW4UN7tFGTTZRZ42UH/mIEbTfjYPp3aMEdw0ipW9bNpWX4DE
cbXYHCcwoYo6wWWECOumvlxwI8piZC5mY4RKhDraFchkaItw31rrIgoassV5aD1AoCsPaiaWWnFP
QqIBY1QO6KaTOJGUeFnrhIQseCbn5QE5dcVATWpTFq5rnILJpzQM38BnhlMLmXHO5XiXAGSfNfNs
AMNzDMTAK8Yt+H+mDHo99NQqmkkXmslsOeua/5Fovil4KXG4qCwkG/TE7mI46HFUdT/hM2G+hKtv
8clnw2tn0Ls6qFHpal4HL+yFL8vDQHDkWPGmWrd9mYkIjCBcT8Z/1BJ9elW6vD36bPVOwk0wNur/
GBVzj+whcu01Dtqh3fq1vt9so+ffMFUNnpMb7vgifBfQafvQHdHOd1pZw0yaGqaQuHVaqWJkaChS
TzgBltnTcR1zgggR4ooY+n6VjzgXqLKnrBYN/9rLM/R3bVRvZyCbO0DmaWwL1YB9ieT4o7fo4lNX
TcG7kLNgGoDUIIlTnnfP16yAZk7jcl0QIg5jNafNaYBGtcu9zCz7U2qrE++gOk4u8mNnQ3mUE9LG
0lEh6L5b/4cqx+JXO+5WNaMh4pno8WKmwQQggol5aRRq2uyTJgRtlopn2xQJIry/z5vsKmI9Rb10
U0Yvsk3y/eoeluUSMerPNM2MbiUP/p3gHMJD2x2VsFpWYQ62heIRUz93GdGEzXBDahydGqjUVC4t
QfxDNFoWkXdo+OxlL/GhfpCGTpOgc+G+uth8WcmGwSb6RtsgdGXc8P8XV2dmQOHVe7qgwAgRUqow
yJknnshs3sGaU5q+RpGPHTjEyknneBjYrefmhA4Nfqv54EGr+mr8I/HEa35lfIqGz38uOCMNMO28
ukeoIGVjvE4eMIZPFj7e0T//tkVWP7nmA/tGOO2Lm5Kk9pnDemCRJIAjcafqKS4bUs7nLsaf4vUe
ZWDogHCBJQiJf8FRZSIWQV0b8Xg5lVGeHPf3SjNcxXbIhWZY2zv1rS1KH5nb6mqdMkThI0Zzv3WQ
I7jOkxKrSNyE2lS86AmwMD86aHFXS35EawwLxeqBbP0enZ7572pdPJoE9edNc8ttLJ3RGItTMWgH
mmW+1EZtNZKJvlSRG2/3h2iR/89Tt2eQoS7igoqQ54w0Gblj/f5oVwIvPWvI//vb3LHN4RBYtgZE
OFwaHhucudBLqp0AKSgUUbqAeZXSdRIQT7aqTo5hrBEF5GKIYCndVqZgvFruEDiqTKkTDe8jaA9r
+gwBbIK2het7vsYMGwzeb/TId8oX4FmjxcirmjVKpJ7qh+XxYByafKdPw3R4w+pRUC6JIgcI5zqI
yxoOLi5GD0N2/qcC4jHW4aQ/dYmjhTRfafqf6r/GRYFBPXceYg8Th/yhJsMBVxwoHFWq6AvgHUNt
a/5d8qSuhPYHJ9COrwrpR76iDzdE4FUfH4AeXHeIA1bxNElt1SHdiBK3iA+92X0bah/4o/mnnwYn
iT57rhcQkyFpfrDKObG/VtdOTkEuJ4kWuvFRYFOfgtFjnOTyfVt1kH4PV1JAaLGov40ZzbFp1X9Y
Uuk5OM/uGy2/jP0v/bKCwMv3SJKusgOjIRjTK9k/ZbCTMKggSSgLI/mCmcU+A8Qo9+u/h7wHn/Gk
Sj4AQPrGV5Zz7gDrwq3YbuYVYRfOgwN1XgI/fAbSZs2tf+TEkLFZ4D5w8sDJrxn3WUNPZTAs5b5s
VTLwTHtjcz4QWpUZUP2dhm0u89nHdts8j1R1xlNlY+3ejSMvo9nydVtR7+FhMW7S6gaiuXu48rqE
h9Zmq0+08efK1NVCCnM3MAgXdnAZkDsF/iFjitppS+t0qFQyX9CW/E5baD1AfYb6mHbD1wX33ugW
BCe5AqTu/qpMZZHq9Akd7gceQ3EAiIfpUdnoN+tczJGFanoEgHhTpIjMszzLwiAkuyZ3I62x6lWt
P2wIEMSgeJqT4siLIWheLI0qT8UVS1I+raIlzAuQz+R0anJ2kAf/QtlXG87juiUlQsacsRyNF/xx
Yw4EwXl2D788f3YPmbSr1ef43Z2pgZMTtAOgZ5QFx22mBvp8Xh/JLYXniNgslecn3RYLG7uY3VYD
wKNrO+QyeAU5hSmkHGkFu6T2WY7sEBytzgXFkgb8LuO9Is2FcAnI/yIStz00w1qnCzl50UGT4JlR
4Bt4GRs/h0xYhZzRMF/XNVUEPylA6Kdz/EtpdrVsnAgvuUb8FfxLxbkbzRVavEcSgjtxuImM+1eb
6hNhBnQFKmf39kH79cgUwO292E0Ht97h6FKfEz4j8Tv9nZUhG5VvApWtV4UTuKdDvTHdgIvUiMYS
1iHM2yaPnQ2UdXlTckdIrveaX0pEz+jCu3XY26hk0znXwacx//VrEzvg/y5RKCnmCu7Mp9uNf6w4
fNqz3yGEqG5N+BK8ztUns78zYOTK4g9CgK0NjtyA77+jrvQDVeGXFJAq4bVkj84HdC9lhsvQcw9n
VEcFUCF6SaLBQI/RSGbq/e4hXW9L3wpVNdxrqAHXGegdM9BpY1OI7t+MOFEfL/XaBOb7oe+CYFMh
rW2GT3g32+NSOlD6pxBArzzrYLNzEx9cCVIm7Qnp4MjRhVmiysReIuHu6xdpF0QqfFVwk5sdmtvv
A9ycu6LRMcyKEZQKcHifSENRGqdGQQUMyLllvKjyqPFsY6dQusvi7KEqhn5S7qumlESTXc2AMW0/
ocLvjqwsz4OLY0vhuAr143oL8v5iusgznSvtQUhCDXVnO93aDpNzmUK7IbdWI6pCxthIRvhwGCp3
IZUF6L/Qzx8/53WNR07aGt99yz+0ftRNK0nzQ25q7qK68zj67/jGkPOo1XZmX8QYMYf51ISm3AJg
dHie0YMDl0lTYNzSJQ8o3qKpA6ajkhLoue+CPK7SpdKWtQLDXl/Z+njhZwXd1LRABrU+2t6EUi0H
6AkigKZMrExB0WnNAgqBpjJM/bKWHVnvQ5gQrYwDeGvljQiY/guGY5RMc+1g2qRG7Jdd8wxe+q8v
kCXyju9lfc2HHofIX8RPKE4LJv/hsx0zZJE8sek6aLKR0dAqxcl/18UEHZa2i9+BPOaobvavnOoJ
0it62CPgaboGPGbgwZ3R6IA6realaQTk+193VeG+ntYbvcSty/gbfmsgvnvGmZMnHbw9PjLttizx
rOh/MSeueHGD3ArA6EWCmLAihniw6fYzQv5dn0tB4jQHL5M+5lM+jeMcVjaLN9S0vad97eB3yqbb
EZ0ON0GUIY/dWlCg2d1gMhnjysNWqcZrDdgzJ5snAlo5tlCm0J0BwC0TUpA1Lngbs9vywbpoD/wv
4CpFOh2zNxIFonactTC++G8vKhu5o3LzbXjDJonrEmKjsnm+yE9rzQzZpZCu2W0cmGDhHZq6WGZO
8o57aqMFXh3hH8LDfn9AfKWaXUzesatEFHXbEHZlpeZkWLw2HOXXAAwGMzZTchv9XN+JfGn8INsz
8Yavhx6+yM9oJV3xT9SRy3JaXA1CNHrvWYBeLbhNW9qQPR75fRoagmfS5MzfMIZbEKXYmhVXUDdj
jFvVH6M+OPH2I86w27bEZ3zVOggEdsS9OrxgI05vEdSyDVdFsIbVHoZEmBT2iwk5LuXcc38xluPc
H+C3JwSMUyIdrS3f8fFjHGcctd7P4XxtibCWOIWaWAXu+VeGjaXJPv48HtVd+kgmgnGPA+oDsAWO
8NZtBZg9HPRaDtbBbU9k2KgZ2/dswVHc5BicuDzsP4vQpSitobBAu23vbg3vI1PwMBlwi2EkppBF
Fy7tdkFOcJKLwioMe4zBYZLFlShOESyZpi7D2bN8xfkXe6J1h0Un/7FPdDEyudF4QJjr3Ca+9q4P
Z/4z5TWN/Hgo3TgnGxFPaqjDJ4IGM2JjM9PF+FntjTn/LsXzmH8h1m2FNd/R/HLbGbbvMsPsUJBo
P+4GgUk8/+WKFWclGIABMwSbqzfaICuhHqPN3I8Mrd+fozb+4wb4V4pVmHTrJ1T3CFz3ZjxUEYvV
30WtovTcULGRZRg8mgHnPbOFuyTww+Kzt69d0YLahEb/aoxna7vu/zK0TRpYx6xARKcpSKe3E4gn
m4m+eQafp33L1xghq1+/1sENYXylnMbW11Po+mmzhDLXosCeRuorZn+2iZ5U+5ZiyZiW09jQLJzs
k0BHwIgMItnDTbphna7IonFUHPDpOfiT/qF3Khf4hm9e6RmCTOdyhtQhUq8nCGmGjNX6MMEWbBjF
+0kv3HsEPZIq0FBgd4TdLyT+FQb6VCvYSdONJypemZ3KHmwTB4gNFPZCzELP29RptgDA0lT898Zd
xEf92FFlo/A3vakZRlxK8NinNziwGiPytFJyLfAsW/ZPajSD2w4znIDuOO/q9U3kegFLvXliLKiB
RmuXwkdxN6x1ccC/JHeK1Hi3WAS4s7LccJVV9srMx877i2SIwybfxVVZKoz0sYZiTfHi59UcdEnJ
ZNAVTQx57jTgQ/+HHuOWpk4M4KI7n8vxp7RFpMyr58Yjh+yYWh7r4976ebSyIdeunhpUD7aLKbsn
KRoYDaRqOAhFjxRF7DKYXDQGMWc0Ehr3t02KA2XZ7Amspqdz+234cgw/0kVJfBKbH43UMPL/O1qL
M61efjn7XuFsdqd5kMUvkct/q5zWll6jaK0eWzVCM4vZmIKJ4CCR2g/qiNVcSU6cvRJb+d02p9V6
E/XnE8ejri4Bm7irOmUhwjhRP9fExOfrNrPqDu4YpSr44+lWiNyWQnpJksHOzMqKBMVcWpFeoGV3
3uXM0BibXC+J6ze3f260Raf8Qql0KLFWOKiyOoxs3dnDMNlv5nxc72K1fkIZmpgk6NrVH5XoAm+E
Q1c7sgCpkO2xmLyrBHsXh0yl6lWZj+3kTb95Q2GPI/5RjNfFy2/x49HiUCIreeW0oIfrtKAkDY5g
BtkIgZse8mPk3t56vgzIAA+0MftgPvYWjfKwX1s2vnkSoSI1VUXVopT6Ri+ZVDWy73BPxwqdPwIZ
a4f3MxjAxhASrC+VsxgBZbOXotHoOgsUz/uXM52bP/jwCvbiTGx/TbFDYNVnsddJyM/1Cj9jq8Vy
ne9BvgTYvflQqh57kAhad/gtvT8Yg3Fjjv17cgU9lHwUa++TPlGSj+W92yDI3Fkk15xBqAPC6NdT
OyJVW5C2o1o2e4pTR5sKomlmKSETHmywTBZpF5qwweH+ZJMJTZ8zR4CVPgo17Y+aykB/4CV5EJnd
PF0Bxoauz3SwPZjTUxe77cst9qsEL93AGvV8k3LVfrZPSrPaAQY//H1+yuv7STv+YGYz/PZtracc
XjL2BeKlmWcPwJMTbM/mSpyUhZZ+2wZ70cyLUAkm/bxZKZIYnkoVO4yVEQDK3Y3mqmb9zFVzbguF
T2TEQiQ2L/zgvW9YCJy7u4U2jZ0HCMAtODSmsMkSbd/PbIaj8XJ+FYcNQNVxF6qhHcE+VNyCRi4C
WqxdQ7jIJgWxR2b5UZVPfrcSN6dUoj4BAp4ZxUIEjWrbJ06xm1aJtKrFezXfHIO8L+G05URck1zb
dh+0QLLNVNbzbjYXpYFFTgEJfraRHahEwso4bqb4pTajpx37S8VOi6RPhvf6Bh2eWwyY9ZdjZ7iX
pa9gELbIwkfHwbuyBUBSp6ASWxnGYq4wE3hF6hRuILll6i7NegkH3O1AhYgtXo5TWBMw2EJRhahC
kouLKEHCeuKWsejrF0DRskibQxbMVWMHC4pzUH+QwsPWU5GuHeDSP0XhBUav43KpDTlhhoTxim+N
fWDAmGbNoGp5Nt9m+wGnifyhLZqYgWtg7ZJvLambirRlweoRmWqkY9yxoykWDDGn0hDyV7BaQ3TE
XWJUc34Ig8HG2/AnxXCFuoHOenE1a9DEAvsUc1dzqwyZ7FaXtDWT7jWbqvFyp/v8RfrBFBR/1xoQ
2z524xmxhAv4Lm9RNH7lScO/rXQER7TNGI6rJBBEyJkNcklH5Aw5DWFHRVOXqYPq2ZubmTJSqKRl
VXoKSnu/N1m06m5EM7SmiSB4qJMO44efd0yC9CEv6KbSh4F8QJA3ek/DzCV0529tWVw4q34S/R8k
RAk5B7fG95tfCMZTGh4CoLSSryB9rBIPTrwDMWw56Yzit8jUM7yI3joPD68UAO8N+Rupv7eX5K8D
zoon91rGZ2TYkMB6VujhuNeiul2HQx6UG7FtkSdqy7nkT402jC16dHANg98teRavD2vnw+tr5P8A
9pnlOk9JctXdIzRS0ZtDG83pzkqG66fkRNgH8RKD3UoHDXB+Fho5GWGEbFCVtv3HezFzq1WBkUMu
w/1M56OlNRYN0eXJnBD5iEvTT3BDrdLhY7Eknro6Zwg1JzlLnrUlqMUO1Ew5v3svVcVoC1s5gRe/
9bwz0SrwwAGP2ZyEEx/8NVtnm9erAWd1A/uY8BLzo9oCGTtkk2CBIhN6SZMev+mUFwXVRjHAhyWE
LBk4cV9ufeZOsE/ZwA7JIuUASSjI2L+QCBtcvxIj5ah0azKPW2i2ODwyDJ5ouSGzVbzv+94rzAGn
bWDIbi3r2d8o2drFei/4ufBkZFh+7g5j1gEpIHBWZSXE1HG1uiAvbXCmzTBVecDyDI9gJ8CkFCXC
zc7Mb5Y4ZYV7h1HsnK0ZdNmhx0T3Z2UglRwr5Md/0n8l4lPgB7Z5r7eAFe4l7G9vW0ss8wmU7WHA
pLzbLqXv3VOjgMH2TvEDFwF+vboprV4Mj5wTpCRoq/aivvcJvFIJrlLDMIqiIAbL0+1lyaIbSitZ
dDnj4pnXrXFEfr2Rq1kKloVJ0NQ3pHZeZ04KOOD+VlDwDDjKTE+NcQHHLIiezzWYDS9LTFd4ygsf
hgprFUjxqhCa3VWrYr+rb6PqgwfkA2B71XNG9zc4cpJ2BL97tCWohxbk688wZ1cH16P4Tls+8sor
7Wu7+uyasLbcfhKmvMggBgEhEXOY7Q7ALu2yi2fBO1wN/hailKl4omwkt+d5PHFF+rbYxlz7kqoX
hG3yzO4T1zn0Q5Qv57ypbwhgvTIpZvl8svQYmVurPCb01ekaqYuotCK3t9dPCkjpdlZNwgCfnXuG
SVZnKwgvcrphJI4bYYQipxi2YO/k+Nr9aTGMhBSuwAlyeL3gE8xhtZNZ5OzMFfSDldxNq/MO1PmK
iK8/KbLX9z1EnShbELIenY25cx1x5VfM/2M2+ytYnZDvSCrgsuQXL+Ic7u6tOTJgQxoxe2j7qSe+
u6uxOjPi+7rnykxNl4UzRzm/GPcsqHioQsM/fx3gQqcyuG9cutGWKJDGdDg+V2jm+RQhZFIVpm71
layY6gsweSCm1rLpufVzpCWBvrGu5EmGZFJ3d/Fb5yxhcGRYgP1n1XurHm/qziPd1dRAFdivEpvT
pJTQg/6R5/i7oACaSrP4KFVMyj6wxusaY9Q6lq4B95+g88Qy08Ep0Avbz5q2zHRlTSNiZT+wqfLQ
qfirFKCdwZzb/oAnKIrRy2kQGt/yO0TOAH2SttRaZLQO/2s3W5nPN5bhDQgN8OUm9GfNaxG1LV9N
Qpdj2uu7eaGsVJniMsE6TY78HlKSirk6KLIQWoZT83qtDdSZhkYfjLc6iFRahUaGpvuSE58QUdpz
cKP0sgPj1J/NmOdbVhwTXhLvuqyRHSBfLOzxhNNhFsJSFjybJOB969CMt+7T+WGTN0fXpme9CW4X
BLtgb6K41PVrFAfryRFsLG29xf+J/6S581qi7UNVKg2MSSijbXM/IayopNAlqthei5dke7MAtvAm
9trdESbwh1DHkhcy8yu4jL3C84hus+0bPAUVCqse/ktBWdfN+uzts/1iHU6AmaCupz1v7AMDhRIY
81bT966e4nwGocAhWX/MUGixUqp6WABo0m8RcL3Wzne9Tc0E/6NtzX5v7+I4jolvSAFYtEL4RhMc
NQ54waMFZ5xapHz74x0nQra/p/XcC5SWn0k4nTR4CXx9ElPOf/o9nTGzvxY4PaYxUPCwyjvw7e+W
jCnPNx11adJnebMmV/4F90ZlXbRVZdr08bN7LmCVxNgEe6SWi41M1vVIc9MLew3Nrfr+DACp1UF2
w5sic7eYHwtF7tiLcZUiAqjP86fyMAYC5zFtJO4YXzGcvXYO8dcx0Ml6IjqZmJjKfxIlfNxrvsIr
/YqBeDvOJ3N08NivHRduQiVIBKWaJEqnAPnOG8b01d4x7cteYW9Cdv6tqrkdfJvfjiV8grOKq1VM
qWYmU21L/G+gNEuco0bUYm4gRYExKL3Ysko1N2T3IcJPmt/t6AbVWvlEQBwPcwgBRooyZajkSHdu
ceCcT7oJT2w/UQcFibwN1xStiPLraxsEOQ5hRHHzHkG89U7rHW2XbtStinoFjXtfsLzfdVnYV52d
HllcpcfjZCHvYK8uDexbgavXqOcC5Uj26TaIh3AL2RAFTGXTVM+HkAhiiBy/lO34JOAtJHcWzyO7
ZULcfJv3xso/h2QzWrmyoLUru811D6s0+UE4nD9Ma3hQ0aa7pWdEtn7ryhIxpGQnMGfHkTg3CO1B
rc82bhKRYiHM3wcXKOcmHfktUVvopMh+EUkvm9mtrdnFEIsgDgEtVim/e013Hwmu/Wtt8LCvmJuD
sT6L5Oj6Y1SvWm29+wD+PiErbS9812conBggBX3leZAh3X3URzrFv+MkpJuSLKEe3gGmvMeGMl8b
u+r8Q6OtI8KQbJawXPRcR6bGpiLgQi8CBcmo7D9gbYPY0/df/S4pkkky6SLjfNcUojh9veDvZurg
QkicByOgAQCy5U3z52uYOBRlOuw2JSU0P6vGilHClUTWuKpQ+G1lZYKbs2mTHuZMTazIP9sHAxpJ
x/HRvg6eBuZ80oIVjxslFbRF/45IBn0joBIvV8kQujSXeT0n2fpqnnhDieZnDjOIkdxu+0oNHtXP
vSNtD6oJwYMFRlfz2KTn36azsGrSM7E0GKZiXzeln/dEuZSPpEe3oaG6VdA0RyV7KR6IyU6hlEnN
iTCkTNjHMysu2iulbnXTQSR33wBKAVFYb58oulvW5GHnRfIOEd0/gWFakuuLf2rjnC/JRg21OuDC
xyDqiy6r0RERUxeJU9aB4zfvo7cWgKyhl9Cik8mXNRqIa0WmV1gMtLgRnn/xRQjPQuT9LzYz37kG
uercZEywcBBCUk7RQ6IchxzkhXZgVPPboWqdOobxEBRV1Bpy8Ujih7EF3dYieoVnLNYo7EWHHKY1
hGc9biLaTNNacSfq5BaeJqcgGhuqE47jKF/eHHHTfwvaX4gZDe49uyWRic4qnZhtNYZf4aTRyRvA
vuYLnLa7eVRSDF26ybvPt05XL4QeNnfUGeSaP8GpeuK7WoM/rA6aoLH8WZhKforsUFl348njWZ0q
TT8eVY4ZuRjzgcl+trHZVgtUxyguQ6Ck52M18yEK/TV/wselPu7+jCRxiSaa9Yn5WIQGaR9MlDzE
BCwIKKgGYBXgk/pFu4Fg/bQJTwZf2MwQiQ8rW6+qqkgPNXsYeyZCMyRSRaXa+7LlaYeyE6YBa6Nx
UyyymJZb2V/LL3edklKqwwy4PvIye8H3E6K94v6ZYX3OkGtE5ugr+6ZHKitTuJsG6WmbtAblQ16c
a/WiI0kZGXu3PvjYx0tM++oPHht+fq3qdbXm+EKsbLocGaubvvY8tlo2eXjfip8aTsMJYaGAIcGm
e3tkcUqii8Hl332pdCi/gYzQS2SHi1ileHY+jvAqdKmzdAOGASmxjINbEOkai3E0+rA1kYH7BbIv
3wWZi16GdgLN5IjDCLuMfCubxJ9fRrLW0bGSJBkTlWpmcNhN6W1kJB6URU+LTvedHioRhoRn2qyT
UjGT2DfYLRmNZqDNz+CgDE64oaoqBLCyjciAW9D2JVRKL8ec7k/6WUD1rvLXdyDS8li79982Otfp
C2YZD6eP6C3chyO66HdDfooagCa6k6PU5nLUsYmczscFpJ825ivoyZuZcDd2e6Z0r5oHHAVewcEk
Uo3EZEJ59gQHA2Rq0PPrhIhbPbnBYCsez9dBV5mnY6JY2b/wcHl/aSLM0eRKpqvcDKug8wEi/Zk4
WjTmEQseR0UoxHnsj6k4YFRvQEoUH13b16IY+hm1zDVYRDTYzgB+DQr/bdvzYcx1YX1iVy+yqwGN
nw/46fpV22aSf0a7MbPCeaY7/u1dwMTitFfsGP50bt03aYHhPuFOsmL0zLV0/vMcBgGEFGhOiVdZ
u0ilvejfSMh5FYGjB1CmfdPs5ktLdYZ/r54V75XoLXljoLlWFWfvHm+gKo1PxCrw7mq6BLwjUXxI
vMivuECujMwYbwqWSw7VKPkay8T5uXGBwRmNKwwqKcjiOVF7tXncl5gRjLOnruRTj1JThykumrI+
o/tFaQfKA9Ku+7ekgMyF9CL8AqLKwGH5iJ5x8BMGRQAzf3T7kMRTjB72vkJEpjfSa/cT6NKtGunE
ZdpH5YBJnjMEtdvj/nX7bTcMlPHFBuYRSA1h8hYGiuZOjzsXlK8ZiGOX+Fn1PT9P5FsVJ7FG8NQf
/DJ0bwi4TIz3z2J62w2asDtGV8s1lvVx/+ogUTUsZCqnD/PJC/zBE1ZKGFK6Fa+MgL3O+5pCuoHS
3PEmoXcfubL+d6tSbR3L/vKLXlPY4gQcNxltdkHtSS34zhfnW2lmYDo/UaaDGjLPcAVKNDQJ05ud
A9f0pAWVInbsooUGPGmgFH2RqXFJmJqWwaY+A1xwDJl9p0hTblrAi6jf0MRDMnVxeisFohRUr4mx
uD9l+CW+bxmlUWVdsbPv4Fn/hdbV5jg37OWaHcW3YiwuBptS0A5BJJrU1DjfdeOqk9euR9aHl+yX
FlvZxld2Lzh1tDAQW0x9WHzKeaq1COn98Ql0IqPdikKGOp4ssG4hhk0/14/VWK+XSTYBNIUgQjte
nfVaR5akdHPwi9rNYpLSukYzl6u9pOK8TXcEsv3q0hUkE1dILqd48pIhyAFpCOJCC6AhvEgkuQet
aWnBYlg788fjFTH1EVGOEmn97VQhGe4FcqjpLX9fa2AxeUlIuytCdoVErgCYNCo+Cdw8vHP1AriN
e1iCkqeKTDyPIvyEe+40nzYB5oQaSWI/9xGioN8IqCzUS96VWIxePSuZ67YD99hEWLiQOC29Fvqk
nTx1Cwdvfl5TyxITXAzUX+lwS0P4ZKUMqKi9rkNbMgBs0Oq5weyE0ffnq/gTPhU+dTAiisW74+rX
nGnXzfTEnBi7Cj14CuMnsV+gPGMXV7EJVZwSCtTqZUGmljNSxRQ89v4iCra6gpN/4g8LYme4C8Co
PyPB4H3NCxCDx2ZzF1dlYLQtZTJ0y98ZkXHaEESf85tTUNCmQepxpEx5ORdArTRXTz0lAytguLao
5V4FGgU7cZNJ4WDwR5bhfMPRzHX4d0ForlHJQ1HePKEu02Fva+E1LKDRjEbFfG0umiquey9sjdAE
sxUiURg1vr99CcYF9Senb6W/FiSZJgresCJygqSuqOQ3MnBFbd1C3FUUPcEffcqeYbquDWoh7dxw
5b5S531f52egnFC0ss971J7ITDJ7yES35z42KAajmGxxxa9rPsDE2IgPgqpGo7yHSd13u6wp3rgv
EXMvDLk29x3yfi+eDAJSLZNu1bwVBcMTk4oOvChDlp6qexpl6XrJhODP1yf7Pgf7Xpd9vUxofggQ
bmsghr6VKXjX5JlVFvvCG7KRQtHOWq23O9tv4jIh2c6O3MFpPk1++X6iyYahiGDr5Em00mvgzNNS
lNDpXBYYP9frLGKWC5yDms/bUf6+u2Xeg96IDqazBl6rd44Eg1kbSE1LFLwLQFSV/8ewRa6Smysv
APBfwJYYteGJkA6xHVhcHFdcOjrTuS2vtnbUFZhq224olikoLd1Bsul6c/2BTAkGbwh5+L96W5KS
FzXtpJPEgX38VmdztdI9/FqS0mdas8wsy1Bk56ZOGaCiBzFhnZF1Q74qh/t21QV3pcYLQsTHnhYE
NvPYuW/DJ81j6GRMv+UEyi0zNngsdZKqmqO1uN1zbfGCusdReI+2AxfjGtnFnsEKwYHGOp1nGt+W
Iw5iqtDEwlPJ3ZIaDUIc0eNyaRBb0rzJas+09P4E+FANTmiwV8GHfTtwX77E3WegWRtmnLOW8x9Q
BIbl9gy26j1oD3eHZcQr11Vv1nsTpcf/dFXTHgcEOi7h0Od/bmm1mss0gIKbjPPxWD7hnGl2CVRH
sXOUd5Qduhls8s4U+7X5h6c5Yd3sZ9fJ24EErUb5zT7g5F2Eo6nExyabOOR9vp9LoUJiqgchMtqS
eO8PwrRgtxDTNc9LwGRFjZnzTWOgUJst+lc5dbEczDvAvELzHNVeWApgF9tFOZjC02VYeDD1fl52
0FuYXDd4G3ijJ17B94BPQ8OUsAWN8kz+ib/rrepo4gUbjk3pKiNNtF9Z/9PqxtS7gGguuEwmYAmm
RTd2jNmANml/DK2pM10zohV7+RmktElFy5aaL3N7lmWzYklzJQrVsqed7I7I3OMBy1/oPRLqKzvF
sOIUixiiQPTyBfoeoAKxvvjxaevMplECQiMFRH/Qpuh/Dh+7AOteeaA8v19p7ZVGzpAFzlh0Bv2g
u+Z4DtI25njYk2c7eU0yGXGaoxQGdKsGqAuhkavaQQMYMg2QoaWBVfEnHgDIV6rJM6kr4DNb3UZk
JXjcZ5XMmlzailAH/SoKnX0GKHoi7UPbKwnbY2QcB+CRPvxx5qxBPyBJ0NMvYbXE4SorKKXTMoaa
V46UwzHFPvTc0hXD2lwmypfxUW4zXsfYa8QxC50XNQRb08pnXERa7LAtvjvSeDpI81f/4qcnfdf6
euD5j+3/zgoJ+00ixPKC3LH1d4FemBec1k/bakoOGbaUi1cmhB5nb5m7GhkUALd++Ko17Xt7v/22
CHVqULXRXSkqxhbWMjpWhwvOVvaIXKfIL92jZJW76IQzS/HAfN5nMdbHariSjXCv39WewUOb70bl
hU9IG9wX2bQOLWPyI2Wx1SJju7M6bGf1ao+2dt23CyiIYe1vcQvq/TQkuivl0Wc6rh8noYRyWJOT
yqjxQdLGiW82Rk5/awHe5+IW6GREPBzFDedY2gDUp7M581U3d13fm4xJhXapstJIbLNAqJaIq2ws
ip5t/c7dgyp4QC97UN3pz1qXrZdVEqxFWirT80ysf1v/0yyTEAJ79whtO8foMXk4YmLqeZLwxIuL
3MPuJxdK27kP2spNCxTCEkqV4BKwv348LE80XUolWE96wq45tuz03AoKo82WfdMEDOLN/zBgjAxl
VKCBUmCW86h5U/rKvTDCIEaVMzz1wH86mUJ6rYEmpI2ptacmUpLJYD/+EVscMt5E7hQ5PgMByl1c
FoCHqETDwyDUxhM3KpyHOKpmotT7cPagPqglVmLyknrE+JFiWxHE5aQL1n8nsCeZUBB/ceJ7/yNf
tFZD4/U3q7+oAgnaCHU9JDL0Pq0iY2kdt6sr6Uvhuq54EUIplnzX3pTX/ETKvc9LfkC1fetmuvDg
Vy6T4STxRNfH82qn5g0n4C7B2lM1cBks85scQ8lbbQ+fQWlYhBhjPjWslYxojVb7BAfPyPbHhuXy
VgCJf/OEFyfthpEgPIADVFodlxzsZxDuPMhN3NcQOLIMTTheWJC0mWlkcU+GiKsAHqT/yU5pVAIz
KzFJAmTHUSFJjF+S89aIEf1t6H6Yc1Xgp4bixRmXQVJcfFodZUDQAz8JbOS6NLXobd9E5+PycV5j
PF9PbIrMrRN54SjimnEi/MUmPlFDU29GE/SsWbXo88MhCzT1ZJmCqequGUoqoVIZLar5paPJ37by
aLZJQYMYm2AFRBlgeOaLNttICDOuWMQqqi8ETPq7Vf5avayLzqGENUnjBESAmVtOuJBsQy8FKUDT
rkTSc33YCVmvJrWDKmMMQqA2Qc1hCEe8FUedTUSp3GFrJ2SUspQrr6SIixCM9o8NjJUIEodCK7M+
ytyeOvQ5++xQcXL0Ihjvs33D5gK/1EhzkOc/2yIpG/f/imGltxLuMbNafDL0WBDoBJRku04x7pTK
Iho41BVjOf7JlkfFvs+nJV3XP2AWGih+qt7u38bycdjTWCiWzIM7UFabE6XYYchabKlcpq9aPn1w
4BIbgbh0WtnmNlH4S3OufjjCWFNspnJXsk6LVpkYgIVWCj4sxVQobRbNEo6IYEopmDHkNh6qqkuP
obBIme1SwOKIQnEex0hPyI7/B929fBk1u9eKaE9H/3CWEvPSzCVEPG1TPBlI+UeXvF4siDkIpmNG
juUpj3dpKe47KuG9pOUOYEuB+OnVympukk6nTi/KOLIkQNfR9OZE9LVBiRLflVCr8+LhaSzbpbC0
nf51abi0ychd5hcXVPzbATJtrmaye5h5Q02ngZb2d1Gi9Ifs/IqCwPlnD/Kf5uo/Hr7fBPbsaN1u
b2xbQ5L+V3skxzwNrn94S3/Qd97fib1QY73zqnNWj1Fdlw029aCZwRhGh0LTdqJrOBujbmtTns+4
Ozn3kca/MjY6wcY9qvDeGz2dONHTh58P9W67RPT3snmI6q2DKlFKdTsY34cVRFqSjqVtRUVRizCN
OvuXC7KTKLgMfuyTEiNDR5jWprmmDiOkAEgXtpx70wVZrVy0lCtcteVEqzNGkG48rWr+VgqTuSyN
UtlxWUvfqPoJaBgto8l888G9sDyouwIwUQgq2522BMKeOYKUg8Y7nfmIJFleMxsNOXugiQ2hh/o1
R/3+MYudC2qBFjrYChZaazpn8qDxVxljRmMEaBmW2jcxbDHKZXiBvIqqpzMQK+qJvwZy15/emxPz
pkPGdEi4IS5QyCW63pgAZ/SU8Fvgtg3NyqjDyHQrRGNPIE2/WavetnXa981jDUkDDmL+FG+tUZNZ
BgDwTu7ZLMchNHysUmN/JX3+8bp0YyuKKM1xOPvAkxfAvyBpd0M1jFo6WNYvklv2bgL9ddvHNx84
DUk53lu5jdYKlkttYjBYz13nq8a1Nn+uoNbz6RryzW/YG4/Z/7N0ULUp3boR7NzCbWyOJUASpGE5
k1QA+r7LXoSdjEzCnrCZKYgcZRENS1kh2daJgWWN6E2/QdJCptiPZrO27Kga2yG2LEtgkatOrcNj
YpBkyfMXQ0FlleMmPYapkirv5FSuAgMQ4wo9aQL0pk5O4tE1RoOp6h7EYhPEqIJdNO6HN64aeSEp
3/KMwUoJW5q2bLDxk5AVFUozDsJ+v5e8CPWxxg2KywmAqfwI316IOBFRD/2glERfbpWqi+f+IWbz
rUozVGQYREf8t2YoFXrltksbDz/k1GOKuGEhgaJJGDqy4UuKc790VzKcCj77YUFpzwlwHGA1ZApX
bl35Bd6VaOVE79uUCccvEm3pMSidqNiNvxvlXq5ttUZH8XZt6oFNm1GJepVw6CQMf8hOT2CJMo8G
VgXIxB/DkQRXhJ/QZuSN6sjN6iwy8V/5ouKU6+JD6GVPgFPNG3MVqg1Y14RQtDWSMks99VpQeF/F
L69Xs4py1zFq27Mw8Wtz7/hdUu/Pm5Ehd0QDU/ZSIpxbdkQfRIxuwMZXSUhvdZbTgi97UbeOd/K5
dQRP0gUfnmeZE0PKvG5THWI/rMjper7yYRlMTNh5QqzSvKpn7/IOd6Qb0Ye2IxzSApyMj2LhkMHg
16NtmTlj7DhEpFRGX4rivct7rw9TpfPWDQNRxVHDfjskv8ZplO454WS+lnhJsQ8bb4iDFvLLDbGs
DNmvyFMgIXMxmk1RMPxcHfxtWkBi54cIYsW3xstdl6mSXToMdueWlnWgjs3vb1MBOMzE12kXMY0M
yVnYQlV2dYf1uPd9umX36UgCmP0tTIfubwlcUimO7ftLj6cdrQh4u8U3GrJQPmbCuSYb7ruqnCff
8E+YY6bGHhO4umgeA6qO/m+IqbkawD7oFN9HrygNFuC368Dpet3PnPivffOIKirZLVZqhhr7074B
CLpmFFcpy1mcRYA+GFsCa34GBkcXyZwZy38sX9qohJL8duzZDcPbFmtwmMILRBiWX8IfJmsb9QCg
eZzYt7t3blPZQK/4SKg2XBd4hyyjXGZI3DHtFpmNrx6hsu2ODPw+X0kHRRkMt+vJj/In8iGvq26q
iBb5Au1AWD1/IonMVCXijYpLgdFEd4zlK8B+14/0WZP1ls4KnHysNJiZd+OBECNOxk3wK8PsflZ0
19N/vwYQ+GJQ3fldgxNLmb+nXmEzL+NegYFUaf0HzWBpHUiTeAHwF+2nujMFlQs5P9uzQxRVwANd
azoI1rHG/4/QM0a15GxcXarnc7zZQi6CUQZFfmm1c9pRRShh3FaPjVRSL5q7IfB12D4pcBwt6BGf
teZ/XOXWh2kSHFki/GG0L4KWPM/tt1u//UsbingIeHa+jmvWdlul4duwXoIbuPm8dbA/7eKUMVCq
mhlC+6e62mxHWy5EwSEpJLBzAcJHfjEsEBhsAN/EjUPUd8kzLGjqnGKe397t7LmQKk4h6Xg+Nykk
Z3eOoBSI2Aw9Jo5sCns7Iu3jJyXQltzcMuK9oJ0x3qsWgYmBJe06HQU80L1sruYssm6bkVnM3In1
i0TsZm4iSnmB7is64ydRbIILEVz/5ByGqs1Fxo2YrkY+ObpBimC26Kn5FDlFe/UtBwMPSK/yV1k5
0pM73gl16A4ob7y9Jj/sFlHmb+9665oAXNABVc4tA86JZYP9KXGUydri0gmr9t78ul9MvZM2n7Yw
W44Qqr3v8ZvVWal3WuvAH73FMFPY1fAKDWAu9FzGMOuGPsuuFmmliFZ2PbSxZXGtgh+UF3b2U3lN
LGFaqoB7hQwMbYz/hcjFkgPhQUWneBPivIprvNhp/8a5oyPNYrDMWbPd3WpX7+6YTBcRHKtMLGzF
ByEerK73SPA/r6CN8Uh9HDcALPn2vD7y9sHBimhM63s44/IxiOtkCS3FkHr1T1W7j8ruKYh59vEW
W8L70CVsvPNIWTQuhkmpXta/6g20bL4+tNFxieIfhmsYGpfo+MJVZ2yrdhc4E6ROopKgilNV80X+
59Ub4XPJvF8bCltjWiDtUyHZweRQL36umuGDmuyeuH+UzdxF1dBb1bujnl8Qw7QpGlJg/TGnfU4R
DJCyaaiN4VG6KcSrFzNSDD0gk2i3KTX3tYG3OL1WVEdTUdcExxVFbV0d1DlKV3m1jxKh+a4MDiIR
n90yZkkoNM1B/OnOo4hRlmcTFHtugdku9Yr/jvt99VhUjXW0SQg+6Yt4PGe15kh8TyrjSe1D1RC2
PBbbZ9l0bZS4DyeTmzjNWvm0popYL5iSUEGM97bNz31GIym4+lspn2YLrygyTi6NKTWSQssUYel8
i1Z9+rroeqLXzLFvS5+oQ/s86K8=
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
