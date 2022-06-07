//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : sequence4
// File            : sequence4.svh
//----------------------------------------------------------------------
// Created by      : rgadea
// Creation Date   : 2022/05/23
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// sequence4
//----------------------------------------------------------------------
class sequence4 extends uvm_sequence #( agente_unico_item, agente_unico_item);

  // factory registration macro
  `uvm_object_utils(sequence4)

  // variables  
  agente_unico_item req_item_h;  
  // coverage veamos;
  int num_repetions = 500;  

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------   
  function new(string name = "sequence4");
    super.new(name);
  endfunction: new

  //--------------------------------------------------------------------
  // body
  //--------------------------------------------------------------------   
  task body();
  //  int unsigned covered;
  //  int unsigned total;
  //  real pct;
    req_item_h = agente_unico_item::type_id::create("req_item_h");
   // pct=veamos.cov_item_cover.CP11.get_coverage(covered,total);
    repeat(num_repetions) begin
      start_item(req_item_h);
      req_item_h.Num_pos.constraint_mode(1);
      req_item_h.Den_pos.constraint_mode(1);
      req_item_h.Num_neg.constraint_mode(0);
      req_item_h.Den_neg.constraint_mode(0);      
      assert(req_item_h.randomize());
      `uvm_info({get_type_name(),":body"},{"Sending transaction ",req_item_h.convert2string()}, UVM_MEDIUM)
      finish_item(req_item_h);
      if ($get_coverage()>90)
      disable body;
    end 
  endtask: body

endclass: sequence4

