module seg_controller(clk, reset,
                      seg, seg_sel);
  
  input clk;
  input reset;
  output [7:0] seg;
  output [5:0] seg_sel;
  
  wire [9:0] count;
  wire [3:0] d;
  
  counter U1_counter(.clk(clk), .reset(reset), .count(count));
  
  fsm U0_fsm(.clk(clk), .reset(reset), .count(count),
             .d(d), .seg_sel(seg_sel));
  
  dec_7seg U2_dec_7seg(.d(d), .seg(seg));
  
endmodule
