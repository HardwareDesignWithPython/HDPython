-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;
use work.axisStream_slv32.all;
use work.v_symbol_pack.all;


entity dataSource is 
  port(
    DataOut_s2m :  in  axiStream_slv32_s2m := axiStream_slv32_s2m_ctr;
    DataOut_m2s :  out  axiStream_slv32_m2s := axiStream_slv32_m2s_ctr;
    clk :  in  std_logic := std_logic_ctr(0, 1)
  );
end entity;



architecture rtl of dataSource is

--------------------------dataSource-----------------
  signal data : slv32 := std_logic_vector_ctr(5, 32); 
-------------------------- end dataSource-----------------

begin
  -- begin architecture
  
-----------------------------------
proc : process(clk, DataOut_s2m) is
    variable   mast : axiStream_slv32_master := axiStream_slv32_master_ctr;
  
  begin
        pull( clk  =>  clk, self  =>  mast, tx => DataOut_s2m);
  
  if rising_edge(clk) then
  
      if (ready_to_send_0(self => mast)) then 
        send_data_01(self => mast, dataIn => data);
        data <= data + 2;
        
      end if;
    
  end if;
        push( clk  =>  clk, self  =>  mast, tx => DataOut_m2s);
  
  
  end process;
  -- end architecture

end architecture;