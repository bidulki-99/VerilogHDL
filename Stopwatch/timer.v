module timer(clk, reset_n, sec_count, stop,
             d, e, f, g ,h, i);
  input clk;
  input reset_n;
  input [18:0] sec_count;
  input stop;
  
  output reg [3:0] d;
  output reg [3:0] e;
  output reg [3:0] f;
  output reg [3:0] g;
  output reg [3:0] h;
  output reg [3:0] i;
  
  always @ (posedge clk or negedge reset_n) begin
    if (~reset_n)
      d <= 4'd0;
    else begin
      if ((d == 4'b1010) || ~stop)
        d <= 4'd0;
      else begin
        if (sec_count == 19'd499_999)
          d <= d + 4'd1;
        else;
      end
    end
  end
  
  always @ (posedge clk or negedge reset_n) begin
    if (~reset_n)
      e <= 4'd0;
    else begin
      if ((e == 4'b1010) || ~stop)
        e <= 4'd0;
      else begin
        if (d == 4'b1010)
          e <= e + 4'd1;
        else;
      end
    end
  end
  
  always @ (posedge clk or negedge reset_n) begin
    if (~reset_n)
      f <= 4'd0;
    else begin
      if ((f == 4'b1010) || ~stop)
        f <= 4'd0;
      else begin
        if (e == 4'b1010)
          f <= f + 4'd1;
        else;
      end
    end
  end
  
  always @ (posedge clk or negedge reset_n) begin
    if (~reset_n)
      g <= 4'd0;
    else begin
      if ((g == 4'b0110) || ~stop)
        g <= 4'd0;
      else begin
        if (f == 4'b1010)
          g <= g + 4'd1;
        else;
      end
    end
  end
  
  always @ (posedge clk or negedge reset_n) begin
    if (~reset_n)
      h <= 4'd0;
    else begin
      if ((h == 4'b1010) || ~stop)
        h <= 4'd0;
      else begin
        if (g == 4'b0110)
          h <= h + 4'd1;
        else;
      end
    end
  end
  
  always @ (posedge clk or negedge reset_n) begin
    if (~reset_n)
      i <= 4'd0;
    else begin
      if ((i == 4'b0110) || ~stop)
        i <= 4'd0;
      else begin
        if (h == 4'b1010)
          i <= i + 4'd1;
        else;
      end
    end
  end
  
endmodule
