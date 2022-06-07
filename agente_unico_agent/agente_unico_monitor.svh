//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : agente_unico_monitor
// File            : agente_unico_monitor.svh
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
// agente_unico_monitor
//----------------------------------------------------------------------
class agente_unico_monitor extends uvm_monitor;
  
  // factory registration macro
  `uvm_component_utils(agente_unico_monitor)   
  
  // external interfaces
  uvm_analysis_port     #(agente_unico_item) ap;
  
  // variables
  agente_unico_item    mon_txn, t;
 
  // interface  
  virtual interfaz_divisor  vif;

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------     
  function new (string name = "agente_unico_monitor",
                uvm_component parent = null);
    super.new(name,parent);
  endfunction: new

  //--------------------------------------------------------------------
  // build_phase
  //--------------------------------------------------------------------     
  virtual function void build_phase(uvm_phase phase);

    ap = new("ap",this);          
       
  endfunction: build_phase

  //--------------------------------------------------------------------
  // run_phase
  //--------------------------------------------------------------------  
  virtual task run_phase(uvm_phase phase);
  
    mon_txn = agente_unico_item::type_id::create("mon_txn");
    monitor_dut();

  endtask: run_phase

  //--------------------------------------------------------------------
  // monitor_dut
  //--------------------------------------------------------------------    
  task monitor_dut();
  // Monitor transactions from the interface
    forever begin
      @ (vif.md);
   //   if (!vif.rst) begin
        if (vif.md.termina == 1) begin
           mon_txn.numerador = vif.md.data1_in;
           mon_txn.denominador = vif.md.data2_in;
           mon_txn.cociente = vif.md.data1_out;
           mon_txn.resto = vif.md.data2_out;
          $cast(t, mon_txn.clone());
          ap.write(t);
          `uvm_info({get_type_name(),":monitor_dut"}, t.convert2string(), UVM_MEDIUM)
        end
      end      

  endtask: monitor_dut

endclass: agente_unico_monitor

