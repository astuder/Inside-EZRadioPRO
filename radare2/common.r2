# configure r2

echo configuring r2 for Si4x6x rev C2A

e asm.cpu=8051-shared-code-xdata
e cfg.bigendian = true
e asm.sub.jmp=true
# e asm.hint.pos=0

# macro for manual function declaration
# "(fcn start end name,f $2=$0; afu $1 @ $0)"
"(fcn start end name; af+ $0 $2; afb+ $0 $0 $1-$0)"
# setup memory map

echo setting up memory map
aei
omf 4 rwx
ar _idata=_xdata+0x5400
ar _pdata=0x50
aei
om- 3
Cd 1 0x80 @_sfr+0x80
Cd 1 0x100 @_idata
Cd 1 0x100 @_pdata*0x100

# general 8051 

echo annotating 8051 stuff

f sfr.sp 1 @ _sfr+0x81
f sfr.dl 1 @ _sfr+0x82
f sfr.dh 1 @ _sfr+0x83
f sfr.pcon 1 @ _sfr+0x87
f sfr.ie 1 @ _sfr+0xa8
f sfr.ip 1 @ _sfr+0xb8
f sfr.psw 1 @ _sfr+0xd0
f sfr.acc 1 @ _sfr+0xe0
f sfr.b 1 @ _sfr+0xf0

/c clr ie.7 > /dev/null
CCu disable interrupts @@hit*
f-hit*

/c setb ie.7 > /dev/null
CCu enable interrupts @@hit*
f-hit*

/c mov sp > /dev/null
CCu setup stack @@hit*
f-hit*

/c psw.7 > /dev/null
CCu carry @@hit*
f-hit*

echo interrupt vectors

f vect.reset 1 @ 0x0000
f vect.power_up 1 @ 0x0003
f vect.modem 1 @ 0x0007
f vect.debug 1 @ 0x000b
f vect.timer0 1 @ 0x000f
f vect.timer1 1 @ 0x0013
f vect.pa_ramp 1 @ 0x0017
f vect.ph_info 1 @ 0x001b
f vect.command 1 @ 0x001f
f vect.dmawr 1 @ 0x0023
f vect.dmard 1 @ 0x0027
f vect.spi_err 1 @ 0x002b
f vect.ph_err 1 @ 0x002f
f vect.tx_ph_ae 1 @ 0x0033
f vect.rx_ph_af 1 @ 0x0037
f vect.ph_halt 1 @ 0x003b
f vect.wut 1 @ 0x003f
f vect.mctlcmd 1 @ 0x0043

