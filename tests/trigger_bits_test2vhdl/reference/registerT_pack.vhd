-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;
use work.v_symbol_pack.all;


package registerT_pack is 

-------------------------------------------------------------------------
------- Start Psuedo Class registerT -------------------------

type registerT is record 
    addr : slv16;
    val : slv16;
end record;
    
    
  constant registerT_null : registerT:= (
    addr => std_logic_vector_ctr(0, 16),
    val => std_logic_vector_ctr(0, 16)
  );


    type registerT_a is array (natural range <>) of registerT;
        

  function registerT_ctr  return registerT;
  procedure pull_01 (self : inout registerT; signal data_IO :  in  registerT);
  procedure push_01 (self : inout registerT; signal data_IO :  out  registerT);
  procedure pull_11 (signal self : inout registerT; signal data_IO :  in  registerT);
  procedure push_11 (signal self : inout registerT; signal data_IO :  out  registerT);
------- End Psuedo Class registerT -------------------------
-------------------------------------------------------------------------


end registerT_pack;


package body registerT_pack is

-------------------------------------------------------------------------
------- Start Psuedo Class registerT -------------------------
function registerT_ctr  return registerT is
    variable ret : registerT := registerT_null; 
  begin 
     return ret;
 
end function;

procedure pull_01 (self : inout registerT; signal data_IO :  in  registerT) is
   
  begin 
 self   :=  data_IO; 
end procedure;

procedure push_01 (self : inout registerT; signal data_IO :  out  registerT) is
   
  begin 
 data_IO  <=  self; 
end procedure;

procedure pull_11 (signal self : inout registerT; signal data_IO :  in  registerT) is
   
  begin 
 self   <=  data_IO; 
end procedure;

procedure push_11 (signal self : inout registerT; signal data_IO :  out  registerT) is
   
  begin 
 data_IO  <=  self; 
end procedure;

------- End Psuedo Class registerT -------------------------
  -------------------------------------------------------------------------


end registerT_pack;

