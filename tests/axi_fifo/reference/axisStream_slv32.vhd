-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;
use work.v_symbol_pack.all;


package axisStream_slv32 is 

-------------------------------------------------------------------------
------- Start Psuedo Class axiStream_slv32 -------------------------

type axiStream_slv32_s2m is record 
    ready : std_logic;
end record;
    
    
  constant axiStream_slv32_s2m_null : axiStream_slv32_s2m:= (
    ready => std_logic_ctr(0, 1)
  );


    type axiStream_slv32_s2m_a is array (natural range <>) of axiStream_slv32_s2m;
        


type axiStream_slv32_m2s is record 
    data : slv32;
    last : std_logic;
    valid : std_logic;
end record;
    
    
  constant axiStream_slv32_m2s_null : axiStream_slv32_m2s:= (
    data => std_logic_vector_ctr(0, 32),
    last => std_logic_ctr(0, 1),
    valid => std_logic_ctr(0, 1)
  );


    type axiStream_slv32_m2s_a is array (natural range <>) of axiStream_slv32_m2s;
        


type axiStream_slv32 is record 
    data : slv32;
    last : std_logic;
    ready : std_logic;
    valid : std_logic;
end record;
    
    
  constant axiStream_slv32_null : axiStream_slv32:= (
    data => std_logic_vector_ctr(0, 32),
    last => std_logic_ctr(0, 1),
    ready => std_logic_ctr(0, 1),
    valid => std_logic_ctr(0, 1)
  );


    type axiStream_slv32_a is array (natural range <>) of axiStream_slv32;
        

  function axiStream_slv32_s2m_ctr  return axiStream_slv32_s2m;
  function axiStream_slv32_m2s_ctr  return axiStream_slv32_m2s;
  function axiStream_slv32_ctr  return axiStream_slv32;
  procedure pull_01 (self : inout axiStream_slv32 ; signal IO_data :  in axiStream_slv32_s2m);
  procedure push_01 (self : inout axiStream_slv32 ; signal IO_data :  out axiStream_slv32_m2s);
  procedure pull_01 (self : inout axiStream_slv32 ; signal IO_data :  out axiStream_slv32_m2s);
  procedure push_01 (self : inout axiStream_slv32 ; signal IO_data :  in axiStream_slv32_s2m);
  procedure pull_11 (signal  self : inout axiStream_slv32 ; signal IO_data :  in axiStream_slv32_s2m);
  procedure push_11 (signal  self : inout axiStream_slv32 ; signal IO_data :  out axiStream_slv32_m2s);
  procedure pull_11 (signal  self : inout axiStream_slv32 ; signal IO_data :  out axiStream_slv32_m2s);
  procedure push_11 (signal  self : inout axiStream_slv32 ; signal IO_data :  in axiStream_slv32_s2m);
------- End Psuedo Class axiStream_slv32 -------------------------
-------------------------------------------------------------------------


-------------------------------------------------------------------------
------- Start Psuedo Class axiStream_slv32_master -------------------------

type axiStream_slv32_master is record 
    tx : axiStream_slv32;
end record;
    
    
  constant axiStream_slv32_master_null : axiStream_slv32_master:= (
    tx => axiStream_slv32_ctr
  );


    type axiStream_slv32_master_a is array (natural range <>) of axiStream_slv32_master;
        

  function axiStream_slv32_master_ctr  return axiStream_slv32_master;
  procedure pull (self :  inout  axiStream_slv32_master;  signal tx :  in  axiStream_slv32_s2m);
  procedure push (self :  inout  axiStream_slv32_master;  signal tx :  out  axiStream_slv32_m2s);
  procedure pull (self :  inout  axiStream_slv32_master_a;  signal tx :  in  axiStream_slv32_s2m_a);
  procedure push (self :  inout  axiStream_slv32_master_a;  signal tx :  out  axiStream_slv32_m2s_a);
  procedure enter_rising_edge (self :  inout  axiStream_slv32_master);
-- empty procedure removed. name: 'exit_rising_edge'
  procedure send_data_01 (self :  inout  axiStream_slv32_master; signal dataIn :  in  std_logic_vector);
  function to_bool (
   self : axiStream_slv32_master
 ) return boolean;
  procedure Send_end_Of_Stream_00 (self :  inout  axiStream_slv32_master; EndOfStream :  in  boolean := True);
  procedure reset_0 (self :  inout  axiStream_slv32_master);
  function ready_to_send_0 (
   self : axiStream_slv32_master
 ) return boolean;
------- End Psuedo Class axiStream_slv32_master -------------------------
-------------------------------------------------------------------------


-------------------------------------------------------------------------
------- Start Psuedo Class axiStream_slv32_slave -------------------------

type axiStream_slv32_slave is record 
    data_internal2 : slv32;
    data_internal_isLast2 : std_logic;
    data_internal_isvalid2 : std_logic;
    data_internal_was_read2 : std_logic;
    data_isvalid : std_logic;
    rx : axiStream_slv32;
end record;
    
    
  constant axiStream_slv32_slave_null : axiStream_slv32_slave:= (
    data_internal2 => std_logic_vector_ctr(0, 32),
    data_internal_isLast2 => std_logic_ctr(0, 1),
    data_internal_isvalid2 => std_logic_ctr(0, 1),
    data_internal_was_read2 => std_logic_ctr(0, 1),
    data_isvalid => std_logic_ctr(0, 1),
    rx => axiStream_slv32_ctr
  );


    type axiStream_slv32_slave_a is array (natural range <>) of axiStream_slv32_slave;
        

  function axiStream_slv32_slave_ctr  return axiStream_slv32_slave;
  procedure pull (self :  inout  axiStream_slv32_slave;  signal rx :  in  axiStream_slv32_m2s);
  procedure push (self :  inout  axiStream_slv32_slave;  signal rx :  out  axiStream_slv32_s2m);
  procedure pull (self :  inout  axiStream_slv32_slave_a;  signal rx :  in  axiStream_slv32_m2s_a);
  procedure push (self :  inout  axiStream_slv32_slave_a;  signal rx :  out  axiStream_slv32_s2m_a);
  procedure enter_rising_edge (self :  inout  axiStream_slv32_slave);
  procedure exit_rising_edge (self :  inout  axiStream_slv32_slave);
  procedure read_data_00 (self :  inout  axiStream_slv32_slave; dataOut :  out  std_logic_vector);
  function to_bool (
   self : axiStream_slv32_slave
 ) return boolean;
  function IsEndOfStream_0 (
   self : axiStream_slv32_slave
 ) return boolean;
  function isReceivingData_0 (
   self : axiStream_slv32_slave
 ) return boolean;
  procedure observe_data_00 (self :  inout  axiStream_slv32_slave; dataOut :  out  std_logic_vector);
------- End Psuedo Class axiStream_slv32_slave -------------------------
-------------------------------------------------------------------------


end axisStream_slv32;


package body axisStream_slv32 is

-------------------------------------------------------------------------
------- Start Psuedo Class axiStream_slv32 -------------------------
function axiStream_slv32_s2m_ctr  return axiStream_slv32_s2m is
    variable ret : axiStream_slv32_s2m := axiStream_slv32_s2m_null; 
  begin 
     return ret;
 
end function;

function axiStream_slv32_m2s_ctr  return axiStream_slv32_m2s is
    variable ret : axiStream_slv32_m2s := axiStream_slv32_m2s_null; 
  begin 
     return ret;
 
end function;

function axiStream_slv32_ctr  return axiStream_slv32 is
    variable ret : axiStream_slv32 := axiStream_slv32_null; 
  begin 
     return ret;
 
end function;

procedure pull_01 (self : inout axiStream_slv32 ; signal IO_data :  in axiStream_slv32_s2m) is
   
  begin 
     pull_01(self.ready, IO_data.ready);
 
end procedure;

procedure push_01 (self : inout axiStream_slv32 ; signal IO_data :  out axiStream_slv32_m2s) is
   
  begin 
     push_01(self.data, IO_data.data);
    push_01(self.last, IO_data.last);
    push_01(self.valid, IO_data.valid);
 
end procedure;

procedure pull_01 (self : inout axiStream_slv32 ; signal IO_data :  out axiStream_slv32_m2s) is
   
  begin 
     pull_01(self.data, IO_data.data);
    pull_01(self.last, IO_data.last);
    pull_01(self.valid, IO_data.valid);
 
end procedure;

procedure push_01 (self : inout axiStream_slv32 ; signal IO_data :  in axiStream_slv32_s2m) is
   
  begin 
     push_01(self.ready, IO_data.ready);
 
end procedure;

procedure pull_11 (signal  self : inout axiStream_slv32 ; signal IO_data :  in axiStream_slv32_s2m) is
   
  begin 
     pull_11(self.ready, IO_data.ready);
 
end procedure;

procedure push_11 (signal  self : inout axiStream_slv32 ; signal IO_data :  out axiStream_slv32_m2s) is
   
  begin 
     push_11(self.data, IO_data.data);
    push_11(self.last, IO_data.last);
    push_11(self.valid, IO_data.valid);
 
end procedure;

procedure pull_11 (signal  self : inout axiStream_slv32 ; signal IO_data :  out axiStream_slv32_m2s) is
   
  begin 
     pull_11(self.data, IO_data.data);
    pull_11(self.last, IO_data.last);
    pull_11(self.valid, IO_data.valid);
 
end procedure;

procedure push_11 (signal  self : inout axiStream_slv32 ; signal IO_data :  in axiStream_slv32_s2m) is
   
  begin 
     push_11(self.ready, IO_data.ready);
 
end procedure;

------- End Psuedo Class axiStream_slv32 -------------------------
  -------------------------------------------------------------------------


-------------------------------------------------------------------------
------- Start Psuedo Class axiStream_slv32_master -------------------------
function axiStream_slv32_master_ctr  return axiStream_slv32_master is
    variable ret : axiStream_slv32_master := axiStream_slv32_master_null; 
  begin 
     return ret;
 
end function;

procedure pull (self :  inout  axiStream_slv32_master;  signal tx :  in  axiStream_slv32_s2m) is
   
  begin 
     pull_01(self.tx, tx);
 
end procedure;

procedure push (self :  inout  axiStream_slv32_master;  signal tx :  out  axiStream_slv32_m2s) is
   
  begin 
     push_01(self.tx, tx);
 
end procedure;

procedure pull (self :  inout  axiStream_slv32_master_a;  signal tx :  in  axiStream_slv32_s2m_a) is
   
  begin 
 
        for i in 0 to self'length - 1 loop
        pull( self =>  self(i), tx => tx(i));
        end loop;
             
end procedure;

procedure push (self :  inout  axiStream_slv32_master_a;  signal tx :  out  axiStream_slv32_m2s_a) is
   
  begin 
 
        for i in 0 to self'length - 1 loop
        push( self =>  self(i), tx => tx(i));
        end loop;
             
end procedure;

procedure enter_rising_edge (self :  inout  axiStream_slv32_master) is
   
  begin 
 if (to_bool(self.tx.ready) ) then 
      self.tx.valid := '0';
      self.tx.last := '0';
      self.tx.data := (others => '0');
      
    end if; 
end procedure;

-- empty procedure removed. name: 'exit_rising_edge'
function ready_to_send_0 (
   self : axiStream_slv32_master
 ) return boolean is
   
  begin 
 return  not  ( to_bool(self.tx.valid)  ) ;
   
end function;

procedure reset_0 (self :  inout  axiStream_slv32_master) is
   
  begin 
 self.tx.valid := '0';
   
end procedure;

procedure Send_end_Of_Stream_00 (self :  inout  axiStream_slv32_master; EndOfStream :  in  boolean := True) is
   
  begin 
 
    if (to_bool(EndOfStream) ) then 
      self.tx.last := '1';
      
    else
      self.tx.last := '0';
      
    end if;
   
end procedure;

function to_bool (
   self : axiStream_slv32_master
 ) return boolean is
   
  begin 
 return ready_to_send_0(self => self);
   
end function;

procedure send_data_01 (self :  inout  axiStream_slv32_master; signal dataIn :  in  std_logic_vector) is
   
  begin 
 self.tx.valid := '1';
  self.tx.data := dataIn;
   
end procedure;

------- End Psuedo Class axiStream_slv32_master -------------------------
  -------------------------------------------------------------------------


-------------------------------------------------------------------------
------- Start Psuedo Class axiStream_slv32_slave -------------------------
function axiStream_slv32_slave_ctr  return axiStream_slv32_slave is
    variable ret : axiStream_slv32_slave := axiStream_slv32_slave_null; 
  begin 
     return ret;
 
end function;

procedure pull (self :  inout  axiStream_slv32_slave;  signal rx :  in  axiStream_slv32_m2s) is
   
  begin 
     pull_01(self.rx, rx);
 
end procedure;

procedure push (self :  inout  axiStream_slv32_slave;  signal rx :  out  axiStream_slv32_s2m) is
   
  begin 
     push_01(self.rx, rx);
 
end procedure;

procedure pull (self :  inout  axiStream_slv32_slave_a;  signal rx :  in  axiStream_slv32_m2s_a) is
   
  begin 
 
        for i in 0 to self'length - 1 loop
        pull( self =>  self(i), rx => rx(i));
        end loop;
             
end procedure;

procedure push (self :  inout  axiStream_slv32_slave_a;  signal rx :  out  axiStream_slv32_s2m_a) is
   
  begin 
 
        for i in 0 to self'length - 1 loop
        push( self =>  self(i), rx => rx(i));
        end loop;
             
end procedure;

procedure enter_rising_edge (self :  inout  axiStream_slv32_slave) is
   
  begin 
 if (( to_bool(self.rx.ready)  and to_bool(self.rx.valid) ) ) then 
      self.data_isvalid := '1';
      
    end if;
  self.data_internal_was_read2 := '0';
  self.rx.ready := '0';
  
    if (( to_bool(self.data_isvalid)  and  not  ( to_bool(self.data_internal_isvalid2)  ) ) ) then 
      self.data_internal2 := self.rx.data;
      self.data_internal_isvalid2 := self.data_isvalid;
      self.data_internal_isLast2 := self.rx.last;
      self.data_isvalid := '0';
      
    end if; 
end procedure;

procedure exit_rising_edge (self :  inout  axiStream_slv32_slave) is
   
  begin 
 if (to_bool(self.data_internal_was_read2) ) then 
      self.data_internal_isvalid2 := '0';
      
    end if;
  
    if ((  not  ( to_bool(self.data_isvalid)  )  and  not  ( to_bool(self.data_internal_isvalid2)  ) ) ) then 
      self.rx.ready := '1';
      
    end if; 
end procedure;

procedure observe_data_00 (self :  inout  axiStream_slv32_slave; dataOut :  out  std_logic_vector) is
   
  begin 
 
    if (to_bool(self.data_internal_isvalid2) ) then 
      dataOut := self.data_internal2;
      
    end if;
   
end procedure;

function isReceivingData_0 (
   self : axiStream_slv32_slave
 ) return boolean is
   
  begin 
 return self.data_internal_isvalid2 = '1';
   
end function;

function IsEndOfStream_0 (
   self : axiStream_slv32_slave
 ) return boolean is
   
  begin 
 return ( self.data_internal_isvalid2 > '0' and self.data_internal_isLast2 > '0') ;
   
end function;

function to_bool (
   self : axiStream_slv32_slave
 ) return boolean is
   
  begin 
 return isReceivingData_0(self => self);
   
end function;

procedure read_data_00 (self :  inout  axiStream_slv32_slave; dataOut :  out  std_logic_vector) is
   
  begin 
 
    if (to_bool(self.data_internal_isvalid2) ) then 
      dataOut := self.data_internal2;
      self.data_internal_was_read2 := '1';
      
    end if;
   
end procedure;

------- End Psuedo Class axiStream_slv32_slave -------------------------
  -------------------------------------------------------------------------


end axisStream_slv32;

