`timescale 1ns/1ns
module moore_and_mealy_TB();
   reg j, clk = 0, rst = 0;
   wire Out1, Out2, Out3;
   assign Out3 = Out1 ^ Out2;
   detector10010 UUT5(clk, rst, j, Out1);
   detector10010mealy UUT6(clk, rst, j, Out2);
   always #25 clk <= ~clk;
   initial begin
      #50 j = 0;
      #50 j = 1;
      #50 j = 0;
      #50 j = 0;
      #50 j = 1;
      #50 j = 0;
      #50 j = 1;
      #100 $stop;
   end
endmodule
