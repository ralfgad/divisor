//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : divisor
// Unit            : agente_unico_item
// File            : agente_unico_item.svh
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
// agente_unico_item
//----------------------------------------------------------------------
class agente_unico_item extends uvm_sequence_item;

  // user stimulus variables (rand)
 rand bit signed [31:0] numerador;
 rand bit signed [31:0] denominador;
 constraint Num_pos    {numerador[31] == 1'b0;}
 constraint Num_neg    {numerador[31] == 1'b1;}
 constraint Den_pos    {denominador[31] == 1'b0;}
 constraint Den_neg    {denominador[31] == 1'b1;}
 bit empieza;

  // user response variables (non rand)
  bit signed [31:0] cociente;
  bit signed [31:0] resto;
  bit termina;
  // factory registration macro
 // `uvm_object_utils(agente_unico_item)

  
  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------
  function new (string name = "agente_unico_item" );
    super.new(name);
  endfunction: new
`uvm_object_utils_begin(agente_unico_item)
`uvm_field_int(numerador, UVM_ALL_ON)
`uvm_field_int(denominador, UVM_ALL_ON)
`uvm_field_int(cociente, UVM_ALL_ON)
`uvm_field_int(resto, UVM_ALL_ON)
`uvm_field_int(empieza, UVM_ALL_ON)
`uvm_field_int(termina, UVM_ALL_ON)
`uvm_object_utils_end
  //--------------------------------------------------------------------
  // do_copy
  //--------------------------------------------------------------------
  // Performs a deep copy of an object.
  /*
  virtual function void do_copy(uvm_object rhs);
    agente_unico_item rhs_;

    if(!$cast(rhs_, rhs)) begin 
      `uvm_error({get_type_name(),":do_copy"}, "Copy Failed, type mismatch")
      return;
    end 
    
    super.do_copy(rhs);  
    numerador=rhs_.numerador;
    denominador=rhs_.denominador;  
    empieza=rhs_.empieza;
    cociente=rhs_.cociente;
    resto=rhs_.resto;
    termina=rhs_.termina;
    
    
  endfunction: do_copy

  //--------------------------------------------------------------------
  // do_compare
  //--------------------------------------------------------------------
  // Compares one object to another of the same type.
  virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    agente_unico_item rhs_;
    
    if(!$cast(rhs_, rhs)) begin 
      `uvm_error({get_type_name(),":do_compare"}, "Compare Failed, type mismatch")
      return 0; 
    end    

    return((super.do_compare(rhs, comparer))
    &&(numerador==rhs_.numerador)
    &&(denominador==rhs_.denominador)
    &&(cociente==rhs_.cociente)
    &&(resto==rhs_.resto)
    &&(empieza==rhs_.empieza)
    &&(termina==rhs_.termina)                
      );
    
  endfunction: do_compare

  //--------------------------------------------------------------------
  // do_print
  //--------------------------------------------------------------------
  // Prints a the result of convert2string to the screen.
  function void do_print(uvm_printer printer);
    if(printer.knobs.sprint == 0) begin
      $display(convert2string());
    end
    else begin
      printer.m_string = convert2string();
    end
  endfunction: do_print
*/
  //--------------------------------------------------------------------
  // convert2string
  //--------------------------------------------------------------------
  // Returns a string representation of the object.
  function string convert2string();
    string str;
    str = super.convert2string();
    $sformat(str, "%s\n",str);
    $sformat(str, "%s numerador: \t%d \n",str,numerador);
    $sformat(str, "%s denominador: \t%d \n",str,denominador);
    $sformat(str, "%s cociente: \t%d \n",str,cociente);
    $sformat(str, "%s resto: \t%d \n",str,resto);
        $sformat(str, "%s empieza: \t%d \n",str,empieza);
    $sformat(str, "%s termina: \t%d \n",str,termina);    
    return str;
  endfunction: convert2string


endclass: agente_unico_item

