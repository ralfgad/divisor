//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : sequences_pkg
// File            : sequences_pkg.svh
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
// sequences_pkg
//----------------------------------------------------------------------
package sequences_pkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
   
  // Import the agent package(s)   
  import agente_unico_pkg::*;

  // Include the sequence(s)
  //  `include "coverage.svh" 
    `include "sequence1.svh" 
      `include "sequence2.svh" 
        `include "sequence3.svh" 
  `include "sequence4.svh" 
   
endpackage: sequences_pkg
