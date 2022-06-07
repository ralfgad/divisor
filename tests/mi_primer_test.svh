//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : mi_primer_test
// File            : mi_primer_test.svh
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
// mi_primer_test
//----------------------------------------------------------------------
class mi_primer_test extends test_base;

  // factory registration macro
  `uvm_component_utils(mi_primer_test)    

  //--------------------------------------------------------------------
  // new
  //-------------------------------------------------------------------- 
  function new(string name = "mi_primer_test",
               uvm_component parent = null);
    super.new(name, parent);
  endfunction: new

  //--------------------------------------------------------------------
  // build_phase
  //-------------------------------------------------------------------- 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // --- Example code ---
    set_report_verbosity_level_hier(UVM_MEDIUM);
    // --------------------
  endfunction: build_phase

  //--------------------------------------------------------------------
  // run_phase
  //-------------------------------------------------------------------- 
  virtual task run_phase(uvm_phase phase);

    vsequence1 vseqa = vsequence1::type_id::create("vseqa");
    vsequence2 vseqb = vsequence2::type_id::create("vseqb");  
    vsequence3 vseqc = vsequence3::type_id::create("vseqc");
    vsequence4 vseqd = vsequence4::type_id::create("vseqd");     
    phase.raise_objection(this);
    `uvm_info({get_type_name(),":run"}, "Starting test...", UVM_LOW)
    
    //Connect sequence to sequencer and start
    init_vseq(vseqa);  // Using method from test base class to assign sequence handles   
    init_vseq(vseqb);
    init_vseq(vseqc);  // Using method from test base class to assign sequence handles   
    init_vseq(vseqd);    
    vseqa.start(null); // null because no target sequencer
    vseqb.start(null);   
    vseqc.start(null); // null because no target sequencer
    vseqd.start(null);
    // Can add other vsequences and start them in a serial fashion or
    // start them in parallel using one of the fork/join variants
    // This works because start() is a blocking task.

    `uvm_info({get_type_name(),":run"}, "... test completed", UVM_LOW)
    phase.drop_objection(this);

  endtask: run_phase

endclass: mi_primer_test

