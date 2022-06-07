//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : agente_unico_agent
// File            : agente_unico_agent.svh
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
// agente_unico
//----------------------------------------------------------------------
class agente_unico extends uvm_agent;

  // configuration object
  agente_unico_config m_cfg;

  // factory registration macro
  `uvm_component_utils(agente_unico)   

  // external interfaces
  uvm_analysis_port #(agente_unico_item) ap;
  // external interfaces
 // uvm_analysis_export #(agente_unico_item) pepito;  

  // internal components
  agente_unico_monitor  m_monitor;
  agente_unico_driver  m_driver;
  uvm_sequencer #(agente_unico_item, agente_unico_item)  m_sequencer;
  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------
  function new(string name = "agente_unico", 
               uvm_component parent = null);
    super.new(name, parent);
  endfunction: new

  //--------------------------------------------------------------------
  // build_phase
  //--------------------------------------------------------------------
  virtual function void build_phase(uvm_phase phase);
    
    if(!uvm_config_db #(agente_unico_config)::get(this, "", "agente_unico_config", m_cfg)) begin
      `uvm_error("build_phase", "agente_unico_config not found")
    end    

    ap = new("ap", this);
    
   // pepito=new("pepito",this);
    
    // Monitor is always built
    m_monitor = agente_unico_monitor::type_id::create("m_monitor", this);
    
    // Driver and Sequencer only built if agent is active
    if (m_cfg.is_active == UVM_ACTIVE) begin
      m_driver     = agente_unico_driver::type_id::create("m_driver",this);
      m_sequencer  = uvm_sequencer #(agente_unico_item, agente_unico_item)::type_id::create("m_sequencer",this);
    end 
  endfunction: build_phase

  //--------------------------------------------------------------------
  // connect_phase
  //--------------------------------------------------------------------
  virtual function void connect_phase(uvm_phase phase);

    // Monitor is always connected
    m_monitor.ap.connect(ap);
    m_monitor.vif = m_cfg.vif;
  //  m_sequencer.rsp_export.connect(pepito);
    
    // Driver and Sequencer only connected if agent is active    
    if (m_cfg.is_active == UVM_ACTIVE) begin
      m_driver.vif = m_cfg.vif;
      m_driver.seq_item_port.connect(m_sequencer.seq_item_export);   
    end     
    
  endfunction: connect_phase

endclass: agente_unico

