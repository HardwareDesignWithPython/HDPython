
import functools
import argparse
import os,sys,inspect
import copy


from HDPython.base import *
from HDPython.v_symbol import *
from HDPython.v_entity import *
from HDPython.simulation import *

from HDPython.examples.axiStream import *

gData= {
    "data":1
}

class axiPrint(v_clk_entity):
    def __init__(self,clk=None):
        super().__init__(clk)
        self.Axi_in = port_Slave(axisStream(v_slv(32)))
        self.architecture()

        
    def architecture(self):
        @process()
        def _process1():
            axiSalve = axisStream_slave(self.Axi_in)

            i_buff = v_slv(32)

            @rising_edge(self.clk)
            def proc():
                #print("axiPrint",i_buff.value )
                if axiSalve :
                    i_buff << axiSalve
                    #print("axiPrint valid",i_buff.value )



class clk_generator(v_entity):
    def __init__(self):
        super().__init__()
        self.clk = port_out(v_sl())
        self.architecture()

    def architecture(self):
        
        @process()
        def p1():

            @timed()
            def proc():
                self.clk << 1
                #print("======================")
                #print(value(self.clk), gData["data"])
                yield wait_for(10)
                #print(value(self.clk), gData["data"])
                self.clk << 0
                #print(value(self.clk), gData["data"])
                yield wait_for(10)


class tb_entity(v_entity):
    def __init__(self):
        super().__init__()
        self.architecture()
        


    def architecture(self):
        clkgen = clk_generator()

        Axi_out = axisStream(v_slv(32))
        counter = v_slv(32)
        axFil = axiPrint(clkgen.clk)
        axFil.Axi_in << Axi_out


        @process()
        def p2():
            v_Axi_out = axisStream_master(Axi_out)
            @rising_edge(clkgen.clk)
            def proc():
                if v_Axi_out and counter < 40:
                    #print("counter", counter.value)
                    v_Axi_out << counter
                    
                    counter << counter + 1
                
                
