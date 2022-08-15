`timescale 1ns/1ns
module Part2_TB();
 reg [3:0] a = 4'b1110;
 reg [1:0] n = 2'b00;
 wire [3:0] out;
 integer i;
 Barrel_shifter_4bit UUT1(n, a, out);
 initial begin
   for(i=0; i < 3; i=i+1) begin
    #70; n = n + 1'b1;
   end
 #70 $stop;
 end
endmodule
