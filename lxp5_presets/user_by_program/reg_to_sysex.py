#!usr/bin/python

# Script to process 'lxp5gl.reg' into usable SysEx

# Target sysex looks like this....
#
# 00000000  f0 06 05 10 00 39 01 00  6e 00 00 00 00 00 00 00  |.....9..n.......|
#                             |<--- block of 57 bytes
#                          ^^ count 0x39 = 57
#                       ^^ program
#                    1^ midi ch
# 00000010  00 00 07 07 17 04 64 05  00 7f 40 7f 62 00 44 61  |......d...@.b.Da|
# 00000020  72 6b 20 43 6c 6f 73 65  74 00 0b 45 00 0c 0f 01  |rk Closet..E....|
# 00000030  44 00 0d 6c 69 45 00 10  13 02 7f 00 7f 00 00 27  |D..liE.........'|
#                                                   --->| ^^ checksum
# 00000040  f7                                                |.|

#--------------------------------------------------
# Define file format(s) using Construct (v2.9)
# requires:
# https://github.com/construct/construct

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

# start with a template
data = \
    b"\xf0\x06\x05\x10\x00\x39\x01\x00\x6e\x00\x00\x00\x00\x00\x00\x00" + \
    b"\x00\x00\x07\x07\x17\x04\x64\x05\x00\x7f\x40\x7f\x62\x00\x44\x61" + \
    b"\x72\x6b\x20\x43\x6c\x6f\x73\x65\x74\x00\x0b\x45\x00\x0c\x0f\x01" + \
    b"\x44\x00\x0d\x6c\x69\x45\x00\x10\x13\x02\x7f\x00\x7f\x00\x00\x27" + \
    b"\xf7"
sysex = Sysex.parse(data)

# load and parse...
f = open("lxp5gl.reg", "rb")
data = f.read(10000)
f.close()
regfile = Regfile.parse(data)

# itterate through presets
count = 0 
for preset in regfile["Presets"]:
    name = "preset_" + "{:02x}".format(count) + ".sysex"
    f = open(name, "wb")

    # sequentially save as different programs
    sysex["prog"] = count
    count += 1

    sysex["data"] = preset["data"]

    # write each to a file
    f.write(Sysex.build(sysex))
    f.close()
