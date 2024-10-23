//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux_2_1
(
  input  [3:0] d0, d1,
  input        sel,
  output [3:0] y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module mux_4_1
(
  input  [3:0] d0, d1, d2, d3,
  input  [1:0] sel,
  output [3:0] y
);

  // Task:
  // Implement mux_4_1 using three instances of mux_2_1
  wire [3:0] pair_result_0_1, pair_result_2_3;
  
  mux_2_1 mux_pair_0_1
  (
  	.d0(d0),
  	.d1(d1),
  	.sel(sel[0]),
  	.y(pair_result_0_1)
  );
  mux_2_1 mux_pair_2_3
  (
  	.d0(d2),
  	.d1(d3),
  	.sel(sel[0]),
  	.y(pair_result_2_3)
  );
  
  mux_2_1 finish_mux
  (
  	.d0(pair_result_0_1),
  	.d1(pair_result_2_3),
  	.sel(sel[1]),
  	.y(y)
  );

endmodule
