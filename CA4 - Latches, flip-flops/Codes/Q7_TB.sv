`timescale 1ns/1ns
module FF_TB();
  logic CLK = 1;
  logic D = 0;
  wire Qb, Q;
  integer i;
  logic rst = 0;
  D_FlipFlop UUT(D, CLK, rst, Q, Qb);
  always #80 CLK <= ~CLK;
  initial begin
    for(i=0; i<20; i = i+1) begin
         #80 D = $random();
    end
    #80 rst = 1;
    #200 $stop;
  end
endmodule