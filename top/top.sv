//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : top
// File            : top.svh
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
// top
//----------------------------------------------------------------------
module top;
  
  import uvm_pkg::*;
  import test_pkg::*;

  //--------------------------------------------------------------------
  // hardware instantiation
  //--------------------------------------------------------------------  
  interfaz_divisor     vif(clk, rst);

  clock_reset cr (clk, rst);
  
  top_duv  dut ( .bus(vif.duv));

                  
  
  //--------------------------------------------------------------------
  // virtual interface wrapping & run_test()
  //--------------------------------------------------------------------  
  initial begin

    $timeformat(-9, 0, " ns", 5);
  
    // Put virtual interfaces into the resource db for use in test_base.
    uvm_config_db #(virtual interfaz_divisor)::set(null, "uvm_test_top", "vif_vif", vif);

    run_test(); 
  end

endmodule: top

