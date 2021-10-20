-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;
use work.addr_data_pack.all;
use work.optional_t_pack.all;
use work.ram_handle_master_pack.all;
use work.ram_handler_pack.all;
use work.small_buffer_pack.all;
use work.v_symbol_pack.all;


entity ramHandler_tb is 
end entity;



architecture rtl of ramHandler_tb is

--------------------------ramHandler_tb-----------------
  signal addr_out : slv32 := std_logic_vector_ctr(0, 32); 
  signal adr : slv32 := std_logic_vector_ctr(0, 32); 
  signal data : slv32 := std_logic_vector_ctr(0, 32); 
  signal data_out : slv32 := std_logic_vector_ctr(0, 32); 
--------------------------clkgen-----------------
  signal clkgen_clk : std_logic := std_logic_ctr(0, 1); 
-------------------------- end clkgen-----------------
--------------------------ram-----------------
  signal   ram_DataIO_s2m : ram_handler_s2m := ram_handler_s2m_ctr;
  signal   ram_DataIO_m2s : ram_handler_m2s := ram_handler_m2s_ctr;
  signal ram_clk : std_logic := std_logic_ctr(0, 1); 
-------------------------- end ram-----------------
-------------------------- end ramHandler_tb-----------------

begin
  -- begin architecture
  
-----------------------------------
proc : process(clkgen_clk, ram_DataIO_s2m) is
    variable   ram_master : ram_handle_master := ram_handle_master_ctr;
    variable   data_out_opt : optional_t := optional_t_ctr;
  
  begin
        pull( clk  =>  clkgen_clk, self  =>  ram_master, tx => ram_DataIO_s2m);
  
  if rising_edge(clkgen_clk) then
  data <= data + 10;
    adr <= adr + 1;
    
      if (( to_bool(ready_to_send_0(self => ram_master))  and adr < 10) ) then 
        send_data_011(self => ram_master, adr => adr, data => data);
        
      end if;
    
      if (adr > 10) then 
        request_data_011(self => ram_master, adr => addr_out, data => data_out);
        request_data_010(self => ram_master, adr => addr_out, data => data_out_opt);
        
        if (to_bool(data_out_opt) ) then 
          addr_out <= addr_out + 1;
          
        end if;
        
      end if;
    
      if (addr_out > 8) then 
        addr_out <=  (others => '0');
        
      end if;
    
  end if;
        push( clk  =>  clkgen_clk, self  =>  ram_master, tx => ram_DataIO_m2s);
  
  
  end process;
  -- end architecture

  clkgen : entity work.clk_generator port map (
    clk => clkgen_clk
  );
  
  ram : entity work.ram_block port map (
    DataIO_s2m => ram_DataIO_s2m,
    DataIO_m2s => ram_DataIO_m2s,
    clk => ram_clk
  );
  ram_clk <= clkgen_clk;
  
end architecture;