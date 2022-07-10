module alu_8bit(sw_a, sw_b, btn,
                out_alu);
  
  input [7:0] sw_a;
  input [7:0] sw_b;
  input [3:0] btn;
  
  output reg [7:0] out_alu;
  
  always @ (btn or sw_a or sw_b) begin
    case (~btn)
      4'b0000:
        out_alu = sw_a & sw_b;
      
      4'b0001:
        out_alu = sw_a | sw_b;
      
      4'b0010:
        if (sw_a[7] & sw_b[7] == 1)
          out_alu = 8'hEE;
        else if (sw_a + sw_b >= 9'b1_0000_0000)
          out_alu = 8'hEE;
      	else
          out_alu = sw_a + sw_b;
      
      4'b0011:
        if (sw_a > sw_b)
          out_alu = sw_a - sw_b;
        else
          out_alu = 8'hEE;
      
      4'b0100:
        out_alu = sw_a << sw_b;
      
      4'b0101:
        out_alu = sw_a >> sw_b;
      
      4'b0110:
        out_alu = sw_a >>> sw_b;
      
      4'b0111:
        out_alu = sw_a ^ sw_b;
      
 	  4'b1000:
        if (sw_a == sw_b)
          out_alu = 8'h01;
        else
          out_alu = 8'h00;
      
      4'b1001:
        if (sw_a >= sw_b)
          out_alu = 8'h01;
        else
          out_alu = 8'h00;
      
      4'b1010:
        if (sw_a < sw_b)
          out_alu = 8'h01;
        else
          out_alu = 8'h00;
      
      4'b1011:
        out_alu = sw_a + sw_b << 2;
      
      4'b1100:
        out_alu = sw_a + 4'h4;
      
      4'b1101:
        out_alu = sw_a - 4'h4;
      
      4'b1110:
        if (sw_a > sw_b)
          out_alu = sw_a;
        else
          out_alu = 8'h00;
      
      4'b1111:
        if (sw_a < sw_b)
          out_alu = sw_a;
        else
          out_alu = 8'h00;
      
      default:
        out_alu = 8'h00;
    endcase
    
  end
  
endmodule
