

# may need to hold 'learn' and send note on message
# amidi -p hw:2,0,0 -S '90 3C 40' -t 1 -r temp.sysex

# to read the current patch
# amidi -p hw:2,0,0 -S 'F0 06 05 30 60 00 F7' -t 2 -r current.sysex

# read all patches in one file
amidi -p hw:2,0,0 -S 'F0 06 05 30 64 00 F7' -t 10 -r prog_all.sysex

# read all patches in turn
# User Group 1
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 00 F7' -t 2 -r prog_00.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 01 F7' -t 2 -r prog_01.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 02 F7' -t 2 -r prog_02.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 03 F7' -t 2 -r prog_03.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 04 F7' -t 2 -r prog_04.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 05 F7' -t 2 -r prog_05.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 06 F7' -t 2 -r prog_06.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 07 F7' -t 2 -r prog_07.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 08 F7' -t 2 -r prog_08.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 09 F7' -t 2 -r prog_09.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 0A F7' -t 2 -r prog_0A.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 0B F7' -t 2 -r prog_0B.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 0C F7' -t 2 -r prog_0C.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 0D F7' -t 2 -r prog_0D.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 0E F7' -t 2 -r prog_0E.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 0F F7' -t 2 -r prog_0F.sysex

# User Group 2
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 10 F7' -t 2 -r prog_10.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 11 F7' -t 2 -r prog_11.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 12 F7' -t 2 -r prog_12.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 13 F7' -t 2 -r prog_13.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 14 F7' -t 2 -r prog_14.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 15 F7' -t 2 -r prog_15.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 16 F7' -t 2 -r prog_16.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 17 F7' -t 2 -r prog_17.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 18 F7' -t 2 -r prog_18.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 19 F7' -t 2 -r prog_19.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 1A F7' -t 2 -r prog_1A.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 1B F7' -t 2 -r prog_1B.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 1C F7' -t 2 -r prog_1C.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 1D F7' -t 2 -r prog_1D.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 1E F7' -t 2 -r prog_1E.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 1F F7' -t 2 -r prog_1F.sysex

# User Group 3
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 20 F7' -t 2 -r prog_20.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 21 F7' -t 2 -r prog_21.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 22 F7' -t 2 -r prog_22.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 23 F7' -t 2 -r prog_23.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 24 F7' -t 2 -r prog_24.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 25 F7' -t 2 -r prog_25.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 26 F7' -t 2 -r prog_26.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 27 F7' -t 2 -r prog_27.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 28 F7' -t 2 -r prog_28.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 29 F7' -t 2 -r prog_29.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 2A F7' -t 2 -r prog_2A.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 2B F7' -t 2 -r prog_2B.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 2C F7' -t 2 -r prog_2C.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 2D F7' -t 2 -r prog_2D.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 2E F7' -t 2 -r prog_2E.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 2F F7' -t 2 -r prog_2F.sysex

# User Group 4
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 30 F7' -t 2 -r prog_30.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 31 F7' -t 2 -r prog_31.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 32 F7' -t 2 -r prog_32.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 33 F7' -t 2 -r prog_33.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 34 F7' -t 2 -r prog_34.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 35 F7' -t 2 -r prog_35.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 36 F7' -t 2 -r prog_36.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 37 F7' -t 2 -r prog_37.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 38 F7' -t 2 -r prog_38.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 39 F7' -t 2 -r prog_39.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 3A F7' -t 2 -r prog_3A.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 3B F7' -t 2 -r prog_3B.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 3C F7' -t 2 -r prog_3C.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 3D F7' -t 2 -r prog_3D.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 3E F7' -t 2 -r prog_3E.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 3F F7' -t 2 -r prog_3F.sysex

# User Group 5
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 40 F7' -t 2 -r prog_40.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 41 F7' -t 2 -r prog_41.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 42 F7' -t 2 -r prog_42.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 43 F7' -t 2 -r prog_43.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 44 F7' -t 2 -r prog_44.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 45 F7' -t 2 -r prog_45.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 46 F7' -t 2 -r prog_46.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 47 F7' -t 2 -r prog_47.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 48 F7' -t 2 -r prog_48.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 49 F7' -t 2 -r prog_49.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 4A F7' -t 2 -r prog_4A.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 4B F7' -t 2 -r prog_4B.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 4C F7' -t 2 -r prog_4C.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 4D F7' -t 2 -r prog_4D.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 4E F7' -t 2 -r prog_4E.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 4F F7' -t 2 -r prog_4F.sysex

# User Group 6
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 50 F7' -t 2 -r prog_50.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 51 F7' -t 2 -r prog_51.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 52 F7' -t 2 -r prog_52.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 53 F7' -t 2 -r prog_53.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 54 F7' -t 2 -r prog_54.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 55 F7' -t 2 -r prog_55.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 56 F7' -t 2 -r prog_56.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 57 F7' -t 2 -r prog_57.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 58 F7' -t 2 -r prog_58.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 59 F7' -t 2 -r prog_59.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 5A F7' -t 2 -r prog_5A.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 5B F7' -t 2 -r prog_5B.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 5C F7' -t 2 -r prog_5C.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 5D F7' -t 2 -r prog_5D.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 5E F7' -t 2 -r prog_5E.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 5F F7' -t 2 -r prog_5F.sysex

# User Group 7
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 60 F7' -t 2 -r prog_60.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 61 F7' -t 2 -r prog_61.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 62 F7' -t 2 -r prog_62.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 63 F7' -t 2 -r prog_63.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 64 F7' -t 2 -r prog_64.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 65 F7' -t 2 -r prog_65.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 66 F7' -t 2 -r prog_66.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 67 F7' -t 2 -r prog_67.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 68 F7' -t 2 -r prog_68.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 69 F7' -t 2 -r prog_69.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 6A F7' -t 2 -r prog_6A.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 6B F7' -t 2 -r prog_6B.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 6C F7' -t 2 -r prog_6C.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 6D F7' -t 2 -r prog_6D.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 6E F7' -t 2 -r prog_6E.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 6F F7' -t 2 -r prog_6F.sysex

# User Group 8
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 70 F7' -t 2 -r prog_70.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 71 F7' -t 2 -r prog_71.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 72 F7' -t 2 -r prog_72.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 73 F7' -t 2 -r prog_73.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 74 F7' -t 2 -r prog_74.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 75 F7' -t 2 -r prog_75.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 76 F7' -t 2 -r prog_76.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 77 F7' -t 2 -r prog_77.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 78 F7' -t 2 -r prog_78.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 79 F7' -t 2 -r prog_79.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 7A F7' -t 2 -r prog_7A.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 7B F7' -t 2 -r prog_7B.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 7C F7' -t 2 -r prog_7C.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 7D F7' -t 2 -r prog_7D.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 7E F7' -t 2 -r prog_7E.sysex
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 7F F7' -t 2 -r prog_7F.sysex

