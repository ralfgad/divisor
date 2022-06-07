//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : coverage
// File            : coverage.svh
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
// coverage
//----------------------------------------------------------------------
class coverage extends uvm_subscriber #(agente_unico_item);

  // factory registration macro
  `uvm_component_utils(coverage)

  // variables 
  agente_unico_item cov_item; 
//   uvm_analysis_port #(agente_unico_item)    periquito;

  //--------------------------------------------------------------------
  // cov_item_cover
  //--------------------------------------------------------------------  
  // --- Example code ----
    covergroup cov_item_cover;
      CP11: coverpoint cov_item.numerador[30:0] iff (cov_item.numerador[31]==1'b0);
      CP12: coverpoint cov_item.numerador[30:0] iff (cov_item.numerador[31]==1'b1);
      CP21: coverpoint cov_item.denominador[30:0] iff (cov_item.denominador[31]==1'b0);
      CP22: coverpoint cov_item.denominador[30:0] iff (cov_item.denominador[31]==1'b1); 
    endgroup
  // ---------------------

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------    
  function new(string name = "coverage", 
               uvm_component parent = null);
    super.new(name, parent);

    cov_item_cover     = new();  

  endfunction: new
  
  //--------------------------------------------------------------------
  // write
  //--------------------------------------------------------------------  
  virtual function void write(agente_unico_item t);
    cov_item = t;
    cov_item_cover.sample();
  endfunction: write

  //--------------------------------------------------------------------
  // report_phase
  //--------------------------------------------------------------------  
  virtual function void report_phase(uvm_phase phase);
    int unsigned covered;
    int unsigned total;
    real pct;

    pct = cov_item_cover.get_coverage(covered, total);
    $display("Coverage: covered = %0d, total = %0d (%5.2f%%)",
             covered, total, pct);

  endfunction: report_phase

endclass: coverage
