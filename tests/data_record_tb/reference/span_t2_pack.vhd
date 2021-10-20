-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;
use work.v_symbol_pack.all;


package span_t2_pack is 

-------------------------------------------------------------------------
------- Start Psuedo Class span_t2 -------------------------

type span_t2 is record 
    start : slv8;
    stop : slv8;
end record;
    
    
  constant span_t2_null : span_t2:= (
    start => std_logic_vector_ctr(3, 8),
    stop => std_logic_vector_ctr(48, 8)
  );


    type span_t2_a is array (natural range <>) of span_t2;
        

  function span_t2_ctr (
   start : integer := 3 ;
    stop : integer := 48
 ) return span_t2;
  procedure pull_01 (signal clk: in std_logic; self : inout span_t2; signal data_IO :  in  span_t2);
  procedure push_01 (signal clk: in std_logic; self : inout span_t2; signal data_IO :  out  span_t2);
  procedure pull_11 (signal clk: in std_logic;  signal self : inout span_t2; signal data_IO :  in  span_t2);
  procedure push_11 (signal clk: in std_logic;  signal self : inout span_t2; signal data_IO :  out  span_t2);
  function isAfterRange_11 (
   Signal self : span_t2 ;
    counter : std_logic_vector
 ) return boolean;
  function isBeforeRange_11 (
   Signal self : span_t2 ;
    counter : std_logic_vector
 ) return boolean;
  function isInRange_11 (
   Signal self : span_t2 ;
    counter : std_logic_vector
 ) return boolean;
------- End Psuedo Class span_t2 -------------------------
-------------------------------------------------------------------------


end span_t2_pack;


package body span_t2_pack is

-------------------------------------------------------------------------
------- Start Psuedo Class span_t2 -------------------------
function span_t2_ctr (
   start : integer := 3 ;
    stop : integer := 48
 ) return span_t2 is
    variable ret : span_t2 := span_t2_null; 
  begin 
     ret.start := slv8_ctr(start);
    ret.stop := slv8_ctr(stop);
    return ret;
 
end function;

procedure pull_01 (signal clk: in std_logic; self : inout span_t2; signal data_IO :  in  span_t2) is
   
  begin 
 self   :=  data_IO; 
end procedure;

procedure push_01 (signal clk: in std_logic; self : inout span_t2; signal data_IO :  out  span_t2) is
   
  begin 
 data_IO  <=  self; 
end procedure;

procedure pull_11 (signal clk: in std_logic;  signal self : inout span_t2; signal data_IO :  in  span_t2) is
   
  begin 
 self   <=  data_IO; 
end procedure;

procedure push_11 (signal clk: in std_logic;  signal self : inout span_t2; signal data_IO :  out  span_t2) is
   
  begin 
 data_IO  <=  self; 
end procedure;

function isInRange_11 (
   Signal self : span_t2 ;
    counter : std_logic_vector
 ) return boolean is
   
  begin 
 return ( self.start <= counter and counter <= self.stop) ;
   
end function;

function isBeforeRange_11 (
   Signal self : span_t2 ;
    counter : std_logic_vector
 ) return boolean is
   
  begin 
 return counter < self.start;
   
end function;

function isAfterRange_11 (
   Signal self : span_t2 ;
    counter : std_logic_vector
 ) return boolean is
   
  begin 
 return self.stop < counter;
   
end function;

------- End Psuedo Class span_t2 -------------------------
  -------------------------------------------------------------------------


end span_t2_pack;

