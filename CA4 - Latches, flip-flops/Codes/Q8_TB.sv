`timescale 1ns/1ns
module ShifRegister_FF_TB();
  logic sin = 0 , CLK = 0;
  wire [7:0] PO;
  logic rst = 0;
  Shift_Rg_FF UUT(sin, CLK, rst, PO);
  always #70 CLK = ~CLK;
  always #70 sin = $random;;
  initial begin
    #1700 rst = 1;
    #200 $stop;
  end
endmodule