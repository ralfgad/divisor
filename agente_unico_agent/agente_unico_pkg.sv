//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : agente_unico_agent_pkg
// File            : agente_unico_agent_pkg.svh
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
// agente_unico_pkg
//----------------------------------------------------------------------
package agente_unico_pkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;

  // Include the sequence_items (transactions)
  `include "agente_unico_item.svh"  

  // Include the agent config object
  `include "agente_unico_config.svh"

  // Include the components  
  `include "agente_unico_driver.svh"
  `include "agente_unico_monitor.svh"
  `include "agente_unico.svh"

  
endpackage: agente_unico_pkg

