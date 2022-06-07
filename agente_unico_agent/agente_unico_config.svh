//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : agente_unico_config
// File            : agente_unico_config.svh
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
// agente_unico_config
//----------------------------------------------------------------------
class agente_unico_config extends uvm_object;
  
  // factory registration macro
  `uvm_object_utils(agente_unico_config)

  // agent configuration
  uvm_active_passive_enum is_active = UVM_ACTIVE;   

  // virtual interface handle:
  virtual interfaz_divisor  vif;

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------
  function new(string name = "agente_unico_config");
    super.new(name);
  endfunction: new


endclass: agente_unico_config

