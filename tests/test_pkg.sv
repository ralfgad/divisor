//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : test_pkg
// File            : test_pkg.svh
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
// test_pkg
//----------------------------------------------------------------------
package test_pkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
   
  // Import the Virtual Sequence and Agent packages
  import virtual_sequences_pkg::*;
  import agente_unico_pkg::*;
  // Import the Environment package
  import env_divisor_pkg::*;

  // Include the Test Components   
  `include "test_base.svh" 
  `include "mi_primer_test.svh"
   
endpackage: test_pkg

