`timescale 1ns/1ns
module Sequ_Multiplier(input clk, rst, startMul, input [23:0] A, B, output [47:0] Result, output ready);
	wire A0, loadA, shiftA, loadB, loadP, InitP, Bsel; 
	MULTDP dp1(clk, rst, loadA, loadB, loadP, shiftA, InitP, Bsel, A, B, Result, A0);
	MULTCU cu1(clk, rst, startMul, A0, loadA, shiftA, loadB, loadP, InitP, Bsel, ready);
endmodule
