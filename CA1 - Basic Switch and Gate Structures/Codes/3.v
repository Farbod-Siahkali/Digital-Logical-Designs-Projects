`timescale 1ns/1ns
module MUX4x1_NAND(input a, b, c, d, s0, s1, output out);
 wire ln1, ln2, ln3, ln4, ln5 , ln6, ln7, ln8, s0p, s1p;
 NAND_Gate nand1(s0, s0, s0p);
 NAND_Gate nand2(s1, s1, s1p);

 NAND_Gate nand3(s0p, a, ln2);
 NAND_Gate nand4(b, s0, ln1);
 NAND_Gate nand5(c, s0p, ln4);
 NAND_Gate nand6(d, s0, ln3);

 NAND_Gate nand7(ln1, ln2, ln5);
 NAND_Gate nand8(ln3, ln4, ln6);

 NAND_Gate nand9(ln5, s1p, ln7);
 NAND_Gate nand10(s1, ln6, ln8);

 NAND_Gate nand11(ln7, ln8, out);
endmodule