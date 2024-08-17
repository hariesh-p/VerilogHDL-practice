module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire u,v,w,x;
    bcd_fadd inst1(a[3:0],b[3:0],cin,u,sum[3:0]);
    bcd_fadd i2(a[7:4],b[7:4],u,v,sum[7:4]);
    bcd_fadd i3(a[11:8],b[11:8],v,w,sum[11:8]);
    bcd_fadd i4(a[15:12],b[15:12],w,cout,sum[15:12]);
endmodule
/*module bcd_fadd(
    input [3:0]a,b,
    input cin,
    output count,
    output [3:0]sum);
    assign {cout,sum} = a+b+cin;
endmodule*/
