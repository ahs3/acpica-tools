/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of mtmr.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [MTMR]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "MTMR"    [MID Timer Table]
[004h 0004   4]                 Table Length : 0000004C
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : B8
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000003
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703



[024h 0036  12]              PhysicalAddress : [Generic Address Structure]
[024h 0036   1]                     Space ID : 00 [SystemMemory]
[025h 0037   1]                    Bit Width : 20
[026h 0038   1]                   Bit Offset : 00
[027h 0039   1]         Encoded Access Width : 03 [DWord Access:32]
[028h 0040   8]                      Address : 0000000000000000

[030h 0048   4]                    Frequency : 00000000
[034h 0052   4]                          IRQ : 00000000


[038h 0056  12]              PhysicalAddress : [Generic Address Structure]
[038h 0056   1]                     Space ID : 00 [SystemMemory]
[039h 0057   1]                    Bit Width : 20
[03Ah 0058   1]                   Bit Offset : 00
[03Bh 0059   1]         Encoded Access Width : 03 [DWord Access:32]
[03Ch 0060   8]                      Address : 0000000000000000

[044h 0068   4]                    Frequency : 00000000
[048h 0072   4]                          IRQ : 00000000

Raw Table Data: Length 76 (0x4C)

    0000: 4D 54 4D 52 4C 00 00 00 01 B8 49 4E 54 45 4C 20  // MTMRL.....INTEL 
    0010: 54 45 4D 50 4C 41 54 45 03 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 00 20 00 03 00 00 00 00 00 00 00 00  // ... . ..........
    0030: 00 00 00 00 00 00 00 00 00 20 00 03 00 00 00 00  // ......... ......
    0040: 00 00 00 00 00 00 00 00 00 00 00 00              // ............
