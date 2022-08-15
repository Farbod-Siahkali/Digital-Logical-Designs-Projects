`timescale 1ns/1ns
module Part1_TB();
  reg [3:0] a = 4'b1010;
 reg [1:0] s = 2'b00;
 wire out;
 integer i;
 MUX_4x1 UUT(a[0],a[1],a[2],a[3], s, out);
 initial begin
   for(i=0; i < 3; i=i+1) begin
    #70; s = s + 1'b1;
   end
 #70 $stop;
 end
endmodule