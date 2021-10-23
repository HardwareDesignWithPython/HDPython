import  functools 

__gHDL_export_functions__ = {}

def HDL_Export(Export_function):
    def decorator_rising_edge(func):
        print(Export_function)
        @functools.wraps(func)
        def wrapper_rising_edge(*args, **kwargs):
            return func(*args, **kwargs)


        
        def export(astParser,Node):
            return __gHDL_export_functions__[Export_function](astParser,Node)
        setattr(wrapper_rising_edge, '__hdl_export__', export)
        return wrapper_rising_edge
    return decorator_rising_edge


def Add_Export_Function(Export_Name,Export_function):
    __gHDL_export_functions__[Export_Name] = Export_function


