`timescale 1ns/1ns
module detector10010mealy_PRE(input clk, rst, J, output w);
  reg [2:0] ns, ps;
  parameter [2:0] A=3'b000, B=3'b001, C=3'b010, D=3'b100, E=3'b011;
  always @(ps, J) begin
    ns = A;
    case(ps)
       A: ns = J ? B : A;
       B: ns = J ? B : C;
       C: ns = J ? B : D;
       D: ns = J ? E : A;
       E: ns = J ? B : C;
       default: ns = A;
     endcase
  end
  assign  w = (ps == E) ? ~J : 1'b0;
  always @(posedge clk, posedge rst) begin
       if(rst)
           ps <= A;
       else
           ps <= ns;
  end
endmodule