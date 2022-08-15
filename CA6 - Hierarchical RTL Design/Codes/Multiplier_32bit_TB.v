`timescale 1ns/1ns
module Multiplier_32bit_TB();
	reg clk=1'b0, rst = 0, start = 0, inReady = 0, resultAccepted = 0, inReady2 = 0, resultAccepted2 = 0;
	wire inAccept, resultReady, inAccept2, resultReady2;
	reg [31:0] inBus, outBus_pre, outBus_post;
	wire [31:0] out1, out2;
	Multiplier_32bit_TOP_PRE UUT1(clk, rst, start, inBus, out1, inReady, inAccept, resultAccepted, resultReady);
	Multiplier_32bit_TOP UUT2(clk, rst, start, inBus, out2, inReady2, inAccept2, resultAccepted2, resultReady2);
	always #5 clk <= ~clk;
	initial begin
		#20  rst=1;
		#20  rst=0;
		#20  inBus = 32'b10111110100110011001100110011010;
		#20  inReady = 1; inReady2 = 1;
                #20  if(inAccept) begin inReady = 0; end
		     if(inAccept2) begin inReady2 = 0; end
		#20  inBus = 32'b01000011111110100010000000000000;
		#20  inReady = 1; inReady2 = 1;
                #20  if(inAccept) inReady = 0;
		     if(inAccept2) inReady2 = 0;
		#20  start=1;
		#20  start=0;
		#300;
                #20 if(resultReady) begin
			outBus_pre = out1;
			resultAccepted = 1;
		end
		    if(resultReady2) begin
			outBus_post = out2;
			resultAccepted2 = 1;
		end
                #30 if(~resultReady) resultAccepted = 0;
		    if(~resultReady2) resultAccepted2 = 0;
		#30
		#0 $stop;
	end
endmodule

