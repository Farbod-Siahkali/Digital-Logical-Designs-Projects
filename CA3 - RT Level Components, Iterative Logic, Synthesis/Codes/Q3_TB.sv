`timescale 1ns/1ns
module Part4_TB();
 reg [126 : 0] in;
 wire [6 : 0] out;
 integer seed, i;
 onescounter127bit  #6 onecounter(in, out);
 initial begin
  repeat(20) begin
    #1000 in = $random(seed);
  end
  #1000 in = 127'b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  repeat(253) begin
    #1000 in = {~in[0], in[126 : 1]};
  end
  #1000;
  $stop;
 end
endmodule