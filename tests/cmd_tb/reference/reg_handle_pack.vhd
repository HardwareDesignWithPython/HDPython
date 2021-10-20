-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;
use work.v_symbol_pack.all;


package reg_handle_pack is 

-------------------------------------------------------------------------
------- Start Psuedo Class reg_handle -------------------------

type reg_handle_s2m is record 
    data_in : slv32;
end record;
    
    
  constant reg_handle_s2m_null : reg_handle_s2m:= (
    data_in => std_logic_vector_ctr(0, 32)
  );


    type reg_handle_s2m_a is array (natural range <>) of reg_handle_s2m;
        


type reg_handle_m2s is record 
    addr : slv32;
    data_out : slv32;
end record;
    
    
  constant reg_handle_m2s_null : reg_handle_m2s:= (
    addr => std_logic_vector_ctr(0, 32),
    data_out => std_logic_vector_ctr(0, 32)
  );


    type reg_handle_m2s_a is array (natural range <>) of reg_handle_m2s;
        


type reg_handle is record 
    addr : slv32;
    data_in : slv32;
    data_out : slv32;
end record;
    
    
  constant reg_handle_null : reg_handle:= (
    addr => std_logic_vector_ctr(0, 32),
    data_in => std_logic_vector_ctr(0, 32),
    data_out => std_logic_vector_ctr(0, 32)
  );


    type reg_handle_a is array (natural range <>) of reg_handle;
        

  function reg_handle_s2m_ctr  return reg_handle_s2m;
  function reg_handle_m2s_ctr  return reg_handle_m2s;
  function reg_handle_ctr  return reg_handle;
  procedure pull_01 (signal clk : in std_logic;  self : inout reg_handle ; signal IO_data :  in reg_handle_s2m);
  procedure push_01 (signal clk : in std_logic;  self : inout reg_handle ; signal IO_data :  out reg_handle_m2s);
  procedure pull_01 (signal clk : in std_logic;  self : inout reg_handle ; signal IO_data :  in reg_handle_m2s);
  procedure push_01 (signal clk : in std_logic;  self : inout reg_handle ; signal IO_data :  out reg_handle_s2m);
  procedure pull_11 (signal clk : in std_logic;  signal  self : inout reg_handle ; signal IO_data :  in reg_handle_s2m);
  procedure push_11 (signal clk : in std_logic;  signal  self : inout reg_handle ; signal IO_data :  out reg_handle_m2s);
  procedure pull_11 (signal clk : in std_logic;  signal  self : inout reg_handle ; signal IO_data :  in reg_handle_m2s);
  procedure push_11 (signal clk : in std_logic;  signal  self : inout reg_handle ; signal IO_data :  out reg_handle_s2m);
------- End Psuedo Class reg_handle -------------------------
-------------------------------------------------------------------------


end reg_handle_pack;


package body reg_handle_pack is

-------------------------------------------------------------------------
------- Start Psuedo Class reg_handle -------------------------
function reg_handle_s2m_ctr  return reg_handle_s2m is
    variable ret : reg_handle_s2m := reg_handle_s2m_null; 
  begin 
     return ret;
 
end function;

function reg_handle_m2s_ctr  return reg_handle_m2s is
    variable ret : reg_handle_m2s := reg_handle_m2s_null; 
  begin 
     return ret;
 
end function;

function reg_handle_ctr  return reg_handle is
    variable ret : reg_handle := reg_handle_null; 
  begin 
     return ret;
 
end function;

procedure pull_01 (signal clk : in std_logic;  self : inout reg_handle ; signal IO_data :  in reg_handle_s2m) is
   
  begin 
 

-- Start Connecting
    pull_01(clk, self.data_in, IO_data.data_in);

-- End Connecting

         
end procedure;

procedure push_01 (signal clk : in std_logic;  self : inout reg_handle ; signal IO_data :  out reg_handle_m2s) is
   
  begin 
 

-- Start Connecting
    push_01(clk, self.addr, IO_data.addr);
    push_01(clk, self.data_out, IO_data.data_out);

-- End Connecting

         
end procedure;

procedure pull_01 (signal clk : in std_logic;  self : inout reg_handle ; signal IO_data :  in reg_handle_m2s) is
   
  begin 
 

-- Start Connecting
    pull_01(clk, self.addr, IO_data.addr);
    pull_01(clk, self.data_out, IO_data.data_out);

-- End Connecting

         
end procedure;

procedure push_01 (signal clk : in std_logic;  self : inout reg_handle ; signal IO_data :  out reg_handle_s2m) is
   
  begin 
 

-- Start Connecting
    push_01(clk, self.data_in, IO_data.data_in);

-- End Connecting

         
end procedure;

procedure pull_11 (signal clk : in std_logic;  signal  self : inout reg_handle ; signal IO_data :  in reg_handle_s2m) is
   
  begin 
 

-- Start Connecting
    pull_11(clk, self.data_in, IO_data.data_in);

-- End Connecting

         
end procedure;

procedure push_11 (signal clk : in std_logic;  signal  self : inout reg_handle ; signal IO_data :  out reg_handle_m2s) is
   
  begin 
 

-- Start Connecting
    push_11(clk, self.addr, IO_data.addr);
    push_11(clk, self.data_out, IO_data.data_out);

-- End Connecting

         
end procedure;

procedure pull_11 (signal clk : in std_logic;  signal  self : inout reg_handle ; signal IO_data :  in reg_handle_m2s) is
   
  begin 
 

-- Start Connecting
    pull_11(clk, self.addr, IO_data.addr);
    pull_11(clk, self.data_out, IO_data.data_out);

-- End Connecting

         
end procedure;

procedure push_11 (signal clk : in std_logic;  signal  self : inout reg_handle ; signal IO_data :  out reg_handle_s2m) is
   
  begin 
 

-- Start Connecting
    push_11(clk, self.data_in, IO_data.data_in);

-- End Connecting

         
end procedure;

------- End Psuedo Class reg_handle -------------------------
  -------------------------------------------------------------------------


end reg_handle_pack;
