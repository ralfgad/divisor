//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : vsequence2
// File            : vsequence2.svh
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
// vsequence2
//----------------------------------------------------------------------
class vsequence2 extends virtual_sequence_base;

  // factory registration macro
  `uvm_object_utils(vsequence2)

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------   
  function new(string name = "vsequence2");
    super.new(name);
  endfunction: new

  //--------------------------------------------------------------------
  // body
  //--------------------------------------------------------------------   
  task body();
    sequence2 seq_a = sequence2::type_id::create("seq_a");
    seq_a.start(m_agente_unico_sequencer);
  endtask: body

endclass: vsequence2

