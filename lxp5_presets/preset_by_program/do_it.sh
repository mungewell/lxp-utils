

# may need to hold 'learn' and send note on message
# amidi -p hw:2,0,0 -S '90 3C 40' -t 1 -r temp.bin

# to read the current patch
# amidi -p hw:2,0,0 -S 'F0 06 05 30 60 00 F7' -t 2 -r current.bin

# read all patches in one file
amidi -p hw:2,0,0 -S 'F0 06 05 30 64 00 F7' -t 10 -r prog_all.bin

# read all patches in turn
# User Group 1
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 00 F7' -t 2 -r prog_00.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 01 F7' -t 2 -r prog_01.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 02 F7' -t 2 -r prog_02.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 03 F7' -t 2 -r prog_03.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 04 F7' -t 2 -r prog_04.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 05 F7' -t 2 -r prog_05.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 06 F7' -t 2 -r prog_06.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 07 F7' -t 2 -r prog_07.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 08 F7' -t 2 -r prog_08.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 09 F7' -t 2 -r prog_09.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 0A F7' -t 2 -r prog_0A.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 0B F7' -t 2 -r prog_0B.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 0C F7' -t 2 -r prog_0C.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 0D F7' -t 2 -r prog_0D.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 0E F7' -t 2 -r prog_0E.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 0F F7' -t 2 -r prog_0F.bin

# User Group 2
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 10 F7' -t 2 -r prog_10.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 11 F7' -t 2 -r prog_11.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 12 F7' -t 2 -r prog_12.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 13 F7' -t 2 -r prog_13.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 14 F7' -t 2 -r prog_14.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 15 F7' -t 2 -r prog_15.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 16 F7' -t 2 -r prog_16.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 17 F7' -t 2 -r prog_17.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 18 F7' -t 2 -r prog_18.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 19 F7' -t 2 -r prog_19.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 1A F7' -t 2 -r prog_1A.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 1B F7' -t 2 -r prog_1B.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 1C F7' -t 2 -r prog_1C.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 1D F7' -t 2 -r prog_1D.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 1E F7' -t 2 -r prog_1E.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 1F F7' -t 2 -r prog_1F.bin

# User Group 3
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 20 F7' -t 2 -r prog_20.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 21 F7' -t 2 -r prog_21.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 22 F7' -t 2 -r prog_22.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 23 F7' -t 2 -r prog_23.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 24 F7' -t 2 -r prog_24.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 25 F7' -t 2 -r prog_25.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 26 F7' -t 2 -r prog_26.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 27 F7' -t 2 -r prog_27.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 28 F7' -t 2 -r prog_28.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 29 F7' -t 2 -r prog_29.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 2A F7' -t 2 -r prog_2A.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 2B F7' -t 2 -r prog_2B.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 2C F7' -t 2 -r prog_2C.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 2D F7' -t 2 -r prog_2D.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 2E F7' -t 2 -r prog_2E.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 2F F7' -t 2 -r prog_2F.bin

# User Group 4
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 30 F7' -t 2 -r prog_30.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 31 F7' -t 2 -r prog_31.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 32 F7' -t 2 -r prog_32.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 33 F7' -t 2 -r prog_33.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 34 F7' -t 2 -r prog_34.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 35 F7' -t 2 -r prog_35.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 36 F7' -t 2 -r prog_36.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 37 F7' -t 2 -r prog_37.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 38 F7' -t 2 -r prog_38.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 39 F7' -t 2 -r prog_39.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 3A F7' -t 2 -r prog_3A.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 3B F7' -t 2 -r prog_3B.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 3C F7' -t 2 -r prog_3C.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 3D F7' -t 2 -r prog_3D.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 3E F7' -t 2 -r prog_3E.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 3F F7' -t 2 -r prog_3F.bin

# User Group 5
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 40 F7' -t 2 -r prog_40.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 41 F7' -t 2 -r prog_41.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 42 F7' -t 2 -r prog_42.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 43 F7' -t 2 -r prog_43.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 44 F7' -t 2 -r prog_44.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 45 F7' -t 2 -r prog_45.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 46 F7' -t 2 -r prog_46.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 47 F7' -t 2 -r prog_47.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 48 F7' -t 2 -r prog_48.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 49 F7' -t 2 -r prog_49.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 4A F7' -t 2 -r prog_4A.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 4B F7' -t 2 -r prog_4B.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 4C F7' -t 2 -r prog_4C.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 4D F7' -t 2 -r prog_4D.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 4E F7' -t 2 -r prog_4E.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 4F F7' -t 2 -r prog_4F.bin

# User Group 6
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 50 F7' -t 2 -r prog_50.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 51 F7' -t 2 -r prog_51.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 52 F7' -t 2 -r prog_52.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 53 F7' -t 2 -r prog_53.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 54 F7' -t 2 -r prog_54.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 55 F7' -t 2 -r prog_55.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 56 F7' -t 2 -r prog_56.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 57 F7' -t 2 -r prog_57.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 58 F7' -t 2 -r prog_58.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 59 F7' -t 2 -r prog_59.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 5A F7' -t 2 -r prog_5A.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 5B F7' -t 2 -r prog_5B.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 5C F7' -t 2 -r prog_5C.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 5D F7' -t 2 -r prog_5D.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 5E F7' -t 2 -r prog_5E.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 5F F7' -t 2 -r prog_5F.bin

# User Group 7
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 60 F7' -t 2 -r prog_60.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 61 F7' -t 2 -r prog_61.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 62 F7' -t 2 -r prog_62.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 63 F7' -t 2 -r prog_63.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 64 F7' -t 2 -r prog_64.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 65 F7' -t 2 -r prog_65.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 66 F7' -t 2 -r prog_66.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 67 F7' -t 2 -r prog_67.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 68 F7' -t 2 -r prog_68.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 69 F7' -t 2 -r prog_69.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 6A F7' -t 2 -r prog_6A.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 6B F7' -t 2 -r prog_6B.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 6C F7' -t 2 -r prog_6C.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 6D F7' -t 2 -r prog_6D.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 6E F7' -t 2 -r prog_6E.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 6F F7' -t 2 -r prog_6F.bin

# User Group 8
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 70 F7' -t 2 -r prog_70.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 71 F7' -t 2 -r prog_71.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 72 F7' -t 2 -r prog_72.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 73 F7' -t 2 -r prog_73.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 74 F7' -t 2 -r prog_74.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 75 F7' -t 2 -r prog_75.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 76 F7' -t 2 -r prog_76.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 77 F7' -t 2 -r prog_77.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 78 F7' -t 2 -r prog_78.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 79 F7' -t 2 -r prog_79.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 7A F7' -t 2 -r prog_7A.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 7B F7' -t 2 -r prog_7B.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 7C F7' -t 2 -r prog_7C.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 7D F7' -t 2 -r prog_7D.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 7E F7' -t 2 -r prog_7E.bin
amidi -p hw:2,0,0 -S 'F0 06 05 30 61 7F F7' -t 2 -r prog_7F.bin

