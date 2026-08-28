module pwm #(
  parameter int RESOLUTION = 8,
  parameter logic [RESOLUTION - 1:0] DUTY = 127
) (
  input logic clk,
  input logic reset,
  output logic signal
);
  logic [RESOLUTION - 1:0] counter;

  always_ff @(posedge clk) begin
    if (reset | counter > DUTY) signal <= 0;
    else signal <= 1;

    counter <= counter + 1;
  end
endmodule
