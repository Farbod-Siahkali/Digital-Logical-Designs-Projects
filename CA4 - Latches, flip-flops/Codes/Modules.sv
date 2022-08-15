`timescale 1ns/1ns
module SRLatch(input S, R, CLK, output Q, Qbar);
 wire x, y, CLKbar, Rbar, Sbar;
 nand #8 (CLKbar, CLK, CLK);
 nand #8 (Rbar, R, R);
 nand #8 (Sbar, S, S);
 nand #8 (x, Sbar, CLKbar);
 nand #8 (y, Rbar, CLKbar);
 nand #8 (Qbar, Q, y);
 nand #8 (Q, Qbar, x);
endmodule

module DLatch(input D, CLK, output Q, Qbar);
  wire Dbar;
  not #6 (Dbar, D);
  SRLatch SR(D, Dbar, CLK, Q, Qbar);
endmodule

module Shift_Rg_Latch(input sin, CLK, output [7:0] PO);
  wire [8:0] w;
  genvar i;
  generate
     for (i=0;i<=7;i=i+1) begin
         DLatch DL(w[8-i], CLK, w[8-i-1]);
     end
  endgenerate
  assign w[8] = sin;
  assign PO = w[7:0];
endmodule

module D_FlipFlop(input D, CLK, rst, output logic Q, Qbar);
  wire QM, QbarM;
  DLatch Master(D, CLK, QM, QbarM);
  DLatch Slave(QM, ~CLK, Q, Qbar);
  assign Q = ~rst & Q;
  assign Qbar = ~Q;
endmodule

module Shift_Rg_FF(input sin, CLK, rst, output reg [7 : 0] PO);
  wire [7:0] w;
  D_FlipFlop D1(sin, CLK, rst ,PO[7], w[0]);
  genvar i;
  generate 
     for(i = 7; i >= 0; i = i-1) begin
        D_FlipFlop Di(PO[i], CLK, rst, PO[i-1], w[0]);
     end
  endgenerate
endmodule

module Shift_Rg_Always(input sin, CLK, input reg [7:0] PI, output reg [7 : 0] PO);
  reg [7:0] temp;
  integer count = 0;
  always@(negedge CLK) begin
    if (count == 0) begin
       temp <= PI;
    end
    else begin
       temp <= PO;
    end
    count = count + 1;
  end
  assign PO = {sin, temp[7:1]};
endmodule

module LFSR(input CLK, input reg [7:0] PI, output reg [7 : 0] PO);
  wire Sin;
  assign Sin = PO[0]^PO[1]^PO[2]^PO[5];
  Shift_Rg_Always SR1(Sin, CLK, PI, PO);
endmodule