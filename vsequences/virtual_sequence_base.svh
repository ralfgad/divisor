//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : virtual_sequence_base
// File            : virtual_sequence_base.svh
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
// virtual_sequence_base
//----------------------------------------------------------------------
class virtual_sequence_base extends uvm_sequence #( uvm_sequence_item );

  // factory registration macro
  `uvm_object_utils(virtual_sequence_base)

  // Handles for the target sequencers:
  uvm_sequencer #(agente_unico_item, agente_unico_item)  m_agente_unico_sequencer;
  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------   
  function new(string name = "virtual_sequence_base");
    super.new(name);
  endfunction: new

endclass: virtual_sequence_base

