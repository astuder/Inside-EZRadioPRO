#Imports labels and comments from r2 scripts - part of Inside-EZRadioPRO project
#
# This script does not replace function names unless they start with 'FUN_'
#
# For more information about see:
# https://github.com/astuder/Inside-EZRadioPRO/ghidra

#@author 
#@category Silabs
#@keybinding 
#@menupath 
#@toolbar 

def setComment(space, addr, comment):
    addrobj = toAddr('{}:{:X}'.format(space, addr))
    if addrobj is None:
        # invalid address
        return
    codeUnit = currentProgram.getListing().getCodeUnitAt(addrobj)
    codeUnit.setComment(codeUnit.EOL_COMMENT, comment)
    print('comment @ {:04x}'.format(addr))
    return

def addLabel(space, addr, name, isfunc = False):
    fmgr = currentProgram.getFunctionManager()
    symtable = currentProgram.getSymbolTable();
    addrobj = toAddr('{}:{:X}'.format(space, addr))
    if addrobj is None:
        # invalid address
        return
    
    # check if there's a function to rename    
    func = fmgr.getFunctionAt(addrobj)
    if not func is None:
        if func.getName().startswith('FUN_'):
            # rename function starting with 'FUN_'
            func.setName(name, ghidra.program.model.symbol.SourceType.USER_DEFINED)
            print('function @ {:04x} {}'.format(addr, name))
            return
        else:
            # don't rename other functions
            return
    
    # check if there's already label here
    symbols = symtable.getSymbols(addrobj)
    if len(symbols) > 0:
        # don't overwrite existing labels, unless it starts with 'DAT_'
        if symbols[0].getName().startswith('DAT_'):
            symbols[0].setName(name, ghidra.program.model.symbol.SourceType.USER_DEFINED)
            print('label @ {:04x} {}'.format(addr, name))
        return

    # if the label is for a function, create new function here
    if isfunc == True:
        disassemble(addrobj)        
        if not createFunction(addrobj, name) is None:
            print('function @ {:04x} {}'.format(addr, name))
            return
    
    # otherwise, simply create a label
    createLabel(addrobj, name, False)
    print('label @ {:04x} {}'.format(addr, name))
    return

def parse_addr(addr_str):
    addr_str = addr_str.lstrip()
    if addr_str.startswith('0x'):
        addr = int(addr_str, 16)
        space = 'RAM'
    else:
        addr_expr = addr_str.split('+')
        if addr_expr[0] == '_idata':
            addr = int(addr_expr[1], 16)
            space = 'INTMEM'
        else:
            # address is relative to another label
            symtable = currentProgram.getSymbolTable();
            symbols = getSymbols(addr_expr[0], None)
            if len(symbols) > 0:
                addrobj = symbols[0].getAddress()
                addr = addrobj.getOffset() + int(addr_expr[1], 16)
                space = addrobj.getAddressSpace().getName()
            else:
                return None, None
    return space, addr

def import_func(tokens):
    addr = int(tokens[1], 16)
    name = tokens[3][:-1]
    addLabel('RAM', addr, name, True)
    return

def import_flag(line):
    addr_str = line.split('@')[1]
    space, addr = parse_addr(addr_str)
    if space is None or addr is None:
        return
    name = line.split(' ')[1]
    addLabel(space, addr, name)
    return

def import_comment(line):
    splitline = line.split('@')
    addr_str = splitline[1]
    space, addr = parse_addr(addr_str)
    if space is None or addr is None:
        return
    comment = splitline[0][4:].rstrip()
    setComment(space, addr, comment)
    return

try:
    fname = askFile("Pick r2 script to import.", "Go").path
except ghidra.util.exception.CancelledException:
    print('Import cancelled by user.')
    exit()

with open(fname, 'r') as script:
    funcs = 0
    flags = 0
    comments = 0
    for line in script:
        line = line.rstrip()
        tokens = line.split(' ')
        if tokens[0] == '.(fcn':
            import_func(tokens)
            funcs += 1
        elif tokens[0] == 'f':
            import_flag(line)
            flags += 1
        elif tokens[0] == 'CCu':            
            import_comment(line)
            comments += 1            
    print('Processed {} functions, {} flags and {} comments'.format(funcs, flags, comments))
