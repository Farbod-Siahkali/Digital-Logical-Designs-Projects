`timescale 1ns/1ns
module Part1_TB();
 reg A = 1;
 reg B = 0;
 reg Cin = 0;
 FullAdder UUT(A, B, Cin, Co, S);
 initial begin
  #50; A = 0;
  #50; Cin = 1;
  #50; B = 1;
  #50; B = 0;
  #50; A = 0;
  #50 $stop;
 end
endmodule