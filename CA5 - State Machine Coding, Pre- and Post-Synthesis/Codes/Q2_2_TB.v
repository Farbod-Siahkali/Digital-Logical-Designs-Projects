`timescale 1ns/1ns
module detector10010_mealy_compare_TB();
   reg j, clk = 0, rst = 0;
   wire Out1, Out2;
   detector10010mealy_PRE UUT3(clk, rst, j, Out1);
   detector10010mealy UUT4(clk, rst, j, Out2);
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
