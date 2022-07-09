`timescale 1ns / 1ps
module tb_seg_controller();
  
  reg clock, reset;
  wire [7:0] o_seg;
  wire [5:0] o_seg_sel;
  
  parameter clk_period = 10;
  
  seg_controller U0(.clk(clock), .reset(reset),
                    .seg(o_seg), .seg_sel(o_seg_sel));
  
  initial begin
    reset = 0;
    #13 reset = 1;
    #(clk_period) reset = 0;
  end
  
  always begin
    clock = 0;
    forever #(clk_period / 2) clock = ~clock;
  end
  
endmodule
