//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : test_base
// File            : test_base.svh
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
// test_base
//----------------------------------------------------------------------
virtual class test_base extends uvm_test;

  // factory registration macro
  `uvm_component_utils(test_base)
  
  // internal components
  env_divisor  m_env;

  // configuration objects:
  env_divisor_config m_env_cfg;
  agente_unico_config m_agente_unico_cfg;

  
  //--------------------------------------------------------------------
  // new
  //-------------------------------------------------------------------- 
  function new(string name = "test_base", 
               uvm_component parent = null);
    super.new(name, parent);
  endfunction: new
  
  //--------------------------------------------------------------------
  // build_phase
  //-------------------------------------------------------------------- 
  virtual function void build_phase(uvm_phase phase);

    // Create env configuration object
    m_env_cfg   = env_divisor_config::type_id::create("m_env_cfg");
    // Call function to configure the env
    configure_env_divisor(m_env_cfg);
    
    // Create agente_unico agent configuration object
    m_agente_unico_cfg = agente_unico_config::type_id::create("m_agente_unico_cfg");  
    if(!uvm_config_db #(virtual interfaz_divisor)::get(this, "", "vif_vif", m_agente_unico_cfg.vif)) 
    begin
      `uvm_error("RESOURCE_ERROR", "interfaz_divisor virtual interface not found")
    end
    m_env_cfg.m_agente_unico_cfg    = m_agente_unico_cfg;
    // Call function to configure the agent    
    configure_agente_unico(m_agente_unico_cfg);


    uvm_config_db #(env_divisor_config)::set(this, "*", "env_divisor_config", m_env_cfg);
    
    // Turn on the transaction recording feature in Questa/UVM
    uvm_config_db #(int)::set(this, "*", "recording_detail", UVM_FULL);

    m_env = env_divisor::type_id::create("m_env", this);

    
  endfunction: build_phase

  //--------------------------------------------------------------------
  // connect_phase
  //--------------------------------------------------------------------
  virtual function void connect_phase(uvm_phase phase);


  endfunction: connect_phase

  //--------------------------------------------------------------------
  // end_of_elaboration_phase
  //--------------------------------------------------------------------
  virtual function void end_of_elaboration_phase(uvm_phase phase);
    // Use the function call to change the verbosity level for your
    // testbench. This is in the end_of_elaboration phase because
    // all of your testbench components need to be built for this to
    // work through the hierarchy.  You can also change the verbosity
    // for your testbench on the simulator command line by using 
    // +UVM_VERBOSITY=UVM_MEDIUM.
    // UVM_MEDIUM is the default verbosity level in UVM.
    set_report_verbosity_level_hier(UVM_MEDIUM);

  endfunction: end_of_elaboration_phase

  //--------------------------------------------------------------------
  // configure_env_divisor
  //--------------------------------------------------------------------
  // Convenience function to configure the env
  // This can be overloaded by extensions to this base class
  
  virtual function void configure_env_divisor (env_divisor_config cfg);
 
  endfunction: configure_env_divisor

  //--------------------------------------------------------------------
  // configure_agente_unico
  //--------------------------------------------------------------------
  // Convenience function to configure the agente_unico agent
  // This can be overloaded by extensions to this base class
  
  virtual function void configure_agente_unico (agente_unico_config cfg);
    cfg.is_active = UVM_ACTIVE;
  endfunction: configure_agente_unico


  //--------------------------------------------------------------------
  // init_vseq
  //--------------------------------------------------------------------
  // Method to initialise the virtual sequence handles
  function void init_vseq(virtual_sequence_base vseq);
    vseq.m_agente_unico_sequencer = m_env.m_agente_unico.m_sequencer;
  endfunction: init_vseq

endclass: test_base

