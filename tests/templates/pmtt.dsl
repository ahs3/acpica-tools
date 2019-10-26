/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of pmtt.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [PMTT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "PMTT"    [Platform Memory Topology Table]
[004h 0004   4]                 Table Length : 000000B4
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 56
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   4]                     Reserved : 00000000

[028h 0040   1]                Subtable Type : 00 [Socket]
[029h 0041   1]                     Reserved : 00
[02Ah 0042   2]                       Length : 0080
[02Ch 0044   2]        Flags (decoded below) : 0001
                            Top-level Device : 1
                            Physical Element : 0
                                 Memory Type : 0
[02Eh 0046   2]                     Reserved : 0000
[030h 0048   2]                    Socket ID : 0000
[032h 0050   2]                     Reserved : 0000

[034h 0052   1]                Subtable Type : 01 [Memory Controller]
[035h 0053   1]                     Reserved : 00
[036h 0054   2]                       Length : 0054
[038h 0056   2]        Flags (decoded below) : 0005
                            Top-level Device : 1
                            Physical Element : 0
                                 Memory Type : 1
[03Ah 0058   2]                     Reserved : 0000
[03Ch 0060   4]                 Read Latency : 00000000
[040h 0064   4]                Write Latency : 00000000
[044h 0068   4]               Read Bandwidth : 00000000
[048h 0072   4]              Write Bandwidth : 00000000
[04Ch 0076   2]                 Access Width : 0000
[04Eh 0078   2]                    Alignment : 0000
[050h 0080   2]                     Reserved : 0000
[052h 0082   2]                 Domain Count : 0003
[054h 0084   4]             Proximity Domain : 00000000
[058h 0088   4]             Proximity Domain : 00000000
[05Ch 0092   4]             Proximity Domain : 00000000

[060h 0096   1]                Subtable Type : 02 [Physical Component (DIMM)]
[061h 0097   1]                     Reserved : 00
[062h 0098   2]                       Length : 0014
[064h 0100   2]        Flags (decoded below) : 0002
                            Top-level Device : 0
                            Physical Element : 1
                                 Memory Type : 0
[066h 0102   2]                     Reserved : 0000
[068h 0104   2]                 Component ID : 0000
[06Ah 0106   2]                     Reserved : 0000
[06Ch 0108   4]                  Memory Size : 00000000
[070h 0112   4]                  Bios Handle : 00000000

[074h 0116   1]                Subtable Type : 02 [Physical Component (DIMM)]
[075h 0117   1]                     Reserved : 00
[076h 0118   2]                       Length : 0014
[078h 0120   2]        Flags (decoded below) : 0002
                            Top-level Device : 0
                            Physical Element : 1
                                 Memory Type : 0
[07Ah 0122   2]                     Reserved : 0000
[07Ch 0124   2]                 Component ID : 0000
[07Eh 0126   2]                     Reserved : 0000
[080h 0128   4]                  Memory Size : 00000000
[084h 0132   4]                  Bios Handle : 00000000

[088h 0136   1]                Subtable Type : 01 [Memory Controller]
[089h 0137   1]                     Reserved : 00
[08Ah 0138   2]                       Length : 0020
[08Ch 0140   2]        Flags (decoded below) : 0001
                            Top-level Device : 1
                            Physical Element : 0
                                 Memory Type : 0
[08Eh 0142   2]                     Reserved : 0000
[090h 0144   4]                 Read Latency : 00000000
[094h 0148   4]                Write Latency : 00000000
[098h 0152   4]               Read Bandwidth : 00000000
[09Ch 0156   4]              Write Bandwidth : 00000000
[0A0h 0160   2]                 Access Width : 0000
[0A2h 0162   2]                    Alignment : 0000
[0A4h 0164   2]                     Reserved : 0000
[0A6h 0166   2]                 Domain Count : 0000

[0A8h 0168   1]                Subtable Type : 00 [Socket]
[0A9h 0169   1]                     Reserved : 00
[0AAh 0170   2]                       Length : 000C
[0ACh 0172   2]        Flags (decoded below) : 0001
                            Top-level Device : 1
                            Physical Element : 0
                                 Memory Type : 0
[0AEh 0174   2]                     Reserved : 0000
[0B0h 0176   2]                    Socket ID : 0000
[0B2h 0178   2]                     Reserved : 0000

Raw Table Data: Length 180 (0xB4)

    0000: 50 4D 54 54 B4 00 00 00 01 56 49 4E 54 45 4C 20  // PMTT.....VINTEL 
    0010: 54 45 4D 50 4C 41 54 45 01 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 00 00 00 00 00 00 80 00 01 00 00 00  // ... ............
    0030: 00 00 00 00 01 00 54 00 05 00 00 00 00 00 00 00  // ......T.........
    0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0050: 00 00 03 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0060: 02 00 14 00 02 00 00 00 00 00 00 00 00 00 00 00  // ................
    0070: 00 00 00 00 02 00 14 00 02 00 00 00 00 00 00 00  // ................
    0080: 00 00 00 00 00 00 00 00 01 00 20 00 01 00 00 00  // .......... .....
    0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00A0: 00 00 00 00 00 00 00 00 00 00 0C 00 01 00 00 00  // ................
    00B0: 00 00 00 00                                      // ....
