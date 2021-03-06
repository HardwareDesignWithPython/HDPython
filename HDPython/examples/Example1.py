
import unittest
import functools
import argparse
import os,sys,inspect
import copy


from HDPython.base import *
from HDPython.v_symbol import *
from HDPython.examples.axiStream import *
from HDPython.v_entity import *


from HDPython.simulation import *


class tb_entity(v_entity):
    def __init__(self):
        super().__init__()
        self.architecture()


    def architecture(self):
        clk = v_sl()


        @timed()
        def p1():
            clk << 1
            print("set clk to 1")
            yield wait_for(10)
            clk << 1
            print("set clk to 1 again")
            yield wait_for(10)
            clk << 0
            print("set clk to 0")
            yield wait_for(10)

        counter = v_slv(32)
        v_counter = v_slv(32,varSigConst=varSig.variable_t)
        @rising_edge(clk)
        def p2():
            v_counter << v_counter +1
            counter << counter + 1
            print("counter", value(counter))
            print("v_counter", value(v_counter))

        end_architecture()





