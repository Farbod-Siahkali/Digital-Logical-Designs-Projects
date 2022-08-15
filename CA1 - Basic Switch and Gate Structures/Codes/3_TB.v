  `timescale 1ns/1ns
module MUX_4x1_NAND_TB();
  reg aa,bb,cc,dd,S0,S1;
  wire outt;
  integer i=0;
  MUX4x1_NAND UUT(aa,bb,cc,dd,S0,S1,outt);
  initial begin
  for(i=0; i<64; i=i+1) begin
  #100; {aa,bb,cc,dd,S0,S1} = 64-i;
  #100; {aa,bb,cc,dd,S0,S1} = i;
  end
  #100 $stop;
  end
endmodule