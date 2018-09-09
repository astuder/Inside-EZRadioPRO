# script to generate r2 references for 8051 code

import r2pipe

def output_xreg_refs(refs):
	for ref in refs:
		addr = ref["data"][2:4]
		offs = ref["offset"]
		if offs < 0x0800 or offs >= 0x8000:
			print("axd xreg_base+0x%s @ %s" % (addr,hex(offs)))

def output_imem_refs(refs):
	for ref in refs:
		addr = ref["data"][2:4]
		offs = ref["offset"]
		if offs < 0x0800 or offs >= 0x8000:
			print("axd _idata+0x%s @ %s" % (addr,hex(offs)))

def output_dsp_refs(refs, dspreg):
	for ref in refs:
		addr = ref["data"][dspreg:dspreg+2]
		offs = ref["offset"]
		if offs < 0x0800 or offs >= 0x8000:
			print("axd dsp_base+0x%s @ %s" % (addr,hex(offs)))

r2 = r2pipe.open("../share/Si4362-C2A-code.bin")

print("# 8051 xreg reads...")

print("# mov r0,addr; movx a,@r0")
output_xreg_refs(r2.cmdj("/xj 78..e2"))

print("# xreg writes...")

print("# mov r0,addr; movx @r0,a")
output_xreg_refs(r2.cmdj("/xj 78..f2"))

print ("# mov r0,addr; op a,imm; movx @r0,a")
output_xreg_refs(r2.cmdj("/xj 78...4..f2"))

print ("# mov r0,addr; op a,dir; movx @r0,a")
output_xreg_refs(r2.cmdj("/xj 78...5..f2"))

print ("# mov r0,addr; mov a,rx; movx @r0,a")
output_xreg_refs(r2.cmdj("/xj 78..e.f2"))

print("# 8051 imem reads...")

print("# mov r0,addr; mov a,@r0")
output_imem_refs(r2.cmdj("/xj 78..e6"))

print("# imem writes...")

print("# mov r0,addr; mov @r0,a")
output_imem_refs(r2.cmdj("/xj 78..f6"))

print("# mov r0,addr; mov @r0,imm")
output_imem_refs(r2.cmdj("/xj 78..76"))

print("# EZRadioPRO dsp writes...")

print("# mov 0x94,imm")
output_dsp_refs(r2.cmdj("/xj 7594.."),4)

print("# mov r7,imm; acall rom.dsp_set_reg_r7_val_r5")
output_dsp_refs(r2.cmdj("/xj 7f..d1cf"),2)

print("# mov r7,imm; ajmp rom.dsp_set_reg_r7_val_r5")
output_dsp_refs(r2.cmdj("/xj 7f..c1cf"),2)

print("# mov r7,imm; lcall rom.dsp_set_reg_r7_val_r5")
output_dsp_refs(r2.cmdj("/xj 7f..128ecf"),2)

print("# mov r7,imm; ljmp rom.dsp_set_reg_r7_val_r5")
output_dsp_refs(r2.cmdj("/xj 7f..028ecf"),2)

print("# mov r7,imm; acall rom.dsp_set_reg_r7_from_cache")
output_dsp_refs(r2.cmdj("/xj 7f..d1e9"),2)

print("# mov r7,imm; ajmp rom.dsp_set_reg_r7_from_cache")
output_dsp_refs(r2.cmdj("/xj 7f..c1e9"),2)

print("# mov r7,imm; lcall rom.dsp_set_reg_r7_from_cache")
output_dsp_refs(r2.cmdj("/xj 7f..1296e9"),2)

print("# mov r7,imm; ljmp rom.dsp_set_reg_r7_from_cache")
output_dsp_refs(r2.cmdj("/xj 7f..0296e9"),2)

print("# mov r7,imm; acall rom.dsp_set_reg_r7_mask_r5_val_r3")
output_dsp_refs(r2.cmdj("/xj 7f..d15b"),2)

print("# mov r7,imm; ajmp rom.dsp_set_reg_r7_mask_r5_val_r3")
output_dsp_refs(r2.cmdj("/xj 7f..c15b"),2)

print("# mov r7,imm; lcall rom.dsp_set_reg_r7_mask_r5_val_r3")
output_dsp_refs(r2.cmdj("/xj 7f..128e5b"),2)

print("# mov r7,imm; ljmp rom.dsp_set_reg_r7_mask_r5_val_r3")
output_dsp_refs(r2.cmdj("/xj 7f..028e5b"),2)

print("# mov r7,imm; lcall map.dsp_reg_r7_unk0xb371")
output_dsp_refs(r2.cmdj("/xj 7f..120150"),2)
