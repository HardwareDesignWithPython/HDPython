import unittest
import os
import shutil

from HDPython import *

import HDPython.examples as  ahe

from HDPython.tests.helpers  import remove_old_files

import HDPython.tests.core_tests as core_t
import HDPython.tests.ex1 as ex1
import HDPython.tests.RamHandler as RamHandler



class TestStringMethods(unittest.TestCase):
    def test_RamHandler_sim(self):
        result, message = RamHandler.RamHandler_sim("tests/RamHandler_sim/")
        self.assertTrue(result,message)
        

    def test_RamHandler2VHDL(self):
        result, message = RamHandler.RamHandler_2vhdl("tests/RamHandler/")
        self.assertTrue(result,message)
    

    

if __name__ == '__main__':
    remove_old_files()
    unittest.main()