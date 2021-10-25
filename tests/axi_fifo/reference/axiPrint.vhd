-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;
use work.axisStream_slv32.all;
use work.v_symbol_pack.all;


entity axiPrint is 
  port(
    Axi_in_s2m :  out  axiStream_slv32_s2m := axiStream_slv32_s2m_ctr;
    Axi_in_m2s :  in  axiStream_slv32_m2s := axiStream_slv32_m2s_ctr;
    clk :  in  std_logic := std_logic_ctr(0, 1)
  );
end entity;



architecture rtl of axiPrint is

--------------------------axiPrint-----------------
  signal i_buff : slv32 := std_logic_vector_ctr(0, 32); 
-------------------------- end axiPrint-----------------

begin

  -----------------------------------
  proc : process(clk, Axi_in_m2s) is
      variable   axiSalve : axiStream_slv32_slave := axiStream_slv32_slave_ctr;
    variable axiSalve_buff : std_logic_vector(31 downto 0) := (others => '0');
    
    begin
          pull( self  =>  axiSalve, rx => Axi_in_m2s);
    
    if rising_edge(clk) then
      enter_rising_edge(self => axiSalve);
    
    
        if (isReceivingData_0(self => axiSalve)) then 
          read_data_00(self => axiSalve, dataOut => axiSalve_buff);
          i_buff <= axiSalve_buff;
          
        end if;
      
      exit_rising_edge(self => axiSalve);
    
    end if;
          push( self  =>  axiSalve, rx => Axi_in_s2m);
    
    
    end process;
  
end architecture;