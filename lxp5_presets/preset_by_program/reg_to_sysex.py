#!usr/bin/python

# Script to process 'lxp5gl.reg' into usable SysEx

# Target sysex looks like this....
#
# 00000000  f0 06 05 10 00 39 01 00  6e 00 00 00 00 00 00 00  |.....9..n.......|
#                             |
#                          ^^ count 0x39 = 57
#                       ^^ program
#                    1^ midi ch
# 00000010  00 00 07 07 17 04 64 05  00 7f 40 7f 62 00 44 61  |......d...@.b.Da|
# 00000020  72 6b 20 43 6c 6f 73 65  74 00 0b 45 00 0c 0f 01  |rk Closet..E....|
# 00000030  44 00 0d 6c 69 45 00 10  13 02 7f 00 7f 00 00 27  |D..liE.........'|
#                                                       | ^^ checksum
# 00000040  f7                                                |.|

from construct import *

Sysex = Struct(
    Const(b"\xf0\x06\x05\x10"),
    "prog" / Default(Byte, 0),
    Const(b"\x39"),
    "data" / Bytes(57),
    "checksum" / Checksum(Byte,
        lambda data: sum(data) & 0x7f,
        this.data,
        ),
    Const(b"\xf7"),
)

Regfile = Struct(
    Padding(0x85),
    Presets= Array(128, Struct(
        "data" / Bytes(57),
    )),
)

# open as a template
f = open("prog_00.bin", "rb")
data = f.read(1000)
f.close
sysex = Sysex.parse(data)

f = open("lxp5gl.reg", "rb")
data = f.read(10000)
regfile = Regfile.parse(data)

# itterate through presets and write each to a file
count = 0 
for preset in regfile["Presets"]:
    name = "preset_" + "{:02x}".format(count) + ".bin"
    f = open(name, "wb")
    sysex["prog"] = count
    count += 1

    sysex["data"] = preset["data"]

    f.write(Sysex.build(sysex))

