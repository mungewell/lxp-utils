#!/usr/bin/python
#
# Script decode/encode SysEx from/for Lexicon LXP-1
# (c) Simon Wood, 11th July 2020

# Defines SysEx format using Construct (v2.9)
# https://github.com/construct/construct

from construct import *

# Midi is 7bit stuffed - convert each bytes (max 0x7F)
class Midi2u(Adapter):
    def _decode(self, obj, context, path):
        return((obj & 0x7f) + ((obj & 0x7f00) >> 1))
    def _encode(self, obj, context, path):
        return((obj & 0x7f) + ((obj & 0x3f80) << 1))

ShortPacked = Struct(
    "packed_length" / Byte,
    "packed_data" / Bytes(this.packed_length),

    "packed_checksum" / Checksum(Byte,
        lambda data: sum(data) & 0x7f,
        this.packed_data
        ),
)

LongPacked = Struct(
    "packed_length" / Midi2u(Short),
    "packed_data" / Bytes(this.packed_length),

    "packed_checksum" / Checksum(Byte,
        lambda data: sum(data) & 0x7f,
        this.packed_data
        ),
)

LXP1 = Struct(
    Const(b"\xf0"),
    Const(b"\x06\x02"),
    "midi" / BitStruct(
        "type" / Default(BitsInteger(4), 0),
        "channel" / Default(BitsInteger(4), 0),
    ),

    "data" / Switch(this.midi.type, 
    {
        0 : "current" / Struct(
            Embedded(ShortPacked),
        ),
        1 : "register" / Struct(
            "Register" / Byte,
            Embedded(ShortPacked),
        ),
        4 : "allregs" / Struct(
            Embedded(LongPacked),
        ),
    }),

    Const(b"\xf7"),
)

#--------------------------------------------------
# Class/Functions for processing Lexicon SysEx

class lxp1(object):
    # Parameter defines: (type, steps, min, max)
    # values are scaled:
    # UNIDIR - min->0x8000    max->0xBFFF
    # BIDIR - neg max->0x4000 neg min->0x7FFF
    #         pos min->0x8000 pos max->0xBFFF
    # BIONE - min->0x4000     1->0x7FFF
    #         1->0x8000       max->0xBFFF

    class Paramtype(Enum):
        UNIDIR = 1
        BIDIR = 2
        BIONE = 3

    ReverbTime = (Paramtype.UNIDIR, 16, 0.6, 9.0)
    PreDelay = (Paramtype.UNIDIR, 8192, 0, 262.0)
    FxLevel = (Paramtype.UNIDIR, 256, 0, 100)
    BassMult = (Paramtype.BIONE, 32, 0.3, 2.5)
    HiFreqCut = (Paramtype.UNIDIR, 16, 321, 13800)
    Size = (Paramtype.UNIDIR, 16, 8, 71)
    PreDlyFb = (Paramtype.BIDIR, 512, 0, 99)
    Diffusion = (Paramtype.UNIDIR, 256, 0, 100)

    NegFB = (Paramtype.UNIDIR, 256, 0, 99)
    Depth = (Paramtype.UNIDIR, 256, 0.25, 8)
    RightFB = (Paramtype.BIDIR, 512, 0, 99)
    RightDly = (Paramtype.UNIDIR, 128, 0, 1)
    Shape = (Paramtype.UNIDIR, 8, 0, 7)
    LeftFB = (Paramtype.BIDIR, 512, 0, 99)
    LeftDly = (Paramtype.UNIDIR, 128, 0, 1)
    Depth = (Paramtype.UNIDIR, 256, 0.25, 8)
    Rate = (Paramtype.BIONE, 32, 0, 15)

    PosFB = (Paramtype.UNIDIR, 256, 0, 99)
    GangDly = (Paramtype.UNIDIR, 256, 0, 99)

    def param_decode(self, value, name):
        (ptype, steps, minimum, maximum) = getattr(self, name)

        if ptype == self.Paramtype.BIONE:
            scale = (maximum - 1) / (0xBFFF - 0x8000)
            scale2 = (1 - minimum) / (0x7FFF - 0x4000)

            if value >= 0x8000:
                return(1 + (scale * (value - 0x8000)))
            else:
                return(minimum + (scale2 * (value - 0x4000)))

        scale = (maximum - minimum) / (0xBFFF - 0x8000)
        if value >= 0x8000:
            return(minimum + (scale * (value - 0x8000)))
        else:
            return((maximum * -1) + (scale * (value - 0x4000)))

    def param_encode(self, value, name):
        (ptype, steps, minimum, maximum) = getattr(self, name)

        if ptype == self.Paramtype.BIONE:
            scale = (maximum - 1) / (0xBFFF - 0x8000)
            scale2 = (1 - minimum) / (0x7FFF - 0x4000)

            if value >= 1:
                return(int(0x8000 + ((value - 1) / scale)))
            else:
                return(int(0x4000 + ((value - minimum) / scale2)))

        scale = (maximum - minimum) / (0xBFFF - 0x8000)
        if value >= minimum:
            return(int(0x8000 + ((value - minimum) / scale)))
        else:
            return(int(0x4000 + ((value + maximum) / scale)))

    def pack(self, data):
        # Pack 8bit data into 7bit, MSB's in first byte followed
        # by 7 bytes (bits 6..0).
        packet = bytearray(b"")
        encode = bytearray(b"\x00")

        for byte in data:
            encode[0] = encode[0] + ((byte & 0x80) >> (8-len(encode)))
            encode.append(byte & 0x7f)

            if len(encode) > 7:
                packet = packet + encode
                encode = bytearray(b"\x00")

        # don't forget to add last few bytes
        if len(encode) > 1:
            packet = packet + encode

        return(bytes(packet))

    def unpack(self, packet):
        # Unpack data 7bit to 8bit, MSBs in first byte
        data = bytearray(b"")
        loop = 7
        hibits = 0

        for byte in packet:
            if loop != 7:
                if (hibits & (2**loop)):
                    data.append(128 + byte)
                else:
                    data.append(byte)
                loop = loop + 1
            else:
                hibits = byte
                # do we need to acount for short sets (at end of block block)?
                loop = 0

        return(data)

#--------------------------------------------------
# Registers can be decoded _after_ they are unpacked
#

class Param(Adapter):
    def __init__(self, subcon, name):
        super(Param, self).__init__(subcon)
        self.name = name
    def _decode(self, obj, context, path):
        return lxp1().param_decode(obj, self.name)
    def _encode(self, obj, context, path):
        return lxp1().param_encode(obj, self.name)

RegCommon = Struct(
    "name" / Bytes(16), #PaddedString(16, "ascii"),     # this can be 0xFF in unset presets

    "source" / Array(4, Byte),
    "destination" / Array(4, Byte),
    "scale" / Array(4, Byte),
)

Algo1 = Struct(
    Const(b'\x01'),
    "ReverbTime" / Param(Int16ul, "ReverbTime"),
    "PreDelay" / Param(Int16ul, "PreDelay"),
    "FxLevel" / Param(Int16ul, "FxLevel"),
    "BassMult" / Param(Int16ul, "BassMult"),
    "HiFreqCut" / Param(Int16ul, "HiFreqCut"),
    "Size" / Param(Int16ul, "Size"),
    "PreDlyFb" / Param(Int16ul, "PreDlyFb"),
    "Diffusion" / Param(Int16ul, "Diffusion"),

    "param8" / Int16ul,
    "param9" / Int16ul,

    Embedded(RegCommon),
)
Algo2 = Struct(
    Const(b'\x02'),
    "ReverbTime" / Param(Int16ul, "ReverbTime"),
    "PreDelay" / Param(Int16ul, "PreDelay"),
    "FxLevel" / Param(Int16ul, "FxLevel"),
    "BassMult" / Param(Int16ul, "BassMult"),
    "HiFreqCut" / Param(Int16ul, "HiFreqCut"),
    "Size" / Param(Int16ul, "Size"),
    "PreDlyFb" / Param(Int16ul, "PreDlyFb"),
    "Diffusion" / Param(Int16ul, "Diffusion"),

    "param8" / Int16ul,
    "param9" / Int16ul,

    Embedded(RegCommon),
)
Algo3 = Struct(
    Const(b'\x03'),
    "NegFB" / Param(Int16ul, "NegFB"),
    "Depth" / Param(Int16ul, "Depth"),
    "FxLevel" / Param(Int16ul, "FxLevel"),
    "RightFB" / Param(Int16ul, "RightFB"),
    "RigthDly" / Param(Int16ul, "RightDly"),
    "Shape" / Param(Int16ul, "Shape"),
    "LeftFB" / Param(Int16ul, "LeftFB"),
    "LeftDly" / Param(Int16ul, "LeftDly"),
    "Rate" / Param(Int16ul, "Rate"),

    "param9" / Int16ul,

    Embedded(RegCommon),
)
Algo4 = Struct(
    Const(b'\x04'),
    "PosFB" / Param(Int16ul, "PosFB"),
    "GangDly" / Param(Int16ul, "GangDly"),
    "FxLevel" / Param(Int16ul, "FxLevel"),
    "RightFB" / Param(Int16ul, "RightFB"),      # Used for both L/R?
    "LeftDly" / Param(Int16ul, "LeftDly"),
    "RightDly" / Param(Int16ul, "RightDly"),
    "LeftFB" / Param(Int16ul, "LeftFB"),        # Unused?
    "HiFreqCut" / Param(Int16ul, "HiFreqCut"),
    "Diffusion" / Param(Int16ul, "Diffusion"),

    "param9" / Int16ul,

    Embedded(RegCommon),
)

Register = Struct(
    "algorithm" / Byte,

    "knob0" / Int16ul,
    "knob1" / Int16ul,

    "param2" / Int16ul,
    "param3" / Int16ul,
    "param4" / Int16ul,
    "param5" / Int16ul,
    "param6" / Int16ul,
    "param7" / Int16ul,
    "param8" / Int16ul,
    "param9" / Int16ul,

    Embedded(RegCommon),
)

Registers = Struct(
    "registers" / Array(128, Register),
)

#--------------------------------------------------
# Simple command line implementation

from optparse import OptionParser

def main():
    usage = "usage: %prog [options] FILENAME"
    parser = OptionParser(usage)

    parser.add_option("-v", "--verbose",
        action="store_true", dest="verbose")
    parser.add_option("-d", "--dump",
        help="dump configuration to text",
        action="store_true", dest="dump")
    parser.add_option("-w", "--write",
        help="write configuration back to file",
        action="store_true", dest="write")
    parser.add_option("-r", "--reg",
        help="specify destination REG",
        dest="reg")

    (options, args) = parser.parse_args()

    if len(args) != 1:
        parser.error("input FILE not specified")
        quit(0)

    if options.verbose:
        print("Reading %s..." % args[0])

    binfile = open(args[0], "rb")
    if not binfile:
        print("Unable to open file")
        quit(0)

    if binfile:
        bindata = binfile.read()
        binfile.close()

    config = LXP1.parse(bindata)

    if options.verbose:
        print(config)

    if options.dump:
        midi_type = config['midi']['type']
    
        reverb = lxp1()
        block = reverb.unpack(config['data']['packed_data'])

        if midi_type == 0 or midi_type == 1:
            regs = Register.parse(block)

            if regs['algorithm'] == 4:
                regs = Algo4.parse(block)
                print(regs)
                '''
                # Example: Modify some parameters and rebuild
                regs['RightFB'] = 0
                regs['LeftDly'] = 0
                regs['RightDly'] = 0
                regs['Diffusion'] = 0
                block = Algo4.build(regs)
                config['data']['packed_data'] = reverb.pack(block)
                '''
            else:
                print(regs)

        if midi_type == 4:
            print(Registers.parse(block))
    
    if options.write:
        print(config)
        if options.reg:
            if config['midi']['type'] == 0:
               # switch 'current' to 'register' mode
               config['midi']['type'] = 1
               config['data'].update({"Register":int(options.reg)})
            else:
               config['data']['Register'] = int(options.reg)


        binfile = open(args[0], "wb")
        if not binfile:
            print("Unable to open file for writing")
            quit(0)

        if binfile:
            binfile.write(LXP1.build(config))
            binfile.close()

if __name__ == "__main__":
    main()

