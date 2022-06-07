//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : virtual_sequences_pkg
// File            : virtual_sequences_pkg.svh
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
// virtual_sequences_pkg
//----------------------------------------------------------------------
package virtual_sequences_pkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
   
  // Import the agent package(s)   
  import agente_unico_pkg::*;

  // Include the sequences package
  import sequences_pkg::*; 
  
  // Include the virtual sequence(s)
  `include "virtual_sequence_base.svh"
  `include "vsequence1.svh" 
  `include "vsequence2.svh" 
  `include "vsequence3.svh" 
  `include "vsequence4.svh" 
  
endpackage: virtual_sequences_pkg
