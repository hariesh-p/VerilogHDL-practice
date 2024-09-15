module multiplier_2x2 (
  input [1:0] A,B,
  output [3:0]M
);
  wire 
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
    
