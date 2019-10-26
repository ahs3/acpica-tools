/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of s3pt.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [S3PT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "S3PT"    [S3 Performance Table]
[004h 0004   4]                       Length : 00000034

[008h 0008   2]                         Type : 0000
[00Ah 0010   1]                       Length : 18
[00Bh 0011   1]                     Revision : 01

[00Ch 0012   4]                 Resume Count : 00000000
[010h 0016   8]                  Full Resume : 0000000000000000
[018h 0024   8]               Average Resume : 0000000000000000

[020h 0032   2]                         Type : 0001
[022h 0034   1]                       Length : 14
[023h 0035   1]                     Revision : 01

[024h 0036   8]                Suspend Start : 0000000000000000
[02Ch 0044   8]                  Suspend End : 0000000000000000

Raw Table Data: Length 52 (0x34)

    0000: 53 33 50 54 34 00 00 00 00 00 18 01 00 00 00 00  // S3PT4...........
    0010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0020: 01 00 14 01 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0030: 00 00 00 00                                      // ....
