`timescale 1ns/1ns
module ShifRegister_Latch_TB();
   logic sin = 0 , CLK = 1;
   wire [7:0] PO;
   integer i;
   Shift_Rg_Latch UUT(sin, CLK, PO);
   always #70 CLK = ~CLK;
   always #70 sin = $random;
   initial begin
     #1000 $stop;
   end
endmodule
