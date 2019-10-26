/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of nfit.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [NFIT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "NFIT"    [NVDIMM Firmware Interface Table]
[004h 0004   4]                 Table Length : 00000180
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 2D
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "Template"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   4]                     Reserved : 00000000

[028h 0040   2]                Subtable Type : 0000 [System Physical Address Range]
[02Ah 0042   2]                       Length : 0038

[02Ch 0044   2]                  Range Index : 0001
[02Eh 0046   2]        Flags (decoded below) : 0000
                   Add/Online Operation Only : 0
                      Proximity Domain Valid : 0
[030h 0048   4]                     Reserved : 00000000
[034h 0052   4]             Proximity Domain : 00000000
[038h 0056  16]             Region Type GUID : 91AF0530-5D86-470E-A6B0-0A2DB9408249
[048h 0072   8]           Address Range Base : 000000037C000000
[050h 0080   8]         Address Range Length : 000000000C000000
[058h 0088   8]         Memory Map Attribute : 0000000000000008

[060h 0096   2]                Subtable Type : 0001 [Memory Range Map]
[062h 0098   2]                       Length : 0030

[064h 0100   4]                Device Handle : 00000001
[068h 0104   2]                  Physical Id : 0004
[06Ah 0106   2]                    Region Id : 0000
[06Ch 0108   2]                  Range Index : 0001
[06Eh 0110   2]         Control Region Index : 0001
[070h 0112   8]                  Region Size : 0000000004000000
[078h 0120   8]                Region Offset : 0000000000000000
[080h 0128   8]          Address Region Base : 0000000008000000
[088h 0136   2]             Interleave Index : 0001
[08Ah 0138   2]              Interleave Ways : 0003
[08Ch 0140   2]                        Flags : 002A
                       Save to device failed : 0
                  Restore from device failed : 1
                       Platform flush failed : 0
                            Device not armed : 1
                      Health events observed : 0
                       Health events enabled : 1
                              Mapping failed : 0
[08Eh 0142   2]                     Reserved : 0000

[090h 0144   2]                Subtable Type : 0002 [Interleave Info]
[092h 0146   2]                       Length : 0020

[094h 0148   2]             Interleave Index : 0001
[096h 0150   2]                     Reserved : 0000
[098h 0152   4]                   Line Count : 00000004
[09Ch 0156   4]                    Line Size : 00000100
[0A4h 0164   4]                  Line Offset : 00000000
[0A8h 0168   4]                  Line Offset : 00000003
[0ACh 0172   4]                  Line Offset : 00000006
[0B0h 0176   4]                  Line Offset : 00000009

[0B0h 0176   2]                Subtable Type : 0003 [SMBIOS Information]
[0B2h 0178   2]                       Length : 0028

[0B4h 0180   4]                     Reserved : 00000000
[008h 0008  32]         SMBIOS Table Entries : \
    B4 13 5D 40 91 0B 29 93 67 E8 23 4C 00 00 00 88 \
    00 11 22 33 44 55 66 77 88 99 AA BB CC DD EE FF 

[0D8h 0216   2]                Subtable Type : 0004 [NVDIMM Control Region]
[0DAh 0218   2]                       Length : 0050

[0DCh 0220   2]                 Region Index : 0001
[0DEh 0222   2]                    Vendor Id : 8086
[0E0h 0224   2]                    Device Id : 2017
[0E2h 0226   2]                  Revision Id : 0001
[0E4h 0228   2]          Subsystem Vendor Id : 8086
[0E6h 0230   2]          Subsystem Device Id : 2017
[0E8h 0232   2]        Subsystem Revision Id : 0001
[0EAh 0234   1]                 Valid Fields : 00
[0EBh 0235   1]       Manufacturing Location : 00
[0ECh 0236   2]           Manufacturing Date : 0000
[0EEh 0238   2]                     Reserved : 0000
[0F0h 0240   4]                Serial Number : 76540089
[0F4h 0244   2]                         Code : 0301
[0F6h 0246   2]                 Window Count : 0100
[0F8h 0248   8]                  Window Size : 0000000000002000
[100h 0256   8]               Command Offset : 0000000000800000
[108h 0264   8]                 Command Size : 0000000000000008
[110h 0272   8]                Status Offset : 0000000000801000
[118h 0280   8]                  Status Size : 0000000000000004
[120h 0288   2]                        Flags : 0000
                            Windows buffered : 0
[122h 0290   6]                    Reserved1 : 000000000000

[128h 0296   2]                Subtable Type : 0005 [NVDIMM Block Data Window Region]
[12Ah 0298   2]                       Length : 0028

[12Ch 0300   2]                 Region Index : 0001
[12Eh 0302   2]                 Window Count : 0100
[130h 0304   8]                       Offset : 0000000000000000
[138h 0312   8]                         Size : 0000000000002000
[140h 0320   8]                     Capacity : 0000000FE0000000
[148h 0328   8]                Start Address : 0000000010000000

[150h 0336   2]                Subtable Type : 0006 [Flush Hint Address]
[152h 0338   2]                       Length : 0020

[154h 0340   4]                Device Handle : 00000001
[158h 0344   2]                   Hint Count : 0002
[15Ah 0346   6]                     Reserved : 000000000000
[160h 0352   8]                 Hint Address : 0000000418000000
[168h 0360   8]                 Hint Address : 0000000618000000

[170h 0368   2]                Subtable Type : 0007 [Platform Capabilities]
[172h 0370   2]                       Length : 0010

[174h 0372   1]           Highest Capability : 00
[175h 0373   3]                     Reserved : 000000
[178h 0376   4] Capabilities (decoded below) : 00000005
                       Cache Flush to NVDIMM : 1
                      Memory Flush to NVDIMM : 0
                            Memory Mirroring : 1
[17Ch 0380   4]                     Reserved : 00000000

Raw Table Data: Length 384 (0x180)

    0000: 4E 46 49 54 80 01 00 00 01 2D 49 4E 54 45 4C 20  // NFIT.....-INTEL 
    0010: 54 65 6D 70 6C 61 74 65 01 00 00 00 49 4E 54 4C  // Template....INTL
    0020: 03 07 19 20 00 00 00 00 00 00 38 00 01 00 00 00  // ... ......8.....
    0030: 00 00 00 00 00 00 00 00 30 05 AF 91 86 5D 0E 47  // ........0....].G
    0040: A6 B0 0A 2D B9 40 82 49 00 00 00 7C 03 00 00 00  // ...-.@.I...|....
    0050: 00 00 00 0C 00 00 00 00 08 00 00 00 00 00 00 00  // ................
    0060: 01 00 30 00 01 00 00 00 04 00 00 00 01 00 01 00  // ..0.............
    0070: 00 00 00 04 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0080: 00 00 00 08 00 00 00 00 01 00 03 00 2A 00 00 00  // ............*...
    0090: 02 00 20 00 01 00 00 00 04 00 00 00 00 01 00 00  // .. .............
    00A0: 00 00 00 00 03 00 00 00 06 00 00 00 09 00 00 00  // ................
    00B0: 03 00 28 00 00 00 00 00 B4 13 5D 40 91 0B 29 93  // ..(.......]@..).
    00C0: 67 E8 23 4C 00 00 00 88 00 11 22 33 44 55 66 77  // g.#L......"3DUfw
    00D0: 88 99 AA BB CC DD EE FF 04 00 50 00 01 00 86 80  // ..........P.....
    00E0: 17 20 01 00 86 80 17 20 01 00 00 00 00 00 00 00  // . ..... ........
    00F0: 89 00 54 76 01 03 00 01 00 20 00 00 00 00 00 00  // ..Tv..... ......
    0100: 00 00 80 00 00 00 00 00 08 00 00 00 00 00 00 00  // ................
    0110: 00 10 80 00 00 00 00 00 04 00 00 00 00 00 00 00  // ................
    0120: 00 00 00 00 00 00 00 00 05 00 28 00 01 00 00 01  // ..........(.....
    0130: 00 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00  // ......... ......
    0140: 00 00 00 E0 0F 00 00 00 00 00 00 10 00 00 00 00  // ................
    0150: 06 00 20 00 01 00 00 00 02 00 00 00 00 00 00 00  // .. .............
    0160: 00 00 00 18 04 00 00 00 00 00 00 18 06 00 00 00  // ................
    0170: 07 00 10 00 00 00 00 00 05 00 00 00 00 00 00 00  // ................
