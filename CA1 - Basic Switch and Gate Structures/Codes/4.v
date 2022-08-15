`timescale 1ns/1ns
module MUX4x1_Tri(input a, b, c, d, s0, s1, output out);
  wire ln1, ln2, s0p, s1p;
  supply1 Vdd;
 //inverters:
  Tri_State tri_1(s0, Vdd, s0p);
  Tri_State tri_2(s1, Vdd, s1p);
 //main part of the circuit:
  Tri_State tri_3(a, s0p, ln1);
  Tri_State tri_4(b, s0, ln1);
  Tri_State tri_5(c, s0p, ln2);
  Tri_State tri_6(d, s0, ln2);
  Tri_State tri_7(ln1, s1p, out);
  Tri_State tri_8(ln2, s1, out);
endmodule