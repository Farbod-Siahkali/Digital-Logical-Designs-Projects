`timescale 1ns/1ns
module Tri_State(input A, EN, output Y);
 wire w1, w2, w3;
 supply1 Vdd;
 supply0 Gnd;
 //main of the gate
 pmos #(5,6,7) T1(w1,Vdd,A), T2(Y,w1,w2);
 nmos #(3,4,5) T3(Y,w3,EN), T4(w3,Gnd,A);
 //inverter:
 pmos #(5,6,7) T5(w2,Vdd,EN);
 nmos #(3,4,5) T6(w2,Gnd,EN);
endmodule