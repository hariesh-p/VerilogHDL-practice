`timescale 1ns / 1ps
module maincounter (
    input Clock,      
    input Reset,      
    input UpDown,     
    output [6:0] HEX  
);
    wire [3:0] Out;           
    wire Slow_Clk_Out;        

    clkdivider mut (
        .clk(Clock),
        .rst(Reset),
        .slowclk(Slow_Clk_Out)
    );

    generate
        if (UpDown)
            
            four_bit_counter uut (
                .clk(Slow_Clk_Out),
                .rst(Reset),
                .q(Out)
            );
        else
            four_bit_down_counter uut (
                .clk(Slow_Clk_Out),
                .rst(Reset),
                .q(Out)
            );
    endgenerate

    de2_bcd_to_7segment dut (
        .SW(Out),
        .HEX0(HEX)
    );
endmodule

module clkdivider (
    input clk,      
    input rst,      
    output slowclk  
);
    reg [24:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 0;
        else
            count <= count + 1;
    end

    assign slowclk = count[24]; 
endmodule

// 4-bit Up Counter Module
module four_bit_counter (
    input clk,     // Clock input
    input rst,     // Reset input
    output reg [3:0] q // 4-bit output
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 4'b0000;
        else
            q <= q + 1;
    end
endmodule

module four_bit_down_counter (
    input clk,     
    input rst,     
    output reg [3:0] q 
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 4'b1111;
        else
            q <= q - 1;    
    end
endmodule

module bcd_to_7segment (
    input [3:0] bcd,    
    output reg [6:0] seg 
);

    always @(*) begin
        case (bcd)
            4'b0000: seg = 7'b0000001; // 0
            4'b0001: seg = 7'b1111001; // 1
            4'b0010: seg = 7'b0010010; // 2
            4'b0011: seg = 7'b0000110; // 3
            4'b0100: seg = 7'b1001100; // 4
            4'b0101: seg = 7'b0100100; // 5
            4'b0110: seg = 7'b0100000; // 6
            4'b0111: seg = 7'b0001111; // 7
            4'b1000: seg = 7'b0000000; // 8
            4'b1001: seg = 7'b0000100; // 9
            4'b1010: seg = 7'b0001000; // A
            4'b1011: seg = 7'b1100000; // B
            4'b1100: seg = 7'b0110001; // C
            4'b1101: seg = 7'b1000010; // D
            4'b1110: seg = 7'b0110000; // E
            4'b1111: seg = 7'b0111000; // F
            default: seg = 7'b1111111; // Blank 
        endcase
    end
endmodule

module de2_bcd_to_7segment (
    input [3:0] SW,  
    output [6:0] HEX0 
);

    bcd_to_7segment bcd_decoder (
        .bcd(SW),
        .seg(HEX0)
    );
endmodule
