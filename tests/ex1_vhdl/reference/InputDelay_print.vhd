-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;
use work.axisStream_slv32.all;
use work.klm_globals_pack.all;
use work.register_t_pack.all;
use work.v_symbol_pack.all;


entity InputDelay_print is 
  port(
    ConfigIn_s2m :  out  axiStream_slv32_s2m := axiStream_slv32_s2m_ctr;
    ConfigIn_m2s :  in  axiStream_slv32_m2s := axiStream_slv32_m2s_ctr;
    globals :  in  klm_globals := klm_globals_ctr;
    globals_clk :  in  std_logic := std_logic_ctr(0, 1)
  );
end entity;



architecture rtl of InputDelay_print is

--------------------------InputDelay_print-----------------
  signal counter : integer := integer_ctr(0, 32); 
  signal d : slv32 := std_logic_vector_ctr(0, 32); 
-------------------------- end InputDelay_print-----------------

begin
  -- begin architecture
  
-----------------------------------
proc : process(globals_clk, ConfigIn_m2s) is
    variable   ax_slave : axiStream_slv32_slave := axiStream_slv32_slave_ctr;
  
  begin
        pull( self  =>  ax_slave, rx => ConfigIn_m2s);
  
  if rising_edge(globals_clk) then
    enter_rising_edge(self => ax_slave);
  
  counter <= counter + 1;
    
      if (isReceivingData_0(self => ax_slave)) then 
        get_value_01_rshift(self => ax_slave, rhs => d);
        
      end if;
    
      if (counter > 15) then 
        counter <= 0;
        
      end if;
    
    exit_rising_edge(self => ax_slave);
  
  end if;
        push( self  =>  ax_slave, rx => ConfigIn_s2m);
  
  
  end process;
  -- end architecture

end architecture;