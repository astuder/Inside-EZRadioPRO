# Si4x6x rev C2A/A2A boot firmware

echo .
echo EZRadioPRO Si4x6x-C2A/A2A in bootloader mode
echo .

# includes for analysis shared by boot and all func images

. radare2/common.r2
. radare2/registers-c2a-a2a.r2
. radare2/registers-c2a-a2a-xrefs.r2
. radare2/xdata-c2a-a2a.r2
. radare2/rom-c2a-a2a.r2

# specific to bootloader

# IMEM

echo annotating imem

f var.flags_21 1 @ _idata+0x21
CCu 0:valid image 1:spi cmd done 2:? 3:patch error 4:clr if rom magic is 2 5:? 6:NVRAM multi reads 7:? @ _idata+0x21

f var.cmd_err_status 1 @ _idata+0x22
f var.patch_ptr_msb 1 @ _iadata+0x23
f var.patch_ptr_lsb 1 @ _iadata+0x24
f var.patch_crc_msb 1 @ _idata+0x25
f var.patch_crc_lsb 1 @ _idata+0x26
f var.patch_dest_msb 1 @ _idata+0x27
f var.patch_dest_lsb 1 @ _idata+0x28

f var.cmd_buffer 16 @ _idata+0x2b

f var.nvm_cfg0 1 @ _idata+0x3d
f var.nvm_cfg1 1 @ _idata+0x3e
f var.nvm_cfg2 1 @ _idata+0x3f

f var.nvm_cfg3 1 @ _idata+0x40
f var.nvm_cfg4 1 @ _idata+0x41
f var.patch_len_msb @ _idata+0x42
f var.patch_len_lsb @ _idata+0x43
f var.patch_src_msb @ _idata+0x44
f var.patch_src_lsb @ _idata+0x45
f var.cmd_err_cmd_id 1 @ _idata+0x46
f var.crypto_a_msb 1 @ _idata+0x47
f var.crypto_a_lsb 1 @ _idata+0x48
f var.crypto_b_msb 1 @ _idata+0x49
f var.crypto_b_lsb 1 @ _idata+0x4a
f var.crypto_c_msb 1 @ _idata+0x4b
f var.crypto_c_lsb 1 @ _idata+0x4c
f var.crypto_d_msb 1 @ _idata+0x4d
f var.crypto_d_lsb 1 @ _idata+0x4e
f var.checksum_msb 1 @ _idata+0x4f

f var.checksum_lsb 1 @ _idata+0x50
f var.crypto_e 1 @ _idata+0x51
f var.checksum_src_msb 1 @ _idata+0x52
f var.checksum_src_lsb 1 @ _idata+0x53
f var.checksum_len_msb 1 @ _idata+0x54
f var.checksum_len_lsb 1 @ _idata+0x55

f var.dma_dest_msb 1 @ _idata+0x56
f var.dma_dest_lsb 1 @ _idata+0x57
f var.dma_src_msb 1 @ _idata+0x58
f var.dma_src_lsb 1 @ _idata+0x59
f var.crypto_arg_mask 1 @ _idata+0x5a
f var.crypto_arg_ptr 1 @ _iadata+0x5b
f var.boot_magic0 1 @ _idata+0x5c
f var.boot_magic1 1 @ _idata+0x5d
f var.nvm_cmd_msb 1 @ _idata+0x5e
f var.nvm_cmd_lsb 1 @ _idata+0x5f

f var.nvm_cmd_idx 1 @ _idata+0x60


# CODE

echo annotating code

# run r2 analysis

echo analyzing references

aar 0x560 @0
aar 0x8000 @ 0x8000

echo looking for rogue functions
afl~-\>

s 0x8000
