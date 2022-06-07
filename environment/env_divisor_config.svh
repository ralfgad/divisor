//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : env_divisor_config
// File            : env_divisor_config.svh
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
// env_divisor_config
//----------------------------------------------------------------------
class env_divisor_config extends uvm_object;

  // factory registration macro
  `uvm_object_utils(env_divisor_config)

  // internal components
  agente_unico_config   m_agente_unico_cfg; 


  // variables
  bit has_agent_agente_unico = 1;
  bit has_scoreboard = 1;
  bit has_coverage_agente_unico = 1;

  
  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------    
  function new(string name = "env_divisor_config"); 
    super.new(name);   

  endfunction: new


   
endclass: env_divisor_config

