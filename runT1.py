import HDPython.tests
from HDPython.tests.helpers  import remove_old_files
import HDPython.test_handler as test_handler

remove_old_files()

test_handler.run_all_tests()
#result, message = test_handler.run_test('fir_basic_tb2vhdl')
#print(result , message)
