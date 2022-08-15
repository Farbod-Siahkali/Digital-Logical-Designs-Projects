`timescale 1ns/1ns
module SRLatch_TB();
  logic CLK = 1;
  logic S = 0, R = 0;
  wire Qb, Q;
  integer i;
  SRLatch UUT(S, R, CLK, Q, Qb);
  always #100 CLK <= ~CLK;
    initial begin
    for(i=0; i<20; i=i+1) begin
         #100 {S,R} = $random();
    end
    #100 $stop;
  end
endmodule