`timescale 1ns/1ns
module Sequ_Multi_TB();
	reg clk=1'b0, rst = 0, startMul = 0;
	wire doneMul;
	reg [23:0] A = 24'd250;
	reg [23:0] B = 24'd4;
	wire [47:0] Result;
	Sequ_Multiplier UUT4(clk, rst, startMul, A, B, Result, doneMul);	
	always #5 clk <= ~clk;
	initial begin
		#20  rst = 1;
		#20  rst = 0;
		#20  startMul = 1;
		#20  startMul = 0;
		#300;
		#20 $stop;
	end
endmodule
