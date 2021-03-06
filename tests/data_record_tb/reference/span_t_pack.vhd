-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;
use work.v_symbol_pack.all;


package span_t_pack is 

-------------------------------------------------------------------------
------- Start Psuedo Class span_t -------------------------

type span_t is record 
    start : slv8;
    stop : slv8;
end record;
    
    
  constant span_t_null : span_t:= (
    start => std_logic_vector_ctr(1, 8),
    stop => std_logic_vector_ctr(16, 8)
  );


    type span_t_a is array (natural range <>) of span_t;
        

  function span_t_ctr (
   start : integer := 1 ;
    stop : integer := 16
 ) return span_t;
  procedure pull_01 (self : inout span_t; signal data_IO :  in  span_t);
  procedure push_01 (self : inout span_t; signal data_IO :  out  span_t);
  procedure pull_11 (signal self : inout span_t; signal data_IO :  in  span_t);
  procedure push_11 (signal self : inout span_t; signal data_IO :  out  span_t);
  function isInRange_11 (
   Signal self : span_t ;
    counter : std_logic_vector
 ) return boolean;
------- End Psuedo Class span_t -------------------------
-------------------------------------------------------------------------


end span_t_pack;


package body span_t_pack is

-------------------------------------------------------------------------
------- Start Psuedo Class span_t -------------------------
function span_t_ctr (
   start : integer := 1 ;
    stop : integer := 16
 ) return span_t is
    variable ret : span_t := span_t_null; 
  begin 
     ret.start := slv8_ctr(start);
    ret.stop := slv8_ctr(stop);
    return ret;
 
end function;

procedure pull_01 (self : inout span_t; signal data_IO :  in  span_t) is
   
  begin 
 self   :=  data_IO; 
end procedure;

procedure push_01 (self : inout span_t; signal data_IO :  out  span_t) is
   
  begin 
 data_IO  <=  self; 
end procedure;

procedure pull_11 (signal self : inout span_t; signal data_IO :  in  span_t) is
   
  begin 
 self   <=  data_IO; 
end procedure;

procedure push_11 (signal self : inout span_t; signal data_IO :  out  span_t) is
   
  begin 
 data_IO  <=  self; 
end procedure;

function isInRange_11 (
   Signal self : span_t ;
    counter : std_logic_vector
 ) return boolean is
   
  begin 
 return ( self.start <= counter and counter <= self.stop) ;
   
end function;

------- End Psuedo Class span_t -------------------------
  -------------------------------------------------------------------------


end span_t_pack;

