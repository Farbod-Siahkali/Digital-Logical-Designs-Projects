`timescale 1ns/1ns
module DLatch_TB();
  logic CLK = 1;
  logic D = 0;
  wire Qb, Q;
  integer i;
  DLatch UUT(D, CLK, Q, Qb);
  always #100 CLK <= ~CLK;
  initial begin
    for(i=0; i<20; i = i+1) begin
         #100 D = $random();
    end
    #100 $stop;
  end
endmodule