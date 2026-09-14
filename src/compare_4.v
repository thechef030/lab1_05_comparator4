module compare_4(input wire [3:0] a,b, output wire [2:0] o);
  assign o = {a > b, a == b, a < b};
endmodule
