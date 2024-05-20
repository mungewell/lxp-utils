#!/usr/bin/python
#
# Script decode/encode SysEx from/for Lexicon LXP-5
# (c) Simon Wood, 19th May 2024

# Defines SysEx format using Construct (v2.10)
# https://github.com/construct/construct

from construct import *

# Midi is 7bit stuffed - convert each bytes (max 0x7F)
class Midi2u(Adapter):
    def _decode(self, obj, context, path):
        return((obj & 0x7f) + ((obj & 0x7f00) >> 1))
    def _encode(self, obj, context, path):
        return((obj & 0x7f) + ((obj & 0x3f80) << 1))

Microcode = Struct(
    "Delay_1_Coarse" / Byte,
    "Delay_1_Fine" / Byte,
    "Feedback_1" / Byte,
    "Delay_2_Coarse" / Byte,
    "Delay_2_Fine" / Byte,
    "Feedback_2" / Byte,
    "Delay_3_Coarse" / Byte,
    "Delay_3_Fine" / Byte,
    "Pitch_Base/Select" / Byte,
    "Pitch_Interval" / Byte,
    "Pitch_Adjust" / Byte,
    "Decay_Time" / Byte,
    "Treble_Decay" / Byte,
    "Bass_Multiply" / Byte,
    "Size" / Byte,
    "Diffusion" / Byte,
    "High_Cut_Filter" / Byte,
    "Low_Cut_Filter" / Byte,
    "Reverb_Balance" / Byte,
    "Output_Balance" / Byte,
    "Output_Level" / Byte,
    "Input_Level" / Byte,
    "LFO_Rate" / Byte,
    )

Algo = Struct(
    "algo" / Enum(Byte,
        delay_reverb = 1,
        pitch_delay = 2,
        bypass = 3,
        ),
    )

Knob = Struct(
    "Delay_0_Coarse_Edit_Knob" / Byte,
    "Delay_0_Fine_Edit_Knob" / Byte,
    "Reserved_0" / Byte,
    "Delay_1_Coarse_Edit_Knob" / Byte,
    "Delay_1_Fine_Edit_Knob" / Byte,
    "Reserved_1" / Byte,
    "Delay_2_Coarse_Edit_Knob" / Byte,
    "Delay_2_Fine_Edit_Knob" / Byte,
    )

Patch = Struct(
    "source" / Byte,
    "thres" / Byte,
    "dest" / Byte,
    "scale" / Byte,
    "offset" / Byte,
    )

CurrentPacked = Struct(
    "packed_length" / Byte,        # expect 0x5e
    "packed_data" / Peek(Bytes(this.packed_length)),

    "algo" / Algo,
    "microcode" / Microcode,
    "knobs" / Knob,

    "name" / PaddedString(11, "ascii"),
    "reserved" / Byte,
    "knob_dest" / Byte,
    "patches" / Array(4, Patch),

    "register" / Byte,
    "preset" / Byte,
    "algo_2" / Algo,
    "footswitch" / Byte,
    "write_protect" / Byte,
    "global_patch_en" / Byte,
    "global_patches" / Bytes(23),

    "packed_checksum" / Checksum(Byte,
        lambda data: sum(data) & 0x7f,
        this.packed_data
        ),
)

SinglePacked = Struct(
    "packed_length" / Byte,        # expect 0x39
    "packed_data" / Peek(Bytes(this.packed_length)),

    "algo" / Algo,
    "microcode" / Microcode,
    "name" / PaddedString(11, "ascii"),
    "reserved" / Byte,
    "knob_dest" / Byte,
    "patches" / Array(4, Patch),

    "packed_checksum" / Checksum(Byte,
        lambda data: sum(data) & 0x7f,
        this.packed_data
        ),
)

MultiPacked = Struct(
    "packed_length" / Midi2u(Short),    # expected 0x3900 in 7-bit = 7296 bytes
    "packed_data" / Bytes(this.packed_length),

    "packed_checksum" / Checksum(Byte,
        lambda data: sum(data) & 0x7f,
        this.packed_data
        ),
)

LXP5 = Struct(
    Const(b"\xf0"),
    Const(b"\x06\x05"),
    "midi" / BitStruct(
        "type" / Default(BitsInteger(4), 0),
        "channel" / Default(BitsInteger(4), 0),
    ),

    "blob" / Switch(this.midi.type,
    {
        0 : "current" / Struct(
            "data" / CurrentPacked,
        ),
        1 : "register" / Struct(
            "Register" / Byte,
            "data" / SinglePacked,
        ),
        4 : "allregs" / Struct(
            "data" / MultiPacked,
        ),
    }),

    Const(b"\xf7"),
)


#--------------------------------------------------
# Simple command line implementation

from optparse import OptionParser

def main():
    usage = "usage: %prog [options] FILENAME"
    parser = OptionParser(usage)

    parser.add_option("-d", "--dump",
        help="dump configuration to text",
        action="store_true", dest="dump")
    parser.add_option("-w", "--write",
        help="write configuration back to file",
        action="store_true", dest="write")

    (options, args) = parser.parse_args()

    if len(args) != 1:
        parser.error("input FILE not specified")
        quit(0)

    binfile = open(args[0], "rb")
    if not binfile:
        print("Unable to open file")
        quit(0)

    if binfile:
        bindata = binfile.read()
        binfile.close()

    config = LXP5.parse(bindata)

    if options.dump:
        print(config)

    if options.write:
        # assume the settings are changed, need to repack

        binfile = open(args[0], "wb")
        if not binfile:
            print("Unable to open file for writing")
            quit(0)

        if binfile:
            binfile.write(LXP5.build(config))
            binfile.close()

if __name__ == "__main__":
    main()

