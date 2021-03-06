-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;
use work.myStates_pack.all;
use work.v_symbol_pack.all;


entity enum_TB is 
end entity;



architecture rtl of enum_TB is

--------------------------enum_TB-----------------
  signal counter : integer := integer_ctr(0, 32); 
--------------------------clkgen-----------------
  signal clkgen_clk : std_logic := std_logic_ctr(0, 1); 
-------------------------- end clkgen-----------------
-------------------------- end enum_TB-----------------

begin
  -- begin architecture
  
-----------------------------------
proc : process(clkgen_clk) is
  variable myState : myStates := e_idle;
  variable myState2 : myStates := e_idle;
  
  begin
  
  if rising_edge(clkgen_clk) then
  
  counter <= counter + 1;
    
      if (counter = 10) then 
        myState := e_running_1;
        
      end if;
    
      if (counter = 20) then 
        myState := e_running_2;
        
      end if;
    
      if (counter = 30) then 
        myState := some_other_state;
        
      end if;
    
      if (counter = 40) then 
        myState := some_other_state2;
        
      end if;
    
      if (counter = 50) then 
        counter <= 0;
        myState := myState2;
        
      end if;
    
  
  end if;
  
  
  end process;
  -- end architecture

  clkgen : entity work.clk_generator port map (
    clk => clkgen_clk
  );
  
end architecture;