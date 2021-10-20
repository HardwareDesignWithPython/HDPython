
library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.HDPython_core.all;

package state_t_pack is 

  type state_t is ( 
    idle,
    proce,
    passthrough
  );


end state_t_pack;


package body state_t_pack is

end  state_t_pack;

