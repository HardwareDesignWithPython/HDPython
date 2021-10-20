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


    subtype slv8 is std_logic_vector(7 downto 0);
    constant slv8_null : slv8 := (others => '0');
    type slv8_a is array (natural range <>) of slv8;
    function slv8_ctr(Data : Integer) return slv8;


    subtype signed8 is signed(7 downto 0);
    constant signed8_null : signed8 := (others => '0');
    type signed8_a is array (natural range <>) of signed8;
    function signed8_ctr(Data : Integer) return signed8;


    subtype signed16 is signed(15 downto 0);
    constant signed16_null : signed16 := (others => '0');
    type signed16_a is array (natural range <>) of signed16;
    function signed16_ctr(Data : Integer) return signed16;


    subtype signed17 is signed(16 downto 0);
    constant signed17_null : signed17 := (others => '0');
    type signed17_a is array (natural range <>) of signed17;
    function signed17_ctr(Data : Integer) return signed17;


    subtype signed18 is signed(17 downto 0);
    constant signed18_null : signed18 := (others => '0');
    type signed18_a is array (natural range <>) of signed18;
    function signed18_ctr(Data : Integer) return signed18;




end package;

package body v_symbol_pack is


    function slv16_ctr(Data : Integer) return  slv16 is 
    variable ret : slv16;
    begin
        ret := std_logic_vector_ctr(Data , slv16'length);
        return ret;
    end function;     

            
    function slv8_ctr(Data : Integer) return  slv8 is 
    variable ret : slv8;
    begin
        ret := std_logic_vector_ctr(Data , slv8'length);
        return ret;
    end function;     

            
    function signed8_ctr(Data : Integer) return  signed8 is 
    variable ret : signed8;
    begin
        ret := signed_ctr(Data , signed8'length);
        return ret;
    end function;     

            
    function signed16_ctr(Data : Integer) return  signed16 is 
    variable ret : signed16;
    begin
        ret := signed_ctr(Data , signed16'length);
        return ret;
    end function;     

            
    function signed17_ctr(Data : Integer) return  signed17 is 
    variable ret : signed17;
    begin
        ret := signed_ctr(Data , signed17'length);
        return ret;
    end function;     

            
    function signed18_ctr(Data : Integer) return  signed18 is 
    variable ret : signed18;
    begin
        ret := signed_ctr(Data , signed18'length);
        return ret;
    end function;     

            
end package body;
