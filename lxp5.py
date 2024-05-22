#!/usr/bin/python
#
# Script decode/encode SysEx from/for Lexicon LXP-5
# (c) Simon Wood, 19th May 2024

# Defines SysEx format using Construct (v2.10)
# https://github.com/construct/construct

from construct import *
import sys

# Midi is 7bit stuffed - convert each bytes (max 0x7F)
class Midi2u(Adapter):
    def _decode(self, obj, context, path):
        return((obj & 0x7f) + ((obj & 0x7f00) >> 1))
    def _encode(self, obj, context, path):
        return((obj & 0x7f) + ((obj & 0x3f80) << 1))

Algo = Struct(
    "algo" / Enum(Byte,
        delay_reverb = 1,
        pitch_delay = 2,
        bypass = 3,
        ),
    )

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

Knobs = Struct(
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

Current = Struct(
    "algo" / Algo,
    "microcode" / Microcode,

    "knobs" / Knobs,

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
)

Single = Struct(
    "algo" / Algo,
    "microcode" / Microcode,
    "name" / PaddedString(11, "ascii"),
    "reserved" / Byte,
    "knob_dest" / Byte,
    "patches" / Array(4, Patch),
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
            "packed_length" / Byte,             # expect 0x5e
            "packed_data" / Peek(Bytes(this.packed_length)),
            "data" / Current,
            "packed_checksum" / Checksum(Byte,
                lambda data: sum(data) & 0x7f,
                this.packed_data
                ),
        ),
        1 : "single" / Struct(
            "register" / Byte,
            "packed_length" / Byte,             # expect 0x39
            "packed_data" / Peek(Bytes(this.packed_length)),
            "data" / Single,
            "packed_checksum" / Checksum(Byte,
                lambda data: sum(data) & 0x7f,
                this.packed_data
                ),
        ),
        4 : "allregs" / Struct(
            "packed_length" / Midi2u(Short),    # expected 0x3900 in 7-bit = 7296 bytes
            "packed_data" / Peek(Bytes(this.packed_length)),

            "array" / Array(128, Single),
            "packed_checksum" / Checksum(Byte,
                lambda data: sum(data) & 0x7f,
                this.packed_data
                ),
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
    parser.add_option("-p", "--patch",
        help="convert to a single patch (1-128)",
        type=int, default=0, dest="patch")
    parser.add_option("-i", "--index",
        help="index of patch in multi (1-128)",
        type=int, default=0, dest="index")
    parser.add_option("-w", "--write",
        help="write configuration back to file",
        action="store_true", dest="write")

    (options, args) = parser.parse_args()

    if len(args) != 1:
        parser.error("input FILE not specified")
        quit(0)

    binfile = open(args[0], "rb")
    if not binfile:
        sys.exit("Unable to open file")

    if binfile:
        bindata = binfile.read()
        binfile.close()

    config = LXP5.parse(bindata)

    if options.dump:
        print(config)

    if options.write:
        if config['midi']['type'] == 0:
            # processing 'current'
            if not options.patch:
                sys.exit("Must specify '--patch'")

            config['midi']['type'] = 1
            config['blob']['packed_data'] = Single.build(config['blob']['data'])
            config['blob']['packed_length'] = len(config['blob']['packed_data'])

        if config['midi']['type'] == 4:
            # processing 'all regs'
            if not options.patch:
                sys.exit("Must specify '--patch'")
            if not options.index:
                sys.exit("Must specify '--index'")

            config['midi']['type'] = 1
            config['blob']['data'] = config['blob']['array'][options.index-1]
            config['blob']['packed_data'] = Single.build(config['blob']['data'])
            config['blob']['packed_length'] = len(config['blob']['packed_data'])

        # overwrite register/patch number
        if options.patch:
            config['blob']['register'] = options.patch - 1

        binfile = open(args[0], "wb")
        if not binfile:
            sys.exit("Unable to open file for writing")

        if binfile:
            # assume the settings are changed, need to repack
            binfile.write(LXP5.build(config))

            binfile.close()

if __name__ == "__main__":
    main()

