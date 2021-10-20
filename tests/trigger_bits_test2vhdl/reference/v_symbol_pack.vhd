library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;



package v_symbol_pack is 

     subtype slv16 is std_logic_vector(15 downto 0);
    constant slv16_null : slv16 := (others => '0');
    type slv16_a is array (natural range <>) of slv16;
    function slv16_ctr(Data : Integer) return slv16;


    subtype slv5 is std_logic_vector(4 downto 0);
    constant slv5_null : slv5 := (others => '0');
    type slv5_a is array (natural range <>) of slv5;
    function slv5_ctr(Data : Integer) return slv5;


    subtype slv10 is std_logic_vector(9 downto 0);
    constant slv10_null : slv10 := (others => '0');
    type slv10_a is array (natural range <>) of slv10;
    function slv10_ctr(Data : Integer) return slv10;




end package;

package body v_symbol_pack is


    function slv16_ctr(Data : Integer) return  slv16 is 
    variable ret : slv16;
    begin
        ret := std_logic_vector_ctr(Data , slv16'length);
        return ret;
    end function;     

            
    function slv5_ctr(Data : Integer) return  slv5 is 
    variable ret : slv5;
    begin
        ret := std_logic_vector_ctr(Data , slv5'length);
        return ret;
    end function;     

            
    function slv10_ctr(Data : Integer) return  slv10 is 
    variable ret : slv10;
    begin
        ret := std_logic_vector_ctr(Data , slv10'length);
        return ret;
    end function;     

            
end package body;
