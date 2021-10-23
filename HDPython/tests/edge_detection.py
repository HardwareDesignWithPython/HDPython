import HDPython as  hdp
from HDPython.v_entity import rising_edge

from HDPython.v_record import v_record
from HDPython.base import v_copy, architecture, end_architecture 

import HDPython.examples as hdp_ex

from .helpers import Folders_isSame, vhdl_conversion, do_simulation,printf, printff
from HDPython.test_handler import add_test

#import sin function 
from math import sin
from enum import Enum, auto




class optional_t(v_record):
    def __init__(self,DataType= hdp.v_slv(32)):
        super().__init__()
        self.data = hdp.v_signal(DataType)
        self.valid = hdp.v_signal(hdp.v_sl())

    def get_data(self, data):
        if self.valid:
            data << self.data


    def __rshift__(self, rhs):
        rhs.reset()
        if self.valid:
            rhs << self.data


    def is_valid(self):
        return self.valid == 1
    
    def reset(self):
        self.data.reset()
        self.valid << 0
    
    def set_inValid(self):
        self.valid << 0

    def set_data(self, data):
        self.valid << 1
        self.data << data



    def __bool__(self):
        return self.is_valid()

class myStates(Enum):
    e_idle = auto()
    e_sending =  auto()
    e_receiving = auto()
    
    




class ADC_Controller(hdp.v_clk_entity):
    def __init__(self, clk = hdp.v_sl() ):
        super().__init__(clk)
        self.data_in       = hdp.port_Slave(optional_t(hdp.v_slv(32)))
        self.ADC_sample_nr = hdp.port_Master(optional_t(hdp.v_slv(32)))
        self.ADC_value     = hdp.port_Slave(optional_t(hdp.v_slv(32)))

        self.data_out      = hdp.port_Master(optional_t(hdp.v_slv(32)))
        self.architecture()

    @hdp.architecture
    def architecture(self):       
        look_back_window = hdp.v_slv(32,5)
        Number_of_samples = hdp.v_slv(32,10)
        state1  =  hdp.v_enum(myStates.e_idle)
        
        sample = hdp.v_slv(32)
        sample_start = hdp.v_slv(32)
        sample_end = hdp.v_slv(32)



        @hdp.rising_edge(self.clk)
        def proc():
            self.ADC_sample_nr.reset()
            if state1 == myStates.e_idle:
                if self.data_in:
                    state1 << myStates.e_sending
                    sample << self.data_in.data 
                    sample_start << (self.data_in.data - look_back_window)
                    sample_end  << ( self.data_in.data - look_back_window +  Number_of_samples )
                    
            elif state1 == myStates.e_sending:
                self.ADC_sample_nr.set_data( sample_start)
                state1 << myStates.e_receiving
                if sample_start == sample_end:
                    state1 << myStates.e_idle
            
            elif state1 == myStates.e_receiving:
                if self.ADC_value:
                    sample_start << sample_start +1
                    self.data_out.set_data(self.ADC_value.data)
                    state1 << myStates.e_sending











        hdp.end_architecture()




class edge_detection(hdp.v_clk_entity):
    def __init__(self,  clk = hdp.v_sl()):
        super().__init__(clk = clk)
        self.data_out      = hdp.port_Master(optional_t(hdp.v_slv(32)))
        self.data       = hdp.port_Slave(hdp.v_slv(32))
        self.ctime       = hdp.port_Slave(hdp.v_slv(32))
        self.architecture()

    @architecture
    def architecture(self):
        data_old = hdp.v_signal( hdp.v_slv(32))

        @rising_edge(self.clk)
        def proc():
            self.data_out.reset()
            if self.data >= 10 and data_old < 10:
                self.data_out.set_data(self.ctime)
    
        end_architecture()


class data_storage(hdp.v_clk_entity):
    def __init__(self, clk=hdp.v_sl()):
        super().__init__(clk=clk)
        self.ctime  = hdp.port_in(hdp.v_slv(32))
        self.data   = hdp.port_in(hdp.v_slv(32))
        
        self.sampleNr = hdp.port_Slave(optional_t(hdp.v_slv(32)))
        self.data_out = hdp.port_Slave(optional_t(hdp.v_slv(32)))
        self.architecture()

    @hdp.architecture
    def architecture(self):
        storage = []

        @hdp.rising_edge(self.clk)
        def proc():
            self.data_out.reset()
            storage.append([hdp.value( self.ctime),  hdp.value( self.data)])
            
            if self.sampleNr:
                sample = [x[1] for x in  storage if x[0]==max(0, hdp.value(self.sampleNr.data)) ][0]
                self.data_out.set_data( sample)

        hdp.end_architecture()


class example_06(hdp.v_entity):
    def __init__(self):
        super().__init__()
        
        self.architecture()

    @hdp.architecture
    def architecture(self):
        clkgen = hdp_ex.clk_generator()
        ctime = hdp.v_slv(32,0)
        data = hdp.v_slv(32,0)

        edge_detector = edge_detection(clk = clkgen.clk)
        edge_detector.data << data
        edge_detector.ctime << ctime

        ADC = ADC_Controller(clk = clkgen.clk)
        ADC.data_in << edge_detector.data_out
        ADC.data_in.valid << edge_detector.data_out.valid

        storage = data_storage(clk = clkgen.clk)
        storage.data << data
        storage.ctime << ctime
        storage.sampleNr << ADC.ADC_sample_nr
        ADC.ADC_value << storage.data_out

        @hdp.rising_edge(clkgen.clk)
        def proc():
            ctime << ctime +1
            data << int( sin(float( hdp.value(ctime))/3 ) * 20) 

            
            


        hdp.end_architecture()

#tb = example_06()
#hdp.run_simulation(tb,10000,"data/example_06.vcd")
@vhdl_conversion
def data_record_tb_2vhdl(OutputPath, f= None):
    
    tb1 = edge_detection()
    return tb1

def edge_detection_2vhdl():
    return data_record_tb_2vhdl("tests/edge_detection/") 

add_test("edge_detection_2vhdl", edge_detection_2vhdl)