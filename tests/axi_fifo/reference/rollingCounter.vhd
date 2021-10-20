-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;
use work.axisStream_slv32.all;
use work.v_symbol_pack.all;


entity rollingCounter is 
  port(
    Axi_out_s2m :  in  axiStream_slv32_s2m := axiStream_slv32_s2m_ctr;
    Axi_out_m2s :  out  axiStream_slv32_m2s := axiStream_slv32_m2s_ctr;
    MaxCount :  in  slv32 := std_logic_vector_ctr(20, 32);
    clk :  in  std_logic := std_logic_ctr(0, 1)
  );
end entity;



architecture rtl of rollingCounter is

--------------------------rollingCounter-----------------
  signal counter : slv32 := std_logic_vector_ctr(0, 32); 
-------------------------- end rollingCounter-----------------

begin

  -----------------------------------
  proc : process(clk, Axi_out_s2m) is
      variable   v_Axi_out : axiStream_slv32_master := axiStream_slv32_master_ctr;
    
    begin
          pull( clk  =>  clk, self  =>  v_Axi_out, tx => Axi_out_s2m);
    
    if rising_edge(clk) then
    
        if (ready_to_send_0(self => v_Axi_out)) then 
          send_data_01(self => v_Axi_out, dataIn => counter);
          counter <= counter + 1;
          
        end if;
      
        if (counter > MaxCount) then 
          counter <=  (others => '0');
          
        end if;
      
    end if;
          push( clk  =>  clk, self  =>  v_Axi_out, tx => Axi_out_m2s);
    
    
    end process;
  
end architecture;