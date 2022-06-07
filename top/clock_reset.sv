//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : clock_reset
// File            : clock_reset.svh
//----------------------------------------------------------------------
// Created by      : rgadea
// Creation Date   : 2022/05/20
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// clock_reset
//----------------------------------------------------------------------
module clock_reset (output bit clk,rst);

  timeunit 1ns;
  timeprecision 10ps;
  
  initial begin
    rst = 0;
    repeat(3) begin
      @ (posedge clk);
    end
    rst = 1;
  end

  initial begin
    clk = 0;
    forever begin
      #10 clk = ~clk;
    end
  end
     
endmodule: clock_reset

