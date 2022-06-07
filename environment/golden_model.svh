//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : golden_model
// File            : golden_model.svh
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
// golden_model
//----------------------------------------------------------------------
  class golden_model extends uvm_subscriber #(agente_unico_item);
  // factory registration macro
  `uvm_component_utils(golden_model)

  //uvm_analysis_export #(%INPUT_ITEM)) analysis_export; is provided by uvm_subscriber
  uvm_analysis_port #(agente_unico_item)    m_output_ap;
  
  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------
  function new (string name = "golden_model", uvm_component parent = null);
    super.new(name, parent);
  endfunction: new
  
  //--------------------------------------------------------------------
  // build_phase
  //--------------------------------------------------------------------
  function void build_phase(uvm_phase phase);
    m_output_ap = new("m_output_ap", this);
  endfunction : build_phase
  
  //--------------------------------------------------------------------
  // write
  //--------------------------------------------------------------------
  function void write(agente_unico_item t);
    agente_unico_item   m_out_item;
    m_out_item = agente_unico_item::type_id::create("m_out_item");

    //t is the input sequence item (transaction).  Process t and then
    // write the new processed output to the m_output_ap.
    m_out_item.cociente=t.numerador/t.denominador;
    m_out_item.resto=t.numerador%t.denominador;
    m_out_item.numerador=t.numerador;
    m_out_item.denominador=t.denominador;
    m_output_ap.write(m_out_item);
  endfunction : write

endclass : golden_model

