-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;
use work.v_symbol_pack.all;


package ram_handler_pack is 

-------------------------------------------------------------------------
------- Start Psuedo Class ram_handler -------------------------

type ram_handler_s2m is record 
    read_data : slv32;
end record;
    
    
  constant ram_handler_s2m_null : ram_handler_s2m:= (
    read_data => std_logic_vector_ctr(0, 32)
  );


    type ram_handler_s2m_a is array (natural range <>) of ram_handler_s2m;
        


type ram_handler_m2s is record 
    Write_Data : slv32;
    Write_address : slv32;
    read_address : slv32;
    write_enable : std_logic;
end record;
    
    
  constant ram_handler_m2s_null : ram_handler_m2s:= (
    Write_Data => std_logic_vector_ctr(0, 32),
    Write_address => std_logic_vector_ctr(0, 32),
    read_address => std_logic_vector_ctr(0, 32),
    write_enable => std_logic_ctr(0, 1)
  );


    type ram_handler_m2s_a is array (natural range <>) of ram_handler_m2s;
        


type ram_handler is record 
    Write_Data : slv32;
    Write_address : slv32;
    read_address : slv32;
    read_data : slv32;
    write_enable : std_logic;
end record;
    
    
  constant ram_handler_null : ram_handler:= (
    Write_Data => std_logic_vector_ctr(0, 32),
    Write_address => std_logic_vector_ctr(0, 32),
    read_address => std_logic_vector_ctr(0, 32),
    read_data => std_logic_vector_ctr(0, 32),
    write_enable => std_logic_ctr(0, 1)
  );


    type ram_handler_a is array (natural range <>) of ram_handler;
        

  function ram_handler_s2m_ctr  return ram_handler_s2m;
  function ram_handler_m2s_ctr  return ram_handler_m2s;
  function ram_handler_ctr  return ram_handler;
  procedure pull_01 (self : inout ram_handler ; signal IO_data :  in ram_handler_s2m);
  procedure push_01 (self : inout ram_handler ; signal IO_data :  out ram_handler_m2s);
  procedure pull_01 (self : inout ram_handler ; signal IO_data :  out ram_handler_m2s);
  procedure push_01 (self : inout ram_handler ; signal IO_data :  in ram_handler_s2m);
  procedure pull_11 (signal  self : inout ram_handler ; signal IO_data :  in ram_handler_s2m);
  procedure push_11 (signal  self : inout ram_handler ; signal IO_data :  out ram_handler_m2s);
  procedure pull_11 (signal  self : inout ram_handler ; signal IO_data :  out ram_handler_m2s);
  procedure push_11 (signal  self : inout ram_handler ; signal IO_data :  in ram_handler_s2m);
------- End Psuedo Class ram_handler -------------------------
-------------------------------------------------------------------------


end ram_handler_pack;


package body ram_handler_pack is

-------------------------------------------------------------------------
------- Start Psuedo Class ram_handler -------------------------
function ram_handler_s2m_ctr  return ram_handler_s2m is
    variable ret : ram_handler_s2m := ram_handler_s2m_null; 
  begin 
     return ret;
 
end function;

function ram_handler_m2s_ctr  return ram_handler_m2s is
    variable ret : ram_handler_m2s := ram_handler_m2s_null; 
  begin 
     return ret;
 
end function;

function ram_handler_ctr  return ram_handler is
    variable ret : ram_handler := ram_handler_null; 
  begin 
     return ret;
 
end function;

procedure pull_01 (self : inout ram_handler ; signal IO_data :  in ram_handler_s2m) is
   
  begin 
     pull_01(self.read_data, IO_data.read_data);
 
end procedure;

procedure push_01 (self : inout ram_handler ; signal IO_data :  out ram_handler_m2s) is
   
  begin 
     push_01(self.Write_Data, IO_data.Write_Data);
    push_01(self.Write_address, IO_data.Write_address);
    push_01(self.read_address, IO_data.read_address);
    push_01(self.write_enable, IO_data.write_enable);
 
end procedure;

procedure pull_01 (self : inout ram_handler ; signal IO_data :  out ram_handler_m2s) is
   
  begin 
     pull_01(self.Write_Data, IO_data.Write_Data);
    pull_01(self.Write_address, IO_data.Write_address);
    pull_01(self.read_address, IO_data.read_address);
    pull_01(self.write_enable, IO_data.write_enable);
 
end procedure;

procedure push_01 (self : inout ram_handler ; signal IO_data :  in ram_handler_s2m) is
   
  begin 
     push_01(self.read_data, IO_data.read_data);
 
end procedure;

procedure pull_11 (signal  self : inout ram_handler ; signal IO_data :  in ram_handler_s2m) is
   
  begin 
     pull_11(self.read_data, IO_data.read_data);
 
end procedure;

procedure push_11 (signal  self : inout ram_handler ; signal IO_data :  out ram_handler_m2s) is
   
  begin 
     push_11(self.Write_Data, IO_data.Write_Data);
    push_11(self.Write_address, IO_data.Write_address);
    push_11(self.read_address, IO_data.read_address);
    push_11(self.write_enable, IO_data.write_enable);
 
end procedure;

procedure pull_11 (signal  self : inout ram_handler ; signal IO_data :  out ram_handler_m2s) is
   
  begin 
     pull_11(self.Write_Data, IO_data.Write_Data);
    pull_11(self.Write_address, IO_data.Write_address);
    pull_11(self.read_address, IO_data.read_address);
    pull_11(self.write_enable, IO_data.write_enable);
 
end procedure;

procedure push_11 (signal  self : inout ram_handler ; signal IO_data :  in ram_handler_s2m) is
   
  begin 
     push_11(self.read_data, IO_data.read_data);
 
end procedure;

------- End Psuedo Class ram_handler -------------------------
  -------------------------------------------------------------------------


end ram_handler_pack;

