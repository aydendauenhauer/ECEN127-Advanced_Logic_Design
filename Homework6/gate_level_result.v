/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : V-2023.12-SP3
// Date      : Fri Dec  5 13:03:42 2025
/////////////////////////////////////////////////////////////


module mux ( select, data_in, data_out );
  input [4:0] select;
  input [31:0] data_in;
  output data_out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39;

  IVP U1 ( .A(select[2]), .Z(n37) );
  IVP U2 ( .A(select[0]), .Z(n35) );
  IVP U3 ( .A(select[1]), .Z(n36) );
  IVP U4 ( .A(select[3]), .Z(n38) );
  IVP U5 ( .A(n15), .Z(n39) );
  NR2 U6 ( .A(n36), .B(select[0]), .Z(n25) );
  NR2 U7 ( .A(n36), .B(n35), .Z(n24) );
  AO2 U8 ( .A(data_in[2]), .B(n25), .C(data_in[3]), .D(n24), .Z(n2) );
  NR2 U9 ( .A(select[0]), .B(select[1]), .Z(n27) );
  NR2 U10 ( .A(n35), .B(select[1]), .Z(n26) );
  AO2 U11 ( .A(data_in[0]), .B(n27), .C(data_in[1]), .D(n26), .Z(n1) );
  ND2 U12 ( .A(n2), .B(n1), .Z(n6) );
  AO2 U13 ( .A(data_in[6]), .B(n25), .C(data_in[7]), .D(n24), .Z(n4) );
  AO2 U14 ( .A(data_in[4]), .B(n27), .C(data_in[5]), .D(n26), .Z(n3) );
  ND2 U15 ( .A(n4), .B(n3), .Z(n5) );
  AO2 U16 ( .A(n6), .B(n37), .C(n5), .D(select[2]), .Z(n14) );
  AO2 U17 ( .A(data_in[10]), .B(n25), .C(data_in[11]), .D(n24), .Z(n8) );
  AO2 U18 ( .A(data_in[8]), .B(n27), .C(data_in[9]), .D(n26), .Z(n7) );
  ND2 U19 ( .A(n8), .B(n7), .Z(n12) );
  AO2 U20 ( .A(data_in[14]), .B(n25), .C(data_in[15]), .D(n24), .Z(n10) );
  AO2 U21 ( .A(data_in[12]), .B(n27), .C(data_in[13]), .D(n26), .Z(n9) );
  ND2 U22 ( .A(n10), .B(n9), .Z(n11) );
  AO2 U23 ( .A(n12), .B(n37), .C(n11), .D(select[2]), .Z(n13) );
  AO4 U24 ( .A(select[3]), .B(n14), .C(n38), .D(n13), .Z(n15) );
  AO2 U25 ( .A(data_in[18]), .B(n25), .C(data_in[19]), .D(n24), .Z(n17) );
  AO2 U26 ( .A(data_in[16]), .B(n27), .C(data_in[17]), .D(n26), .Z(n16) );
  ND2 U27 ( .A(n17), .B(n16), .Z(n21) );
  AO2 U28 ( .A(data_in[22]), .B(n25), .C(data_in[23]), .D(n24), .Z(n19) );
  AO2 U29 ( .A(data_in[20]), .B(n27), .C(data_in[21]), .D(n26), .Z(n18) );
  ND2 U30 ( .A(n19), .B(n18), .Z(n20) );
  AO2 U31 ( .A(n21), .B(n37), .C(select[2]), .D(n20), .Z(n33) );
  AO2 U32 ( .A(data_in[26]), .B(n25), .C(data_in[27]), .D(n24), .Z(n23) );
  AO2 U33 ( .A(data_in[24]), .B(n27), .C(data_in[25]), .D(n26), .Z(n22) );
  ND2 U34 ( .A(n23), .B(n22), .Z(n31) );
  AO2 U35 ( .A(data_in[30]), .B(n25), .C(data_in[31]), .D(n24), .Z(n29) );
  AO2 U36 ( .A(data_in[28]), .B(n27), .C(data_in[29]), .D(n26), .Z(n28) );
  ND2 U37 ( .A(n29), .B(n28), .Z(n30) );
  AO2 U38 ( .A(n31), .B(n37), .C(n30), .D(select[2]), .Z(n32) );
  AO4 U39 ( .A(select[3]), .B(n33), .C(n32), .D(n38), .Z(n34) );
  EON1 U40 ( .A(n39), .B(select[4]), .C(select[4]), .D(n34), .Z(data_out) );
endmodule

