#Imports EZRadioPRO registers and other information hidden in Silabs Wireless Development Suite (WDS).
#
# For each register the script
# - creates a label
# - adds plate comment documenting register fields
# - if applicable creates enum 
# - assigns byte or enum data type
#
# Before running this script:
# Obtain NewWDS.EXE, which is installed as part of Silabs Wireless Development Suite
# https://www.silabs.com/documents/login/software/WDS3-Setup.exe
#
# It is recommended to use the custom 8051 variant si4440 available at
# https://github.com/astuder/Inside-EZRadioPRO/ghidra
#
# This script was tested with WDS version 3.2.11.0 and Ghidra 9.2.

#@author 
#@category Silabs
#@keybinding 
#@menupath 
#@toolbar 

import xml.etree.ElementTree as ET

def extract_xml(data_src, element_name):
    start_str = '<' + element_name + ' '
    start_str2 = '<' + element_name + '>'
    end_str = '</' + element_name + '>'
    start_bin = start_str.encode('utf-8')
    start_bin2 = start_str2.encode('utf-8')
    end_bin = end_str.encode('utf-8')

    start_pos = data_src.find(start_bin)
    if (start_pos == -1):
        start_pos = data_src.find(start_bin2)
    end_pos = data_src.find(end_bin)
    if (start_pos != -1):
        start_pos = data_src.rfind('<?xml'.encode('utf-8'), 0, start_pos)
    if (start_pos == -1) or (end_pos == -1) or (end_pos < start_pos):
        print('{} XML not found.'.format(element_name))
        return None
    else:
        print('{} XML found from {} to {}.'.format(element_name, start_pos, end_pos));

    return data_src[start_pos:(end_pos+len(end_bin))].decode('utf-8')

def extract_regs(part):
    reg_list = []

    for reg in part.iter('Register'):
        if reg.get('name') == 'spare':
            continue
        r = {}
        r['address'] = int(reg.get('address'), 16)
        r['name'] = reg.get('name').upper()
        try:
            r['defaultVal'] = int(reg.get('defaultVal'), 16)
        except:
            r['defaultVal'] = None
        r['isRead'] = int(reg.get('isRead'))
        r['isWrite'] = int(reg.get('isWrite'))
        r['mode'] = int(reg.get('mode'))
        c = reg.find('Classification')
        r['isTestReg'] = int(c.get('isTestReg'))
        r['isRFReg'] = int(c.get('isRFReg'))
        r['isDigitalReg'] = int(c.get('isDigitalReg'))
        r['isMiscReg'] = int(c.get('isMiscReg'))
        r['isStatusReg'] = int(c.get('isStatusReg'))
        if c.get('isAconfig'):
            r['isAconfig'] = int(c.get('isAconfig'))
        else:
            r['isAconfig'] = 0
        if r['address'] >= 0x5480 and r['address'] <= 0x54ff:
            r['isSFR'] = 1
        else:
            r['isSFR'] = 0
        if r['address'] >= 0x5000 and r['address'] <= 0x51ff:
            r['isXReg'] = 1
        else:
            r['isXReg'] = 0

        fields = [None] * 8
        for bit in reg.findall('Bit'):
            f = {}
            fname = bit.get('name')
            if fname.find('[') > 0:
                f['name'] = fname.split('[')[0]
                f['bit'] = int(fname.split('[')[1].split(']')[0])
            else:
                f['name'] = fname
            if f['name'] != 'reserved':
                f['name'] = f['name'].upper()
            fields[int(bit.get('index'))] = f
        r['fields'] = fields

        reg_list.append(r)

    return reg_list

def extract_fields(r):
    fields = r['fields']
    flist = []
    f = {}
    for b in reversed(range(8)):
        if fields[b]:
            if 'name' in f:
                if fields[b]['name'] == f['name']:
                    f['last'] = fields[b]['bit']                        
                    f['default'] = (f['default'] << 1) | ((r['defaultVal'] >> b) & 1)
                    f['span'] += 1
                    continue
                flist.append(f)
                f = {}
            f['name'] = fields[b]['name']
            f['default'] = (r['defaultVal'] >> b) & 1
            f['pos'] = b
            if 'bit' in fields[b]:
                f['first'] = f['last'] = fields[b]['bit']
                f['span'] = 1
            else:
                flist.append(f)
                f = {}
        else:
            # missing field, should not happen..
            if 'name' in f:
                flist.append(f)
                f = {}
            else:
                flist.append({'name': '', 'default': (r['defaultVal'] >> b) & 1})
    if 'name' in f:
        flist.append(f)
    return flist

def addRegister(space, addr, name, datatype = None):
    addrobj = toAddr('{}:{:X}'.format(space, addr))
    if addrobj is None:
        # invalid address
        return
    clearListing(addrobj)
    createLabel(addrobj, name, False)
    if datatype is None:
        createByte(addrobj)
    else:
        createData(addrobj, datatype)

def addBit(space, addr, bit, reg_name, bit_name):
    if reg_name == bit_name or bit_name == 'reserved':
        bit_name = bit
    addrobj = toAddr('BITS:{:X}'.format((addr & 0xf8) + bit))
    clearListing(addrobj)    
    createLabel(addrobj, '{}.{}'.format(reg_name, bit_name), False)
    createData(addrobj, ghidra.program.model.data.BooleanDataType())

def setComment(space, addr, comment):
    addrobj = toAddr('{}:{:X}'.format(space, addr))
    if addrobj is None:
        # invalid address
        return
    codeUnit = currentProgram.getListing().getCodeUnitAt(addrobj)
    codeUnit.setComment(codeUnit.PLATE_COMMENT, comment)

def appendComment(space, addr, comment):
    addrobj = toAddr('{}:{:X}'.format(space, addr))
    if addrobj is None:
        # invalid address
        return
    codeUnit = currentProgram.getListing().getCodeUnitAt(addrobj)
    currComment = codeUnit.getComment(codeUnit.PLATE_COMMENT)
    currComment += "\n" + comment
    codeUnit.setComment(codeUnit.PLATE_COMMENT, currComment)

def createEnum(enum_name, enum_list, enum_desc = None):
    dtm = currentProgram.getDataTypeManager()
    cat = dtm.getCategory(ghidra.program.model.data.CategoryPath('/'))
    enum_old = dtm.getDataType(cat.getCategoryPath(), enum_name)
    enum_new = ghidra.program.model.data.EnumDataType(cat.getCategoryPath(), enum_name, 1, dtm)
    if enum_desc:
        enum_new.setDescription(enum_desc)
    for e in enum_list:
        enum_new.add(e['name'], e['value'])
    if enum_old:
        return dtm.replaceDataType(enum_old, enum_new, False)
    else:
        return dtm.addDataType(enum_new, ghidra.program.model.data.DataTypeConflictHandler.DEFAULT_HANDLER)

# check if current program is using 8051 / Si4440
lang = currentProgram.getLanguage().getLanguageDescription()
proc_id = '{}:{}'.format(lang.getProcessor(), lang.getVariant())
print('Current program is {}.'.format(proc_id))

if proc_id != '8051:Si4440':
    if askYesNo('Warning: Processor mismatch', 'WARNING: The processor of this program is \'{}\'. This script was\n\
                 developed for \'8051:Si4440\' and may not work with this program.\n \n \
                 Do you want to continue?'.format(proc_id)) == False:
        print('Import cancelled by user.')
        exit()

try:
    wds_path = askFile(
        'Locate NewWDS.exe to extract metadata from.', 'Go').path
except ghidra.util.exception.CancelledException:
    print('Import cancelled by user.')
    exit()

try:
    wds_file = open(wds_path, 'rb')
    wds_data = wds_file.read()
    print('{} bytes read from {}'.format(len(wds_data), wds_path))
    wds_file.close()
except:
    print('Failed reading {}.'.format(wds_path))
    exit()

xml_src = extract_xml(wds_data, 'SPITools_PRO2')
if xml_src is None:
    print('No data to process.')
    exit()

print('Parsing XML data...')
root = ET.fromstring(xml_src)

parts = set()
for p in root:
    parts.add(p.get('type'))
print('{} parts found, please pick one to import.'.format(len(parts)))
try:
    part = askChoice("Select part", "Select part", sorted(parts), sorted(parts))
except ghidra.util.exception.CancelledException:
    print('Import cancelled by user.')
    exit()

revs = set()
for p in root.findall("./SPIDevice/[@type='{}']".format(part)):
    revs.add(p.get('revision'))
if len(revs) > 1:
    print('{} revisions found, please pick one to import.'.format(len(revs)))
    try:
        rev = askChoice('Select revision', 'Select revision', sorted(revs), sorted(revs))
    except ghidra.util.exception.CancelledException:
        print('Import cancelled by user.')
        exit()
else:
    rev = revs.pop()

print('Importing registers for {} {}...'.format(part, rev))
part_root = root.findall("./SPIDevice/[@type='{}'][@revision='{}']".format(part, rev))[0]
regs = extract_regs(part_root)
print('{} registers found.'.format(len(regs)))

# Create enum for Aconfig register addresses
acfg_list = []
for a in filter(lambda r: r['isAconfig'] == True, regs):
    acfg_list.append( { 'name': a['name'], 'value': a['address'] } )
acfg_addr_dt = createEnum('ACFG_ADDR_ENUM', acfg_list, 'Addresses for Aconfig registers, to be used with SFR:ACFG_ADDR')

for r in regs:
    fenum_list = []
    fcomment = ''
    for f in extract_fields(r):
        if f['name'] != 'reserved':
            if f.get('first') is None:
                fenum_list.append( { 'name': f['name'], 'value': 1 << f['pos'] } )
        if f.get('span'):
            if f['span'] == 1:
                fcomment += '\n{}: {}[{}]'.format(f['pos'], f['name'], f['first'])
            else:
                fcomment += '\n{}-{}: {}[{}:{}]'.format(f['pos'], f['pos'] - f['span'] + 1, f['name'], f['first'], f['last'])
        else:
            fcomment += '\n{}: {}'.format(f['pos'], f['name'])
    if len(fenum_list) > 0:
        fenum_dt = createEnum(r['name'] + '_ENUM', fenum_list)
    else:
        fenum_dt = None

    if r['isSFR'] == True:
        if r['address'] == 0x5494:
            addRegister('SFR', 0x94, r['name'], acfg_addr_dt)
        else:
            addRegister('SFR', r['address'] - 0x5400, r['name'], fenum_dt)
        if r['address'] - 0x5400 in (0xa8, 0xb8, 0xd0, 0xe0, 0xf0):
            for b in range(8):
                addBit('SFR-BITS', r['address'] -0x5400, b, r['name'], r['fields'][b]['name'])
        if fcomment != '':
            setComment('SFR', r['address'] - 0x5400, r['name'] + fcomment)
    elif r['isAconfig'] == True:
        # represented as enum
        pass
    elif r['isXReg'] == True:
        addRegister('RAM', r['address'], r['name'], fenum_dt)
        if fcomment != '':
            setComment('RAM', r['address'], r['name'] + fcomment)
