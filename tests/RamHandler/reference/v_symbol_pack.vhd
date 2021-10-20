library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;



package v_symbol_pack is 

     subtype slv32 is std_logic_vector(31 downto 0);
    constant slv32_null : slv32 := (others => '0');
    type slv32_a is array (natural range <>) of slv32;
    function slv32_ctr(Data : Integer) return slv32;




end package;

package body v_symbol_pack is


    function slv32_ctr(Data : Integer) return  slv32 is 
    variable ret : slv32;
    begin
        ret := std_logic_vector_ctr(Data , slv32'length);
        return ret;
    end function;     

            
end package body;
