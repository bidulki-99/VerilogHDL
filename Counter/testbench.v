`timescale 1ns / 1ps
module tb_count();
  
  reg clk, reset;
  wire [9:0] count;
  
  parameter clk_period = 10;
  
  counter U0(.clk(clk), .reset(reset), .count(count));
 
  initial begin
    reset = 0;
    #13 reset = 1;
    #(clk_period) reset = 0;
  end
  
  always begin
    clk = 0;
    forever #(clk_period / 2) clk = ~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #10000 $finish;
  end
  
endmodule
