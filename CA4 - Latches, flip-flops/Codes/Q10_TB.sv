`timescale 1ns/1ns
module LFSR_TB();
  logic CLK = 1;
  reg [7:0] PO;
  reg [7:0] PI = 8'b00000010;
  LFSR UUT(CLK, PI, PO);
  always #40 CLK = ~CLK;
 initial begin
   #10200 $stop;
 end
endmodule