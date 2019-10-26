/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of msct.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [MSCT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "MSCT"    [Maximum System Characteristics Table]
[004h 0004   4]                 Table Length : 00000090
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : D1
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   4]             Proximity Offset : 00000038
[028h 0040   4]        Max Proximity Domains : 00000003
[02Ch 0044   4]            Max Clock Domains : 00000000
[030h 0048   8]         Max Physical Address : 00000FFFFFFFFFFF

[038h 0056   1]                     Revision : 01
[039h 0057   1]                       Length : 16
[03Ah 0058   4]           Domain Range Start : 00000000
[03Eh 0062   4]             Domain Range End : 00000003
[042h 0066   4]           Processor Capacity : 00000010
[046h 0070   8]              Memory Capacity : 0000004000000000

[04Eh 0078   1]                     Revision : 01
[04Fh 0079   1]                       Length : 16
[050h 0080   4]           Domain Range Start : 00000000
[054h 0084   4]             Domain Range End : 00000000
[058h 0088   4]           Processor Capacity : 00000000
[05Ch 0092   8]              Memory Capacity : 0000000000000000

[064h 0100   1]                     Revision : 01
[065h 0101   1]                       Length : 16
[066h 0102   4]           Domain Range Start : 00000000
[06Ah 0106   4]             Domain Range End : 00000000
[06Eh 0110   4]           Processor Capacity : 00000000
[072h 0114   8]              Memory Capacity : 0000000000000000

[07Ah 0122   1]                     Revision : 01
[07Bh 0123   1]                       Length : 16
[07Ch 0124   4]           Domain Range Start : 00000000
[080h 0128   4]             Domain Range End : 00000000
[084h 0132   4]           Processor Capacity : 00000000
[088h 0136   8]              Memory Capacity : 0000000000000000

Raw Table Data: Length 144 (0x90)

    0000: 4D 53 43 54 90 00 00 00 01 D1 49 4E 54 45 4C 20  // MSCT......INTEL 
    0010: 54 45 4D 50 4C 41 54 45 01 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 38 00 00 00 03 00 00 00 00 00 00 00  // ... 8...........
    0030: FF FF FF FF FF 0F 00 00 01 16 00 00 00 00 03 00  // ................
    0040: 00 00 10 00 00 00 00 00 00 00 40 00 00 00 01 16  // ..........@.....
    0050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0060: 00 00 00 00 01 16 00 00 00 00 00 00 00 00 00 00  // ................
    0070: 00 00 00 00 00 00 00 00 00 00 01 16 00 00 00 00  // ................
    0080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
