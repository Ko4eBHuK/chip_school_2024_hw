//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux
(
  input  d0, d1,
  input  sel,
  output y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module xor_gate_using_mux
(
    input  a,
    input  b,
    output o
);

  // Task:
  // Implement xor gate using instance(s) of mux,
  // constants 0 and 1, and wire connections
  wire a_or_b, a_and_b, not_a_and_b;

  mux a_or_b_mux
  (
    .d0(b),
    .d1(a),
    .sel(a),
    .y(a_or_b)
  );
  mux a_and_b_mux
  (
    .d0(a),
    .d1(b),
    .sel(a),
    .y(a_and_b)
  );
  mux not_a_and_b_mux
  (
    .d0(1'd1),
    .d1(1'd0),
    .sel(a_and_b),
    .y(not_a_and_b)
  );
  mux resulting_and_mux
  (
    .d0(a_or_b),
    .d1(not_a_and_b),
    .sel(a_or_b),
    .y(o)
  );

endmodule
