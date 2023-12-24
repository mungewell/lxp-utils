Unfortunately my LXP-5 had a corrupted memory when purchased, a factory reset
proceedure just 'zero-ed' out the User memories. :-(

After some searching, I found the 'lxp5gl.reg' on Archive.org
https://web.archive.org/web/20010303163508/http://www.lexicon.com/downloads/lxp-5_downloads.asp

This appears to be the factory presets, but in a strange format.

Parsing successful!
$ python3 reg_to_sysex.py

Which will output files ('preset_00.bin', ...) that can be sent direct to the LXP:
$ amidi -p hw:2,0,0 -t 2 -s preset_00.bin

NOTE: These will overwrite the user memories, so only upload the ones you want on the device.
