`timescale 1ns/1ns
module detector10010_compare_TB();
   reg j, clk = 0, rst = 0;
   wire Out;
   detector10010_PRE UUT1(clk, rst, j, Out);
   always #25 clk <= ~clk;
   initial begin
      #50 j = 0;
      #50 j = 1;
      #50 j = 0;
      #50 j = 0;
      #50 j = 1;
      #50 j = 0;
      #100 $stop;
   end
endmodule
