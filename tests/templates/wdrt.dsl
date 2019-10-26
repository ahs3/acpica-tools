/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of wdrt.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [WDRT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "WDRT"    [Watchdog Resource Table]
[004h 0004   4]                 Table Length : 00000047
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : CA
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703


[024h 0036  12]             Control Register : [Generic Address Structure]
[024h 0036   1]                     Space ID : 00 [SystemMemory]
[025h 0037   1]                    Bit Width : 20
[026h 0038   1]                   Bit Offset : 00
[027h 0039   1]         Encoded Access Width : 00 [Undefined/Legacy]
[028h 0040   8]                      Address : 0000000000000000

[030h 0048  12]               Count Register : [Generic Address Structure]
[030h 0048   1]                     Space ID : 00 [SystemMemory]
[031h 0049   1]                    Bit Width : 20
[032h 0050   1]                   Bit Offset : 00
[033h 0051   1]         Encoded Access Width : 00 [Undefined/Legacy]
[034h 0052   8]                      Address : 0000000000000000

[03Ch 0060   2]                PCI Device ID : FFFF
[03Eh 0062   2]                PCI Vendor ID : FFFF
[040h 0064   1]                      PCI Bus : 00
[041h 0065   1]                   PCI Device : 00
[042h 0066   1]                 PCI Function : 00
[043h 0067   1]                  PCI Segment : 00
[044h 0068   2]                    Max Count : FFFF
[046h 0070   1]                Counter Units : 00

Raw Table Data: Length 71 (0x47)

    0000: 57 44 52 54 47 00 00 00 01 CA 49 4E 54 45 4C 20  // WDRTG.....INTEL 
    0010: 54 45 4D 50 4C 41 54 45 01 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 00 20 00 00 00 00 00 00 00 00 00 00  // ... . ..........
    0030: 00 20 00 00 00 00 00 00 00 00 00 00 FF FF FF FF  // . ..............
    0040: 00 00 00 00 FF FF 00                             // .......
