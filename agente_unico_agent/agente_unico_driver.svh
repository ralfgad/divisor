//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : agente_unico_driver
// File            : agente_unico_driver.svh
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
// agente_unico_driver
//----------------------------------------------------------------------
class agente_unico_driver extends uvm_driver #(agente_unico_item, agente_unico_item);

  // factory registration macro
  `uvm_component_utils(agente_unico_driver)  

  // internal components 
  agente_unico_item    req_txn;
  agente_unico_item    rsp_txn;

  // interface  
  virtual interfaz_divisor  vif;

  // local variables
  int tests = 0;

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------    
  function new (string name = "agente_unico_driver",
                uvm_component parent = null);
    super.new(name,parent);
  endfunction: new

  //--------------------------------------------------------------------
  // run_phase
  //--------------------------------------------------------------------  
  virtual task run_phase(uvm_phase phase);
    
    // Call Blocking (uses get_next_item() ) or 
    // Non-Blocking (uses try_next_item() ) driver styles.
    // Choose Non-Blocking if you need to drive idle cycles.
    
    drive_blocking;
    // drive_non_blocking;

  endtask: run_phase

  //--------------------------------------------------------------------
  // report_phase
  //--------------------------------------------------------------------  
  virtual function void report_phase(uvm_phase phase);
    string s;  
    $sformat(s, "%0d sequence items", tests);
    `uvm_info({get_type_name(),":report"}, s, UVM_MEDIUM )
  endfunction: report_phase

  //--------------------------------------------------------------------
  // drive_blocking
  //--------------------------------------------------------------------
  // Blocking style driver (uses get_next_item()).

  virtual task drive_blocking();
    forever begin
      @(negedge vif.clk)
      if (vif.rst) begin
        seq_item_port.get_next_item(req_txn);
        tests++;
        drive_dut();
        // Put response data into the req_txn fields
        seq_item_port.item_done();
      end 
    end
  endtask: drive_blocking

  //--------------------------------------------------------------------
  // drive_non_blocking
  //--------------------------------------------------------------------  
  // Non-Blocking style driver (uses try_next_item()).
  // Choose this style if you need to drive idle cycles.
  
  virtual task drive_non_blocking();
    forever begin
      @(negedge vif.clk)
      if (vif.rst) begin
        seq_item_port.try_next_item(req_txn);
        // Send Idle pattern
        if (req_txn == null) begin
          drive_idle();
        end
        // Send next Sequence Item
        else begin
          tests++;
          drive_dut();
          // Put response data into the req_txn fields          
          seq_item_port.item_done();
        end 
      end 
    end
  endtask: drive_non_blocking

  //--------------------------------------------------------------------
  // drive_idle
  //--------------------------------------------------------------------    
  virtual task drive_idle(); 
  
    // Drive idle pattern

  endtask: drive_idle

  //--------------------------------------------------------------------
  // drive_dut
  //--------------------------------------------------------------------  
  virtual task drive_dut(); 
  // Drive transactions onto interface signals
    `uvm_info({get_type_name(),":drive_dut"},req_txn.convert2string(),UVM_MEDIUM)

//  e.g.  vif.data <= req_txn.data;

    vif.sd.empieza <= 1;
    vif.sd.data1_in<=req_txn.numerador;
    vif.sd.data2_in<=req_txn.denominador;    
    repeat(3) @(vif.sd); 
    vif.sd.empieza<= 0;
    @(negedge vif.sd.termina);
  endtask: drive_dut

  //--------------------------------------------------------------------
  // reset_dut
  //--------------------------------------------------------------------  
  virtual task reset_dut();

//  e.g. vif.data <= 8'bx;

  endtask: reset_dut
  
endclass: agente_unico_driver

