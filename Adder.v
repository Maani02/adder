module full_adder(
  input a,
  input b,
  input cin,
  output sum,
  output cout
);

  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (a & cin);

endmodule

module seven_segment(
  input [3:0] in,
  output [6:0] out
);

  case(in)
    4'b0000: out = 7'b1000000; // 0
    4'b0001: out = 7'b1111001; // 1
    4'b0010: out = 7'b0100100; // 2
    4'b0011: out = 7'b0110000; // 3
    4'b0100: out = 7'b0011001; // 4
    4'b0101: out = 7'b0010010; // 5
    4'b0110: out = 7'b0000010; // 6
    4'b0111: out = 7'b1111000; // 7
    4'b1000: out = 7'b0000000; // 8
    4'b1001: out = 7'b0010000; // 9
    default: out = 7'b1111111; // off
  endcase

endmodule

module full_adder_test(
  input a,
  input b,
  input cin,
  output reg [3:0] segment_out
);

  wire sum, cout;
  full_adder fa(a, b, cin, sum, cout);
  seven_segment ss(sum + cout, segment_out);

endmodule
