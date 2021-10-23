from HDPython.ast.ast_classes.ast_base import v_ast_base, add_class

def isDecoratorName(dec, Name):
    if len(dec) == 0:
        return False
    if hasattr(dec[0], "func"): 
        if hasattr(dec[0].func, "id"):
            return dec[0].func.id== Name
    if hasattr(dec[0], "id"):
        return dec[0].id== Name
    return False


class v_funDef(v_ast_base):
    def __init__(self,BodyList,dec=None):
        self.BodyList=BodyList
        self.dec = dec

    def __str__(self):
        ret = "" 
        for x in self.BodyList:
            if x is None:
                continue 
            x_str =str(x) 
            if x_str:
                x_str = x_str.replace("\n", "\n  ")
                ret += x_str+";\n  "

        return ret

    def get_type(self):
        for x in self.BodyList:
            if type(x).__name__ == "v_return":
                return x.get_type()
    





def get_name(Node):
    if hasattr(Node, "attr"):
        return Node.attr
    if hasattr(Node, "func"):
        if hasattr(Node.func, "attr"):
            return Node.func.attr
    return ""





def get_function_object(astParser,Node):
    ret = []
    for x in Node:
        obj = None
        
        if hasattr(x, "value"):
            obj= astParser.Unfold_body(x.value)
        elif hasattr(x, "func"):
            if hasattr(x.func, "value"):
                obj =  astParser.Unfold_body(x.func.value)
            elif hasattr(x.func, "id"):
                
                ret.append( astParser.local_function[x.func.id])
        elif hasattr(x, "id"):
            obj = astParser.Unfold_body(x)
            ret.append( astParser.local_function[obj])
        elif hasattr(x, "func"):
            obj = astParser.Unfold_body(x)
            ret.append( astParser.local_function[obj])
        if hasattr(obj, get_name(x)):
            ret.append( getattr(obj, get_name(x)))
    return ret

def body_unfold_functionDef(astParser,Node):
    astParser.FuncArgs.append(
        {
            "name":Node.name,
            "symbol": Node.name,
            "ScopeType": ""
        }
    )
    obj = get_function_object(astParser,Node.decorator_list)
    if len(obj) != 0:
        return obj[0].__hdl_export__(astParser,Node)
    else:
        decorator_l = astParser.Unfold_body(Node.decorator_list)
    
    localContext = astParser.Context

    ret = list()
    astParser.Context = ret
    for x in Node.body:
        ret.append( astParser.Unfold_body(x))
        

    astParser.Context = localContext
    return v_funDef(ret,decorator_l)


add_class("FunctionDef",body_unfold_functionDef)
