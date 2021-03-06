//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : vsequence1
// File            : vsequence1.svh
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
// vsequence1
//----------------------------------------------------------------------
class vsequence1 extends virtual_sequence_base;

  // factory registration macro
  `uvm_object_utils(vsequence1)

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------   
  function new(string name = "vsequence1");
    super.new(name);
  endfunction: new

  //--------------------------------------------------------------------
  // body
  //--------------------------------------------------------------------   
  task body();
    sequence1 seq_a = sequence1::type_id::create("seq_a");
    seq_a.start(m_agente_unico_sequencer);
  endtask: body

endclass: vsequence1

