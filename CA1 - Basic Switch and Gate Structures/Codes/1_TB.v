`timescale 1ns/1ns
module NAND_TB();
 reg aa = 1, bb = 1;
 wire ww;
 NAND_Gate UUT(aa,bb,ww);
 initial begin
 //examing To 1 worst case senario:
  #20 aa = 1;
  #0 bb = 0;
  #20 aa = 1;
  #0 bb = 1;
  #20 aa = 0;
  #0 bb = 0;
#20 aa = 1; bb = 1;
  #20 $stop;
 end
endmodule