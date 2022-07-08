`timescale 1ns / 10ps

module tb_dec_7seg();
  
  reg [3:0] d;
  wire [7:0] seg;
  
  dec_7seg U0(.d(d), .seg(seg));
  
  initial begin
    d = 4'b0000; #10;
    d = 4'b0001; #10;
    d = 4'b0010; #10;
    d = 4'b0011; #10;
    
    d = 4'b0100; #10;
    d = 4'b0101; #10;
    d = 4'b0110; #10;
    d = 4'b0111; #10;
    
    d = 4'b1000; #10;
    d = 4'b1001; #10;
    d = 4'b1010; #10;
    d = 4'b1011; #10;
    
    d = 4'b1100; #10;
    d = 4'b1101; #10;
    d = 4'b1110; #10;
    d = 4'b1111; #10;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #10000 $finish;
  end
  
endmodule
