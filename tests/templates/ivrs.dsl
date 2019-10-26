/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of ivrs.aml, Tue Aug  6 10:34:04 2019
 *
 * ACPI Data Table [IVRS]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "IVRS"    [I/O Virtualization Reporting Structure]
[004h 0004   4]                 Table Length : 000000BC
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : A1
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   4]          Virtualization Info : 00000000
[028h 0040   8]                     Reserved : 0000000000000000

[030h 0048   1]                Subtable Type : 10 [Hardware Definition Block]
[031h 0049   1]                        Flags : 14
[032h 0050   2]                       Length : 0034
[034h 0052   2]                     DeviceId : 0000

[036h 0054   2]            Capability Offset : 0000
[038h 0056   8]                 Base Address : 0000000000000000
[040h 0064   2]            PCI Segment Group : 0000
[042h 0066   2]          Virtualization Info : 0000
[044h 0068   4]                     Reserved : 00000000

[048h 0072   1]                   Entry Type : 00
[049h 0073   2]                    Device ID : 0000
[04Bh 0075   1]                 Data Setting : 00

[04Ch 0076   1]                   Entry Type : 40
[04Dh 0077   2]                    Device ID : 0000
[04Fh 0079   1]                 Data Setting : 00
[050h 0080   4]                Extended Data : 00000000

[054h 0084   1]                   Entry Type : 42
[055h 0085   2]                    Device ID : 0000
[057h 0087   1]                 Data Setting : 00
[058h 0088   1]                     Reserved : 00
[059h 0089   2]        Source Used Device ID : 0000
[05Bh 0091   1]                     Reserved : 00

[05Ch 0092   1]                   Entry Type : 48
[05Dh 0093   2]                    Device ID : 0000
[05Fh 0095   1]                 Data Setting : 00
[060h 0096   1]                       Handle : 00
[061h 0097   2]        Source Used Device ID : 0000
[063h 0099   1]                      Variety : 00

[064h 0100   1]                Subtable Type : 20 [Memory Definition Block]
[065h 0101   1]                        Flags : 08
[066h 0102   2]                       Length : 0020
[068h 0104   2]                     DeviceId : 0000

[06Ah 0106   2]               Auxiliary Data : 0000
[06Ch 0108   8]                     Reserved : 0000000000000000
[074h 0116   8]                Start Address : 0000000000000000
[07Ch 0124   8]                Memory Length : 0000000000000000

[084h 0132   1]                Subtable Type : 21 [Memory Definition Block]
[085h 0133   1]                        Flags : 04
[086h 0134   2]                       Length : 0020
[088h 0136   2]                     DeviceId : 0000

[08Ah 0138   2]               Auxiliary Data : 0000
[08Ch 0140   8]                     Reserved : 0000000000000000
[094h 0148   8]                Start Address : 0000000000000000
[09Ch 0156   8]                Memory Length : 0000000000000000

[0A4h 0164   1]                Subtable Type : 10 [Hardware Definition Block]
[0A5h 0165   1]                        Flags : 14
[0A6h 0166   2]                       Length : 0018
[0A8h 0168   2]                     DeviceId : 0000

[0AAh 0170   2]            Capability Offset : 0000
[0ACh 0172   8]                 Base Address : 0000000000000000
[0B4h 0180   2]            PCI Segment Group : 0000
[0B6h 0182   2]          Virtualization Info : 0000
[0B8h 0184   4]                     Reserved : 00000000

Raw Table Data: Length 188 (0xBC)

    0000: 49 56 52 53 BC 00 00 00 01 A1 49 4E 54 45 4C 20  // IVRS......INTEL 
    0010: 54 45 4D 50 4C 41 54 45 01 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 00 00 00 00 00 00 00 00 00 00 00 00  // ... ............
    0030: 10 14 34 00 00 00 00 00 00 00 00 00 00 00 00 00  // ..4.............
    0040: 00 00 00 00 00 00 00 00 00 00 00 00 40 00 00 00  // ............@...
    0050: 00 00 00 00 42 00 00 00 00 00 00 00 48 00 00 00  // ....B.......H...
    0060: 00 00 00 00 20 08 20 00 00 00 00 00 00 00 00 00  // .... . .........
    0070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0080: 00 00 00 00 21 04 20 00 00 00 00 00 00 00 00 00  // ....!. .........
    0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00A0: 00 00 00 00 10 14 18 00 00 00 00 00 00 00 00 00  // ................
    00B0: 00 00 00 00 00 00 00 00 00 00 00 00              // ............
