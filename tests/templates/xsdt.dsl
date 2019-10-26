/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of xsdt.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [XSDT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "XSDT"    [Extended System Description Table]
[004h 0004   4]                 Table Length : 00000064
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : A5
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   8]       ACPI Table Address   0 : 0000000000000010
[02Ch 0044   8]       ACPI Table Address   1 : 0000000000000020
[034h 0052   8]       ACPI Table Address   2 : 0000000000000030
[03Ch 0060   8]       ACPI Table Address   3 : 0000000000000040
[044h 0068   8]       ACPI Table Address   4 : 0000000000000050
[04Ch 0076   8]       ACPI Table Address   5 : 0000000000000060
[054h 0084   8]       ACPI Table Address   6 : 0000000000000070
[05Ch 0092   8]       ACPI Table Address   7 : 0000000000000080

Raw Table Data: Length 100 (0x64)

    0000: 58 53 44 54 64 00 00 00 01 A5 49 4E 54 45 4C 20  // XSDTd.....INTEL 
    0010: 54 45 4D 50 4C 41 54 45 01 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 10 00 00 00 00 00 00 00 20 00 00 00  // ... ........ ...
    0030: 00 00 00 00 30 00 00 00 00 00 00 00 40 00 00 00  // ....0.......@...
    0040: 00 00 00 00 50 00 00 00 00 00 00 00 60 00 00 00  // ....P.......`...
    0050: 00 00 00 00 70 00 00 00 00 00 00 00 80 00 00 00  // ....p...........
    0060: 00 00 00 00                                      // ....
