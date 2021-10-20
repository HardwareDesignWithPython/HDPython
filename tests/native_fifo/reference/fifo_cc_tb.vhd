-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;
use work.NativeFifoOut_pack.all;
use work.v_symbol_pack.all;


entity fifo_cc_tb is 
end entity;



architecture rtl of fifo_cc_tb is

--------------------------fifo_cc_tb-----------------
  signal data : slv32 := std_logic_vector_ctr(0, 32); 
--------------------------clkgen-----------------
  signal clkgen_clk : std_logic := std_logic_ctr(0, 1); 
-------------------------- end clkgen-----------------
--------------------------ff_readout-----------------
  signal   ff_readout_Data_in_s2m : NativeFifoOut_s2m := NativeFifoOut_s2m_ctr;
  signal   ff_readout_Data_in_m2s : NativeFifoOut_m2s := NativeFifoOut_m2s_ctr;
  signal ff_readout_clk : std_logic := std_logic_ctr(0, 1); 
-------------------------- end ff_readout-----------------
-------------------------- end fifo_cc_tb-----------------

begin
  -- begin architecture
  
-----------------------------------
proc : process(clkgen_clk) is
  
  begin
  
  if rising_edge(clkgen_clk) then
  ff_readout_Data_in_m2s.empty <= '1';
    data <= data + 1;
    
      if (( data > 10 and data < 20) ) then 
        ff_readout_Data_in_m2s.empty <= '0';
        
      end if;
    
      if (to_bool(ff_readout_Data_in_s2m.enable) ) then 
        ff_readout_Data_in_m2s.data <= data;
        
      end if;
    
  end if;
  
  
  end process;
  -- end architecture

  clkgen : entity work.clk_generator port map (
    clk => clkgen_clk
  );
  
  ff_readout : entity work.readout_native_fifo port map (
    Data_in_s2m => ff_readout_Data_in_s2m,
    Data_in_m2s => ff_readout_Data_in_m2s,
    clk => ff_readout_clk
  );
  ff_readout_clk <= clkgen_clk;
  
end architecture;