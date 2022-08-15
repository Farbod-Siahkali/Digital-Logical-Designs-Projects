`timescale 1ns/1ns
module Part2_TB();
 logic [3:0] A = 4'b1001;
 logic [3:0] B = 4'b1100;
 wire Co;
 wire [3:0] S;
 reg Cin = 0;
 integer seed;
 n_bit_adder #4 UUT(A, B, Cin, S, Co);
 initial begin
repeat (20) begin
  #0 A = $random(seed);
  #0 B = $random(seed);
  #300;
  end
 $stop;
 end
endmodule
