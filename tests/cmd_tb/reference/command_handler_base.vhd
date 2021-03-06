-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;
use work.axisStream_slv32.all;
use work.reg_handle_pack.all;
use work.reg_package_pack.all;
use work.register_handler_obj_pack.all;
use work.state_t_pack.all;
use work.v_symbol_pack.all;


entity command_handler_base is 
  port(
    Ax_in_s2m :  out  axiStream_slv32_s2m := axiStream_slv32_s2m_ctr;
    Ax_in_m2s :  in  axiStream_slv32_m2s := axiStream_slv32_m2s_ctr;
    Ax_out_s2m :  in  axiStream_slv32_s2m := axiStream_slv32_s2m_ctr;
    Ax_out_m2s :  out  axiStream_slv32_m2s := axiStream_slv32_m2s_ctr;
    DevHandle_s2m :  in  reg_handle_s2m := reg_handle_s2m_ctr;
    DevHandle_m2s :  out  reg_handle_m2s := reg_handle_m2s_ctr;
    clk :  in  std_logic := std_logic_ctr(0, 1)
  );
end entity;



architecture rtl of command_handler_base is

--------------------------command_handler_base-----------------
-------------------------- end command_handler_base-----------------

begin
  -- begin architecture
  
-----------------------------------
proc : process(clk, Ax_in_m2s, DevHandle_s2m, Ax_out_s2m) is
    variable   data_in : axiStream_slv32_slave := axiStream_slv32_slave_ctr;
  variable state : state_t := idle;
  variable buff : std_logic_vector(31 downto 0) := (others => '0');
    variable   Target_device : register_handler_obj := register_handler_obj_ctr;
    variable   data_out : axiStream_slv32_master := axiStream_slv32_master_ctr;
  
  begin
        pull( self  =>  data_in, rx => Ax_in_m2s);
        pull( self  =>  Target_device, reg_ports => DevHandle_s2m);
        pull( self  =>  data_out, tx => Ax_out_s2m);
  
  if rising_edge(clk) then
    enter_rising_edge(self => data_in);
    enter_rising_edge(self => data_out);
  
  
    if (isReceivingData_0(self => data_in)) then 
    
    if (state = idle) then 
    get_value_00_rshift(self => data_in, rhs => buff);
    
    if (to_bool(isThisHeader_00(self => Target_device, buff => buff)) ) then 
    state := proce;
    
    else
    state := passthrough;
    
    end if;
    
    end if;
    
    end if;
    
    if (state = proce) then 
    process_event_000(self => Target_device, ax_in => data_in, ax_out => data_out);
    
    if (to_bool(isDone_0(self => Target_device)) ) then 
    state := idle;
    Send_end_Of_Stream_00(self => data_out);
    
    end if;
    
    elsif (state = passthrough) then 
    
    if (( isReceivingData_0(self => data_in) and ready_to_send_0(self => data_out)) ) then 
    get_value_00_rshift(self => data_in, rhs => data_out);
    
    end if;
    
    if (to_bool(IsEndOfStream_0(self => data_in)) ) then 
    state := idle;
    
    end if;
    
    end if;
    
    exit_rising_edge(self => data_in);
  
  end if;
        push( self  =>  data_in, rx => Ax_in_s2m);
        push( self  =>  Target_device, reg_ports => DevHandle_m2s);
        push( self  =>  data_out, tx => Ax_out_m2s);
  
  
  end process;
  -- end architecture

end architecture;