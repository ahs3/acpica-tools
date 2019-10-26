/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of vrtc.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [VRTC]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "VRTC"    [Virtual Real-Time Clock Table]
[004h 0004   4]                 Table Length : 00000044
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : F7
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000003
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703



[024h 0036  12]              PhysicalAddress : [Generic Address Structure]
[024h 0036   1]                     Space ID : 00 [SystemMemory]
[025h 0037   1]                    Bit Width : 08
[026h 0038   1]                   Bit Offset : 00
[027h 0039   1]         Encoded Access Width : 00 [Undefined/Legacy]
[028h 0040   8]                      Address : 0000000000000000

[030h 0048   4]                          IRQ : 00000000


[034h 0052  12]              PhysicalAddress : [Generic Address Structure]
[034h 0052   1]                     Space ID : 00 [SystemMemory]
[035h 0053   1]                    Bit Width : 08
[036h 0054   1]                   Bit Offset : 00
[037h 0055   1]         Encoded Access Width : 00 [Undefined/Legacy]
[038h 0056   8]                      Address : 0000000000000000

[040h 0064   4]                          IRQ : 00000000

Raw Table Data: Length 68 (0x44)

    0000: 56 52 54 43 44 00 00 00 01 F7 49 4E 54 45 4C 20  // VRTCD.....INTEL 
    0010: 54 45 4D 50 4C 41 54 45 03 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 00 08 00 00 00 00 00 00 00 00 00 00  // ... ............
    0030: 00 00 00 00 00 08 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 00 00 00 00                                      // ....
