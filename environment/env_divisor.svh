//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : env_divisor
// File            : env_divisor.svh
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
// env_divisor
//----------------------------------------------------------------------
class env_divisor extends uvm_env;

  // factory registration macro
  `uvm_component_utils(env_divisor)

  // internal components
  agente_unico        m_agente_unico; 
  coverage     m_agente_unico_cov;   
  scoreboard   m_scoreboard;
  golden_model  golden_model_1; 
  
  // configuration object
  env_divisor_config m_cfg;

  
  
  
  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------    
  function new(string name = "env_divisor", 
               uvm_component parent = null);
    super.new(name, parent);      
  endfunction: new

  //--------------------------------------------------------------------
  // build_phase
  //-------------------------------------------------------------------- 
  virtual function void build_phase(uvm_phase phase);
    
    if(!uvm_config_db #(env_divisor_config)::get(this, "", "env_divisor_config", m_cfg)) begin
      `uvm_error("build_phase", "env_divisor_config configuration object not found")
    end
    
    // Agent agente_unico
    if(m_cfg.has_agent_agente_unico) begin
      uvm_config_db #(agente_unico_config)::set(this, "m_agente_unico*", "agente_unico_config", m_cfg.m_agente_unico_cfg);
      m_agente_unico = agente_unico::type_id::create("m_agente_unico", this);
    end
    // Scoreboard scoreboard
    if(m_cfg.has_scoreboard) begin
      m_scoreboard = scoreboard::type_id::create("m_scoreboard", this);
    end
    // Coverage coverage for agente_unico
    if(m_cfg.has_coverage_agente_unico) begin
      m_agente_unico_cov = coverage::type_id::create("m_agente_unico_cov", this);
    end



  golden_model_1 = golden_model::type_id::create("golden_model_1", this);
  endfunction: build_phase

  //--------------------------------------------------------------------
  // connect_phase
  //-------------------------------------------------------------------- 
  virtual function void connect_phase(uvm_phase phase);
  
      
    if(m_cfg.has_scoreboard) begin
      m_agente_unico.ap.connect(m_scoreboard.actual_export);
    end
    if(m_cfg.has_coverage_agente_unico) begin
      m_agente_unico.ap.connect(m_agente_unico_cov.analysis_export);
    //  m_agente_unico_cov.periquito.connect(m_agente_unico.pepito);   
    end
       m_agente_unico.ap.connect(golden_model_1.analysis_export);   
  golden_model_1.m_output_ap.connect(m_scoreboard.expected_export); 

  endfunction: connect_phase
   
endclass: env_divisor

