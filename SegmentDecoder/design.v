module dec_7seg(d, seg);
  input [3:0] d;
  output [7:0] seg;
  
  assign seg[0] = ~d[3]&~d[2]&~d[0] | d[3]&~d[0] | ~d[3]&d[1] | ~d[3]&d[2]&d[0] | d[3]&~d[2]&~d[0];
  assign seg[1] = ~d[3]&~d[2] | ~d[3]&~d[1]&~d[0] | ~d[3]&d[1]&d[0] | d[3]&~d[1]&d[0] | d[3]&~d[2]&~d[0];
  assign seg[2] = ~d[3]&~d[1] | ~d[3]&d[0] | ~d[3]&d[2] | ~d[1]&d[0] | d[3]&~d[2];
  assign seg[3] = d[3]&~d[1] | d[2]&~d[1]&d[0] | d[2]&d[1]&~d[0] | ~d[2]&d[1]&d[0] | ~d[3]&~d[2]&~d[0];
  assign seg[4] = d[3]&~d[1]&~d[0] | d[3]&d[2] | d[3]&d[1] | d[1]&~d[0];
  assign seg[5] = ~d[1]&~d[0] | ~d[3]&d[2] | d[3]&~d[2] | d[2]&d[1] | d[3]&d[1];
  assign seg[6] = ~d[3]&~d[2]&d[1] | ~d[3]&d[2]&~d[1] | d[3]&~d[2] | d[3]&d[0] | d[3]&d[1];
  assign seg[7] = d[3]&d[2] | d[3]&d[1];
  
endmodule
