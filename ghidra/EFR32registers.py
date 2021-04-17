#Maps undocumented radio registers for Silabs EFR32
#
# Silicon Labs does not document peripherals related to the EFR32's radio. Instead
# developers are expected to use RAIL, which consists of an API library BLOB and a
# configurator GUI. But the nice folks at Silabs hid the register map of the missing
# peripherals inside the binary of the RAIL Radio Configurator.
#
# This script adds peripherals to the memory map, creates labels for all registers, 
# and adds comments with location and names of fields within registers.
#
# Before running this script:
# 1. Copy SimplicityStudio/v4/plugins/com.silabs.part.efr32.radio_configurator*.jar
# 2. Rename .jar to .zip and extract files
# 3. Navigate to python folder in extracted archive
# 4. Rename configurator.efr32.jar to .zip and extract files

#@author 
#@category Silabs
#@keybinding 
#@menupath 
#@toolbar 

# Valid part families as of SDK 5.18
part_list = {
	"EFR32xG1": "DUMBO",
	"EFR32xG12": "JUMBO",
	"EFR32xG13": "NERIO",
	"EFR32xG14": "NIXI",
	"EFR32xG21": "PANTHER",
	"EFR32xG22": "LYNX",
	"EFR32xG23": "OCELOT",
	"EFR32xG24": "BOBCAT",
        "EFR32xG25": "SOL"
}

configurator_path = askDirectory(
    "Pick folder where configurator.efr32.jar was extracted", "Go").path

import sys
sys.path.append(configurator_path)
from host_py_rm_studio_internal import RM_Factory

efr32_part = askChoice("Select EFR32 part", "Select part", sorted(part_list.keys()), sorted(part_list.keys())[0])
efr32_family = part_list[efr32_part]

if efr32_part[0:8] == "EFR32xG1":
  efr32_type = 1
  PERIPHERAL_BASE_MASK = 0xfffff000
  PERIPHERAL_SIZE = 0x1000
  BITBAND_OFFSET = 0x02000000
  BITSET_OFFSET = 0x04000000
  BITCLR_OFFSET = 0x06000000
else:
  efr32_type = 2
  PERIPHERAL_BASE_MASK = 0xfffff000
  PERIPHERAL_SIZE = 0x4000
  BITSET_OFFSET = 0x1000
  BITCLR_OFFSET = 0x2000
  BITTGL_OFFSET = 0x3000

print(efr32_type)

memory = currentProgram.memory
listing = currentProgram.getListing()
dtm = currentProgram.getDataTypeManager()
dtuint = ghidra.program.model.data.UnsignedIntegerDataType()

def addMemoryMap(addr, size, name, comment):
  if memory.getRangeContaining(toAddr(addr)) is None:
    t = memory.createUninitializedBlock(name, toAddr(addr), size, False)
    t.setRead(True)
    t.setWrite(True)
    t.setExecute(False)
    t.setVolatile(True)
    t.setComment(comment)

def updateMemoryMap(addr, name):
  base = addr & PERIPHERAL_BASE_MASK
  size = PERIPHERAL_SIZE
  addMemoryMap(base, size, name, "EFR32 peripheral")
  if efr32_type == 1:
    addMemoryMap(base + BITBAND_OFFSET, size, name + "_BAND", "EFR32 peripheral (bit-band)")
    addMemoryMap(base + BITSET_OFFSET, size, name + "_SET", "EFR32 peripheral (set bit)")
    addMemoryMap(base + BITCLR_OFFSET, size, name + "_CLR", "EFR32 peripheral (clr bit)")

def _addRegister(addr, name):
  createLabel(toAddr(addr), name, False)
  createData(toAddr(addr), dtuint)

def addRegister(addr, name):
  _addRegister(addr, name)
  _addRegister(addr + BITSET_OFFSET, name + "_SET")
  _addRegister(addr + BITCLR_OFFSET, name + "_CLR")
  if efr32_type == 1:
    _addRegister(addr + BITBAND_OFFSET, name + "_BAND")
  else:
    _addRegister(addr + BITTGL_OFFSET, name + "_TGL")

def _setComment(addr, comment):
  codeUnit = listing.getCodeUnitAt(toAddr(addr))
  codeUnit.setComment(codeUnit.PLATE_COMMENT, comment)

def setComment(addr, comment):
  _setComment(addr, comment)
  _setComment(addr + BITSET_OFFSET, comment + " (bit set)")
  _setComment(addr + BITCLR_OFFSET, comment + " (bit clear)")
  if efr32_type == 1:
    _setComment(addr + BITBAND_OFFSET, comment + " (bit-band)")
  else:
    _setComment(addr + BITTGL_OFFSET, comment + " (bit toggle)")

def _appendComment(addr, comment):
  codeUnit = listing.getCodeUnitAt(toAddr(addr))
  currComment = codeUnit.getComment(codeUnit.PLATE_COMMENT)
  currComment += "\n" + comment
  codeUnit.setComment(codeUnit.PLATE_COMMENT, currComment)

def appendComment(addr, comment):
  _appendComment(addr, comment)
  _appendComment(addr + BITSET_OFFSET, comment)
  _appendComment(addr + BITCLR_OFFSET, comment)
  if efr32_type == 1:
    _appendComment(addr + BITBAND_OFFSET, comment)
  else:
    _appendComment(addr + BITTGL_OFFSET, comment)

rm = RM_Factory(efr32_family)
device = rm(label="offline_rm")
for pname in device.getPeripheralNames():
  peripheral = device.getObjectByName(pname)
  print("{:08x} {}".format(peripheral.baseAddress, pname))
  updateMemoryMap(peripheral.baseAddress, pname)
  for rname in peripheral.getRegisterNames():
    register = device.getObjectByName(rname)
    print("{:08x} {}".format(register.addressOffset, register.fullname))
    addRegister(peripheral.baseAddress + register.addressOffset, register.fullname)
    # Use comment to document fields as Ghidra field support is not useful yet
    setComment(peripheral.baseAddress + register.addressOffset, register.fullname)
    fields = {}
    for fname in register.getFieldNames():
      field = device.getObjectByName(fname)
      comment = "[{}]\t{}\t<{}>".format(field.getSliceStr(), field.name, field.access)
      fields[field.bitOffset] = comment
    for f in sorted(fields.keys(), reverse=True):
      appendComment(peripheral.baseAddress + register.addressOffset, fields[f])

      
