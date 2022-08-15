`timescale 1ns/1ns
module Part4_TB();
 reg [15:0] a = 16'b1111111111111110;
 reg [3:0] s = 4'b0000;
 wire [15:0] out;
 integer i;
 Barrel_shifter_16x1 UUT1(a, s, out);
 initial begin
   for(i=0; i < 15; i=i+1) begin
    #150; s = s + 1'b1;
   end
 #150 $stop;
 end
endmodule