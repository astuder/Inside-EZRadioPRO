# Si4x6x rev C2A/A2A boot firmware

echo .
echo EZRadioPRO Si4x6x-C2A/A2A in bootloader mode
echo .

# includes for analysis shared by boot and all func images

. radare2/common.r2
. radare2/rom-c2a-a2a.r2
. radare2/registers-c2a-a2a.r2
. radare2/registers-c2a-a2a-xrefs.r2
. radare2/xdata-c2a-a2a.r2

# specific to bootloader

# IMEM

echo annotating imem

f var.frr_a_addr_hi 1 @_idata+0x11
f var.frr_a_addr_lo 1 @_idata+0x12
f var.frr_b_addr_hi 1 @_idata+0x13
f var.frr_b_addr_lo 1 @_idata+0x14
f var.frr_c_addr_hi 1 @_idata+0x15
f var.frr_c_addr_lo 1 @_idata+0x16
f var.frr_d_addr_hi 1 @_idata+0x17
f var.frr_d_addr_lo 1 @_idata+0x18
f var.device_curr_state 1 @_idata+0x1d
f var.device_next_state 1 @_idata+0x1e
f var.main_loop_related 1 @_idata+0x1f
f var.flags_25 @_idata+0x25
CCu 1:low power @_idata+0x25
/c 0x25.1 > /dev/null
CCu low power flag @@hit*
f-hit*

f var.main_loop_ctl 1 @_idata+0x2c
CCu 0:parse cmds 1:? 2:? 3:ctl ex 5:? 6:? 7:?@_idata+0x2c
f var.main_loop_ctl_ex 1 @_idata+0x2d
CCu 0:? 3:? @_idata+0x2d

# CODE

echo annotating code

echo ..vectors

f vect.reset 1 @ 0x0000
f vect.eint0 1 @ 0x0003
f vect.unk_0x07 1 @ 0x0007
f vect.timer0 1 @ 0x000b
f vect.unk_0x0f 1 @ 0x000f
f vect.eint1 1 @ 0x0013
f vect.unk_0x16 1 @ 0x0016
f vect.unk_0x17 1 @ 0x0017
f vect.timer1 1 @ 0x001b
f vect.spi 1 @ 0x001f
f vect.serial 1 @ 0x0023
f vect.unk_0x27 1 @ 0x0027
f vect.timer2 1 @ 0x002b
f vect.unk_0x2f 1 @ 0x002f
f vect.unk_0x33 1 @ 0x0033
f vect.unk_0x37 1 @ 0x0037
f vect.unk_0x3b 1 @ 0x003b
f vect.unk_0x3f 1 @ 0x003f
f vect.unk_0x43 1 @ 0x0043
f vect.unk_0x46 1 @ 0x0046
CCu TX @ 0x0046
f vect.unk_0x4f 1 @ 0x004f
CCu RX @ 0x004f

# run r2 analysis

echo analyzing references

aar 0x560 @0
aar 0x8000 @ 0x8000

echo .
