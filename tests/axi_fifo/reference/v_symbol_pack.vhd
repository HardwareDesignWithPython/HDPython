library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;



package v_symbol_pack is 

     subtype slv32 is std_logic_vector(31 downto 0);
    constant slv32_null : slv32 := std_logic_vector(to_unsigned(20, 32));
    type slv32_a is array (natural range <>) of slv32;
    function slv32_ctr(Data : Integer) return slv32;


    subtype slv11 is std_logic_vector(10 downto 0);
    constant slv11_null : slv11 := (others => '0');
    type slv11_a is array (natural range <>) of slv11;
    function slv11_ctr(Data : Integer) return slv11;


    subtype slv6 is std_logic_vector(5 downto 0);
    constant slv6_null : slv6 := (others => '0');
    type slv6_a is array (natural range <>) of slv6;
    function slv6_ctr(Data : Integer) return slv6;




end package;

package body v_symbol_pack is


    function slv32_ctr(Data : Integer) return  slv32 is 
    variable ret : slv32;
    begin
        ret := std_logic_vector_ctr(Data , slv32'length);
        return ret;
    end function;     

            
    function slv11_ctr(Data : Integer) return  slv11 is 
    variable ret : slv11;
    begin
        ret := std_logic_vector_ctr(Data , slv11'length);
        return ret;
    end function;     

            
    function slv6_ctr(Data : Integer) return  slv6 is 
    variable ret : slv6;
    begin
        ret := std_logic_vector_ctr(Data , slv6'length);
        return ret;
    end function;     

            
end package body;
