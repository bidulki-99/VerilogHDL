`timescale 1ns / 1ps
module tb_fsm();
  
  reg clk, reset;
  reg [9:0] count;
  wire [3:0] d;
  wire [5:0] seg_sel;
  int cycle;
  
  parameter clk_period = 10;
  
  fsm U0 (.clk(clk), .reset(reset), .count(count),
          .d(d), .seg_sel(seg_sel));
  
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
    count = 0; #3;
    
    while (cycle < 6) begin
      count += 1'h1; #(clk_period);
      
      if (count == 10'h3FF) begin
        count = 10'h000;
        cycle += 1;
      end
      
    end
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #10000 $finish;
  end
  
endmodule
