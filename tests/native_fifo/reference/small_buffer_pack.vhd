-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;
use work.v_symbol_pack.all;


package small_buffer_pack is 

-------------------------------------------------------------------------
------- Start Psuedo Class small_buffer -------------------------

type small_buffer is record 
    count : integer;
    count_old : integer;
    head : integer;
    mem : slv32_a(0 to 10 - 1 );
    tail : integer;
    tail_old : integer;
end record;
    
    
  constant small_buffer_null : small_buffer:= (
    count => integer_ctr(0, 32),
    count_old => integer_ctr(0, 32),
    head => integer_ctr(0, 32),
    mem => (others => (others => '0')),
    tail => integer_ctr(0, 32),
    tail_old => integer_ctr(0, 32)
  );


    type small_buffer_a is array (natural range <>) of small_buffer;
        

-- v_list getHeader
  function small_buffer_ctr  return small_buffer;
-- empty procedure removed. name: 'pull'
-- empty procedure removed. name: 'push'
-- empty procedure removed. name: 'pull'
-- empty procedure removed. name: 'push'
-- empty procedure removed. name: 'enter_rising_edge'
-- empty procedure removed. name: 'exit_rising_edge'
  procedure set_value_00_lshift (self :  inout  small_buffer; rhs :  in  std_logic_vector);
  procedure reset_0 (self :  inout  small_buffer);
  function length (self : small_buffer) return integer;
  function ready_to_send_0 (self : small_buffer) return boolean;
  function length_0 (self : small_buffer) return integer;
  procedure re_read_0 (self :  inout  small_buffer);
  procedure get_value_01_rshift (self :  inout  small_buffer; signal rhs :  out  std_logic_vector);
  function isReceivingData_0 (self : small_buffer) return boolean;
------- End Psuedo Class small_buffer -------------------------
-------------------------------------------------------------------------


end small_buffer_pack;


package body small_buffer_pack is

-------------------------------------------------------------------------
------- Start Psuedo Class small_buffer -------------------------
function small_buffer_ctr  return small_buffer is
    variable ret : small_buffer := small_buffer_null; 
  begin 
     return ret;
 
end function;

-- empty procedure removed. name: 'pull'
-- empty procedure removed. name: 'push'
-- empty procedure removed. name: 'pull'
-- empty procedure removed. name: 'push'
-- empty procedure removed. name: 'enter_rising_edge'
-- empty procedure removed. name: 'exit_rising_edge'
function isReceivingData_0 (self : small_buffer) return boolean is
   
  begin 
 return self.count > 0;
   
end function;

procedure get_value_01_rshift (self :  inout  small_buffer; signal rhs :  out  std_logic_vector) is
   
  begin 
 rhs <= (others => '0');
  
    if (self.count > 0) then 
      rhs <= self.mem(self.tail);
      self.tail := self.tail + 1;
      self.count := self.count - 1;
      
    end if;
  
    if (self.tail > self.mem'length - 1) then 
      self.tail := 0;
      
    end if;
   
end procedure;

procedure re_read_0 (self :  inout  small_buffer) is
   
  begin 
 self.tail := self.tail_old;
  self.count := self.count_old;
   
end procedure;

function length_0 (self : small_buffer) return integer is
   
  begin 
 return self.mem'length;
   
end function;

function ready_to_send_0 (self : small_buffer) return boolean is
   
  begin 
 return self.count < self.mem'length;
   
end function;

function length (self : small_buffer) return integer is
   
  begin 
 return self.mem'length;
   
end function;

procedure reset_0 (self :  inout  small_buffer) is
   
  begin 
 self.head := 0;
  self.tail := 0;
  self.count := 0;
   
end procedure;

procedure set_value_00_lshift (self :  inout  small_buffer; rhs :  in  std_logic_vector) is
   
  begin 
 
    if (to_bool(ready_to_send_0(self => self)) ) then 
      self.mem(self.head) := rhs;
      self.head := self.head + 1;
      self.count := self.count + 1;
      
      if (self.head > self.mem'length - 1) then 
        self.head := 0;
        
      end if;
      
    end if;
  self.tail_old := self.tail;
  self.count_old := self.count;
   
end procedure;

------- End Psuedo Class small_buffer -------------------------
  -------------------------------------------------------------------------


end small_buffer_pack;

