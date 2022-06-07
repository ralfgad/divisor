//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : scoreboard
// File            : scoreboard.svh
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
// scoreboard
//----------------------------------------------------------------------
class scoreboard extends uvm_scoreboard;

  // factory registration macro
  `uvm_component_utils(scoreboard)

  // external interfaces
  uvm_analysis_export #(agente_unico_item) expected_export;
  uvm_analysis_export #(agente_unico_item) actual_export;

  // internal channels     
  uvm_tlm_analysis_fifo #(agente_unico_item) expected_fifo;
  uvm_tlm_analysis_fifo #(agente_unico_item) actual_fifo;

  // variables
  string msg;
  agente_unico_item expected_txn;
  agente_unico_item actual_txn;
  agente_unico_item predicted_txn;

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------  
  function new (string name = "scoreboard",  
                uvm_component parent = null);
    super.new(name,parent);
  endfunction: new

  //--------------------------------------------------------------------
  // build_phase
  //--------------------------------------------------------------------  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    expected_fifo   = new("expected_fifo",this);
    actual_fifo     = new("actual_fifo",this);   
    expected_export = new("expected_export",this);   
    actual_export   = new("actual_export",this);   
  endfunction: build_phase

  //--------------------------------------------------------------------
  // connect_phase
  //--------------------------------------------------------------------  
  virtual function void connect_phase(uvm_phase phase);
    super.connect();
    expected_export.connect(expected_fifo.analysis_export);
    actual_export.connect(actual_fifo.analysis_export);
  endfunction: connect_phase

  //--------------------------------------------------------------------
  // run_phase
  //--------------------------------------------------------------------  
  virtual task run_phase(uvm_phase phase);
  
    // --- Example code ---
    forever begin
      expected_fifo.get(expected_txn);
      actual_fifo.get(actual_txn);
     // predicted_txn = predict_expected(expected_txn);
      assert (expected_txn.compare(actual_txn)) begin
        $sformat(msg, "Expected RSP: {%s}  Actual RSP: {%s}",
                      expected_txn.convert2string(),
                       actual_txn.convert2string());
        `uvm_info("SCOREBOARD_PASS", msg, UVM_MEDIUM)
      end
      else begin
        $sformat(msg, "Expected RSP: {%s}  Actual RSP: {%s}",
                       expected_txn.convert2string(),
                     //  predicted_txn.convert2string(),
                       actual_txn.convert2string());
        `uvm_error("SCOREBOARD_FAIL", msg)
      end
    end
    // --------------------

  endtask: run_phase

  //--------------------------------------------------------------------
  // predict_expected
  //--------------------------------------------------------------------  
  function agente_unico_item predict_expected(agente_unico_item expected);
    agente_unico_item predicted = agente_unico_item::type_id::create("predicted");
    
    // --- User code here to calculate expected response ---
    
    `uvm_info("SCOREBOARD",
              $sformatf("INPUT: %s",expected.convert2string()),
              UVM_MEDIUM)
    return predicted;

  endfunction: predict_expected


endclass: scoreboard

