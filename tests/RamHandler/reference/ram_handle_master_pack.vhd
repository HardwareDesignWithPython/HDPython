-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;
use work.addr_data_pack.all;
use work.optional_t_pack.all;
use work.ram_handler_pack.all;
use work.small_buffer_pack.all;
use work.v_symbol_pack.all;


package ram_handle_master_pack is 

-------------------------------------------------------------------------
------- Start Psuedo Class ram_handle_master -------------------------

type ram_handle_master is record 
    addr : slv32_a(0 to 3 - 1 );
    buff : small_buffer;
    c_data : addr_data;
    data_requested : std_logic;
    tx : ram_handler;
end record;
    
    
  constant ram_handle_master_null : ram_handle_master:= (
    addr => (others => (others => '0')),
    buff => small_buffer_ctr,
    c_data => addr_data_ctr,
    data_requested => std_logic_ctr(0, 1),
    tx => ram_handler_ctr
  );


    type ram_handle_master_a is array (natural range <>) of ram_handle_master;
        

-- v_list getHeader
  function ram_handle_master_ctr  return ram_handle_master;
  procedure pull (self :  inout  ram_handle_master;  signal tx :  in  ram_handler_s2m);
  procedure push (self :  inout  ram_handle_master;  signal tx :  out  ram_handler_m2s);
  procedure pull (self :  inout  ram_handle_master_a;  signal tx :  in  ram_handler_s2m_a);
  procedure push (self :  inout  ram_handle_master_a;  signal tx :  out  ram_handler_m2s_a);
  procedure enter_rising_edge (self :  inout  ram_handle_master);
  procedure exit_rising_edge (self :  inout  ram_handle_master);
  procedure request_data_010 (self :  inout  ram_handle_master; signal adr :  in  std_logic_vector; data :  inout  optional_t);
  procedure request_data_011 (self :  inout  ram_handle_master; signal adr :  in  std_logic_vector; signal data :  out  std_logic_vector);
  procedure send_data_011 (self :  inout  ram_handle_master; signal adr :  in  std_logic_vector; signal data :  in  std_logic_vector);
  function ready_to_send_0 (
   self : ram_handle_master
 ) return boolean;
------- End Psuedo Class ram_handle_master -------------------------
-------------------------------------------------------------------------


end ram_handle_master_pack;


package body ram_handle_master_pack is

-------------------------------------------------------------------------
------- Start Psuedo Class ram_handle_master -------------------------
function ram_handle_master_ctr  return ram_handle_master is
    variable ret : ram_handle_master := ram_handle_master_null; 
  begin 
     return ret;
 
end function;

procedure pull (self :  inout  ram_handle_master;  signal tx :  in  ram_handler_s2m) is
   
  begin 
     pull_01(self.tx, tx);
 
end procedure;

procedure push (self :  inout  ram_handle_master;  signal tx :  out  ram_handler_m2s) is
   
  begin 
     push_01(self.tx, tx);
 
end procedure;

procedure pull (self :  inout  ram_handle_master_a;  signal tx :  in  ram_handler_s2m_a) is
   
  begin 
 
        for i in 0 to self'length - 1 loop
        pull( self =>  self(i), tx => tx(i));
        end loop;
             
end procedure;

procedure push (self :  inout  ram_handle_master_a;  signal tx :  out  ram_handler_m2s_a) is
   
  begin 
 
        for i in 0 to self'length - 1 loop
        push( self =>  self(i), tx => tx(i));
        end loop;
             
end procedure;

procedure enter_rising_edge (self :  inout  ram_handle_master) is
   
  begin 
 self.tx.write_enable := '0';
  for i10 in 0 to self.addr'length - 1 -1 loop 
      self.addr(i10) := self.addr(i10 + 1);
    end loop;
  self.addr(2) :=  (others => '0');
  self.data_requested := '0';
  self.c_data.address := self.addr(0);
  self.c_data.data := self.tx.read_data;
  set_value_00_lshift(self => self.buff, rhs => self.c_data); 
end procedure;

procedure exit_rising_edge (self :  inout  ram_handle_master) is
   
  begin 
 if (self.data_requested = '0') then 
      self.addr(2) := self.addr(1) + 1;
      
    end if;
  
    if (self.addr(2) > 9) then 
      self.addr(2) :=  (others => '0');
      
    end if;
  self.tx.read_address := self.addr(2); 
end procedure;

function ready_to_send_0 (
   self : ram_handle_master
 ) return boolean is
   
  begin 
 return self.tx.write_enable = '0';
   
end function;

procedure send_data_011 (self :  inout  ram_handle_master; signal adr :  in  std_logic_vector; signal data :  in  std_logic_vector) is
   
  begin 
 self.tx.write_enable := '1';
  self.tx.Write_address := adr;
  self.tx.Write_Data := data;
  reset_0(self => self.buff);
   
end procedure;

procedure request_data_011 (self :  inout  ram_handle_master; signal adr :  in  std_logic_vector; signal data :  out  std_logic_vector) is
   
  begin 
 data <= (others => '0');
  re_read_0(self => self.buff);
  for i5 in 0 to 10 -1 loop 
      
      if (to_bool(isReceivingData_0(self => self.buff)) ) then 
        get_value_00_rshift(self => self.buff, rhs => self.c_data);
        
        if (self.c_data.address = adr) then 
          data <= self.c_data.data;
          return;
          
        end if;
        
      end if;
    end loop;
  for i6 in 0 to 3 -1 loop 
      
      if (self.addr(i6) = adr) then 
        return;
        
      end if;
    end loop;
  self.addr(2) := adr;
  self.data_requested := '1';
   
end procedure;

procedure request_data_010 (self :  inout  ram_handle_master; signal adr :  in  std_logic_vector; data :  inout  optional_t) is
   
  begin 
 reset_0(self => data);
  re_read_0(self => self.buff);
  for i7 in 0 to 10 -1 loop 
      
      if (to_bool(isReceivingData_0(self => self.buff)) ) then 
        get_value_00_rshift(self => self.buff, rhs => self.c_data);
        
        if (self.c_data.address = adr) then 
          set_value_00_lshift(self => data, rhs => self.c_data.data);
          return;
          
        end if;
        
      end if;
    end loop;
  for i8 in 0 to 3 -1 loop 
      
      if (self.addr(i8) = adr) then 
        return;
        
      end if;
    end loop;
  self.addr(2) := adr;
  self.data_requested := '1';
   
end procedure;

------- End Psuedo Class ram_handle_master -------------------------
  -------------------------------------------------------------------------


end ram_handle_master_pack;

