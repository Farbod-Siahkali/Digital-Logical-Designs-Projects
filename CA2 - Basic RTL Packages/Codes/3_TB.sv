`timescale 1ns/1ns
module Part3_TB();
 reg [15:0] a = 16'b1010101010101010;
 reg [3:0] n = 4'b0000;
 wire out;
 integer i;
 MUX_16x1 UUT2(a, n, out);
 initial begin
   for(i=0; i < 15; i=i+1) begin
    #100; n = n + 4'b0001;
   end
 #100 $stop;
 end
endmodule
