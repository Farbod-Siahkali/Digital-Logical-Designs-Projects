`timescale 1ns/1ns
  integer i;
  initial begin
    for(i=0; i<64; i=i+1) begin
     #100; {aa,bb,cc,dd,S0,S1} = 64-i;
     #100; {aa,bb,cc,dd,S0,S1} = i;
    end
   #100 $stop;
  end