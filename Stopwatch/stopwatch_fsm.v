module stopwatch_fsm(clk, reset_n, start, stop,
                     en);
  input clk;
  input reset_n;
  input start;
  input stop;
  output reg [1:0] en;

  reg [1:0] state;
  reg [1:0] nextstate;
  
  parameter T0 = 2'b00;
  parameter T1 = 2'b01;
  parameter T2 = 2'b10;
  
  always @ (posedge clk or negedge reset_n) begin
    if (~reset_n)
      state <= T0;
    else
      state <= nextstate;
  end
  
  always @ (state or start or stop) begin
    if (~stop)
      nextstate = T0;
    else begin
      case (state)
        T0:
          if (start == 0)
            nextstate = T1;
          else
            nextstate = T0;
        T1:
          if (start == 0)
            nextstate = T2;
          else
            nextstate = T1;
        T2:
          if (start == 0)
            nextstate = T1;
          else
            nextstate = T2;
        default:
          nextstate = T0;
      endcase
    end
  end
  
  always @ (state) begin
    case (state)
      T1 : en = T1;
      T2 : en = T2;
      default : en = T0;
    endcase
  end
  
endmodule
