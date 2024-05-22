# lxp-utils

Manipulate the LXP5 patches,
```
$ python3 lxp5.py -h
Usage: lxp5.py [options] FILENAME

Options:
  -h, --help            show this help message and exit
  -d, --dump            dump configuration to text
  -p PATCH, --patch=PATCH
                        convert to a single patch (1-128)
  -i INDEX, --index=INDEX
                        index of patch in multi (1-128)
  -w, --write           write configuration back to file
```

or the LXP1 patches...
```
$ python3 lxp1.py -d presets/hallb.bin
Container: 
    algorithm = 1
    knob0 = 44032
    knob1 = 34816
    param2 = 49150
    param3 = 28672
    param4 = 45056
    param5 = 47104
    param6 = 32768
    param7 = 45056
    param8 = 32768
    param9 = 32768
    name = b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' (total 16)
    source = ListContainer: 
        0
        0
        0
        0
    destination = ListContainer: 
        255
        255
        255
        255
    scale = ListContainer: 
        0
        0
        0
        0
```
