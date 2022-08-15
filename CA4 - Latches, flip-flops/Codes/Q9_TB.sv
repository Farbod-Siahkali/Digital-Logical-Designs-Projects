`timescale 1ns/1ns
module ShifRegisterFF_Always_TB();
  logic sin = 0 , CLK = 0;
  wire [7:0] PO;
  reg [7:0] PI = 8'b00000001;
  Shift_Rg_Always UUT(sin, CLK, PI, PO);
  always #70 CLK = ~CLK;
  always #70 sin = $random;;
  initial begin
    #2000 $stop;
  end
endmodule