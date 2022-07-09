module counter(clk, reset, count);
  parameter N = 10;
  input clk;
  input reset;
  output reg [N-1 : 0] count;
  
  always @ (posedge clk or posedge reset) begin
    if (reset)
      count <= 0;
    else
      count <= count + 1'b1;
  end  
  
endmodule
