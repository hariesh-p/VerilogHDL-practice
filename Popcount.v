//A "population count" circuit counts the number of '1's in an input vector. Build a population count circuit for a 3-bit input vector.
module top_module( 
    input [2:0] in,
    output [1:0] out );
    assign out= (in[0]&1'b1)+(in[1]&1'b1)+(in[2]&1'b1);
endmodule
