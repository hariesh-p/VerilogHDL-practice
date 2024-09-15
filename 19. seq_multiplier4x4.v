module seq_multiplier4x4(
input [3:0] A,B,
input clk,rst,
output reg [7:0] P,
output reg done);

reg [7:0]product;
reg [2:0]count;
reg [3:0] multiplier,multiplicand;
always@(posedge clk or rst) begin
if (rst) begin
multiplicand<=A;
multiplier<=B;
product<=0;
count<=4;
done <=0;
P<=0;
end
else if ( count>0) begin
if (multiplier[0]==1) begin
product=product+(multiplicand<<(4-count));
end
multiplier=multiplier>>1;
count=count-1;
if (count==1) begin
P<=product;
done<=1;
end
end
end
endmodule
