timeunit 1ns;
timeprecision 1ps;

module tb_pwm;
  logic clk;
  logic reset;
  logic signal;

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_pwm);
  end

  pwm dut (clk, reset, signal);

  initial begin
    clk = 0;

    forever #0.5 clk = ~clk;
  end

  initial begin
    reset = 1;
    #1;
    reset = 0;

    #127;

    if (signal) begin
      $display("Test 1 - Passed");    
    end
    else begin
      $display("Test 1 - Failed");
    end

    #1

    if (~signal) begin
      $display("Test 2 - Passed");    
    end
    else begin
      $display("Test 2 - Failed");
    end

    #128

    $finish;
  end
endmodule
