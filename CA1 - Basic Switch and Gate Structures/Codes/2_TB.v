`timescale 1ns/1ns
module TriState_TB();
 reg aa = 0, enable = 0;
 wire yy;
integer i;
 Tri_State UUT(aa,enable,yy);
 initial begin
  //examing To 1 worst case senario:
  #20 enable = 1;
  #20 aa = 1;
  #20 aa = 0;
  #20 enable = 0;
  #25 $stop;
 end
endmodule