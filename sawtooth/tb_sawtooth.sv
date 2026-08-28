timeunit 1ns;
timeprecision 1ps;

module tb_sawtooth;
  logic clk;
  logic reset;
  logic [7:0] signal;

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_sawtooth);
  end

  sawtooth #(
    .CLK(1_000_000_000),
    .WAVE_FREQUENCY(1_000_000)
  ) dut (clk, reset, signal);

  initial begin
    clk = 0;

    forever #500ps clk = ~clk;
  end

  initial begin
    signal = 0;
    
    reset = 1;
    #1;
    reset = 0;

    #200us;

    $finish;
  end
endmodule
