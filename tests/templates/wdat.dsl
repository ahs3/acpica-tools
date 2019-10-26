/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of wdat.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [WDAT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "WDAT"    [Watchdog Action Table]
[004h 0004   4]                 Table Length : 0000005C
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : FD
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000000
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   4]                Header Length : 00000020
[028h 0040   2]                  PCI Segment : 00FF
[02Ah 0042   1]                      PCI Bus : FF
[02Bh 0043   1]                   PCI Device : FF
[02Ch 0044   1]                 PCI Function : FF
[02Dh 0045   3]                     Reserved : 000000
[030h 0048   4]                 Timer Period : 00000258
[034h 0052   4]                    Max Count : 000003FF
[038h 0056   4]                    Min Count : 00000002
[03Ch 0060   1]        Flags (decoded below) : 00
                                     Enabled : 0
                         Stopped When Asleep : 0
[03Dh 0061   3]                     Reserved : 000000
[040h 0064   4]         Watchdog Entry Count : 0000000E

[044h 0068   1]              Watchdog Action : 01
[045h 0069   1]                  Instruction : 02
[046h 0070   2]                     Reserved : 0000

[048h 0072  12]              Register Region : [Generic Address Structure]
[048h 0072   1]                     Space ID : 01 [SystemIO]
[049h 0073   1]                    Bit Width : 10
[04Ah 0074   1]                   Bit Offset : 00
[04Bh 0075   1]         Encoded Access Width : 02 [Word Access:16]
[04Ch 0076   8]                      Address : 0000000000000460

[054h 0084   4]                        Value : 00000001
[058h 0088   4]                Register Mask : 00000001

Raw Table Data: Length 92 (0x5C)

    0000: 57 44 41 54 5C 00 00 00 01 FD 49 4E 54 45 4C 20  // WDAT\.....INTEL 
    0010: 54 45 4D 50 4C 41 54 45 00 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 20 00 00 00 FF 00 FF FF FF 00 00 00  // ...  ...........
    0030: 58 02 00 00 FF 03 00 00 02 00 00 00 00 00 00 00  // X...............
    0040: 0E 00 00 00 01 02 00 00 01 10 00 02 60 04 00 00  // ............`...
    0050: 00 00 00 00 01 00 00 00 01 00 00 00              // ............
