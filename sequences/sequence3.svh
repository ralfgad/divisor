//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : sequence3
// File            : sequence3.svh
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
// sequence3
//----------------------------------------------------------------------
class sequence3 extends uvm_sequence #( agente_unico_item, agente_unico_item );

  // factory registration macro
  `uvm_object_utils(sequence3)

  // variables  
  agente_unico_item req_item_h;  
  int num_repetions = 500;  

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------   
  function new(string name = "sequence3");
    super.new(name);
  endfunction: new

  //--------------------------------------------------------------------
  // body
  //--------------------------------------------------------------------   
  task body();
    req_item_h = agente_unico_item::type_id::create("req_item_h");
    repeat(num_repetions) begin
      start_item(req_item_h);
      req_item_h.Num_pos.constraint_mode(0);
      req_item_h.Den_pos.constraint_mode(0);
      req_item_h.Num_neg.constraint_mode(1);
      req_item_h.Den_neg.constraint_mode(1); 
      assert(req_item_h.randomize());
      `uvm_info({get_type_name(),":body"},{"Sending transaction ",req_item_h.convert2string()}, UVM_MEDIUM)
      finish_item(req_item_h);
      if ($get_coverage()>70)
      disable body;
    end 
  endtask: body

endclass: sequence3

