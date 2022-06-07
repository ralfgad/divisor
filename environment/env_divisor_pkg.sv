//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : env_divisor_pkg
// File            : env_divisor_pkg.svh
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
// env_divisor_pkg
//----------------------------------------------------------------------
package env_divisor_pkg;

  `include "uvm_macros.svh"  
  import uvm_pkg::*;
   
  // Import the agent package(s)
  import agente_unico_pkg::*;


  // Include the environment config object
  `include "env_divisor_config.svh" 

  // Include the components
  `include "coverage.svh" 
  `include "golden_model.svh" 
  `include "scoreboard.svh" 
  `include "env_divisor.svh" 

   
endpackage: env_divisor_pkg

