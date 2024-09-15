module multiplier_2x2 (
  input [1:0] A,B,
  output [3:0]M
);
  wire a0b0,a1b0,a0b1,a1b1;
  assign a0b0 = A[0] & B[0];
  assign a1b0 =A[1]&B[0];
  assign a0b1= A[0]&B[1];
  assign a1b1=A[1]&B[1];
  assign M[0]=a0b0;
  halfadder ha1(.a(a1b0),.b(a0b1),.s(M[1]),.c(c1));
  halfadder ha2(.a(c1),.b(a1b1),.s(M[2]),.c(M[3]));

endmodule
module halfadder(
  input a,b,
  output s,c
);
  assign s=a^b;
  assign c=a&b;
endmodule
//TestBench
module tb_multiplier2x2;

reg [1:0]a,b;
wire [3:0]m;

multiplier_2x2 m1(.A(a),.B(b),.M(m));

initial begin
#5;
a=2'b11;
b=2'b10;
#5;
a=2'b10;
b=2'b10;#5;
a=2'b11;
b=2'b11;#5;
a=2'b01;
b=2'b10;#5;
a=2'b01;
b=2'b11;#5;
end
endmodule
