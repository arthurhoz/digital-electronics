module sawtooth #(
  parameter int CLK = 27_000_000,
  parameter int WAVE_FREQUENCY = 27_000,
  parameter int DAC_RESOLUTION = 8
) (
  input logic clk,
  input logic reset,
  output logic [DAC_RESOLUTION - 1:0] signal
);
  localparam int unsigned TICKS = CLK / WAVE_FREQUENCY;
  localparam logic [31:0] PHASE_STEP = 32'hFFFFFFFF / TICKS;
  logic [31:0] phase = 32'b0; 

  always_ff @(posedge clk) begin
    if (reset) phase <= 32'b0;
    else phase <= phase + PHASE_STEP;
  end

  assign signal = phase[31 : 31 - (DAC_RESOLUTION - 1)];
endmodule
