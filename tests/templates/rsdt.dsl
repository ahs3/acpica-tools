/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of rsdt.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [RSDT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "RSDT"    [Root System Description Table]
[004h 0004   4]                 Table Length : 00000044
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : CB
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   4]       ACPI Table Address   0 : 00000010
[028h 0040   4]       ACPI Table Address   1 : 00000020
[02Ch 0044   4]       ACPI Table Address   2 : 00000030
[030h 0048   4]       ACPI Table Address   3 : 00000040
[034h 0052   4]       ACPI Table Address   4 : 00000050
[038h 0056   4]       ACPI Table Address   5 : 00000060
[03Ch 0060   4]       ACPI Table Address   6 : 00000070
[040h 0064   4]       ACPI Table Address   7 : 00000080

Raw Table Data: Length 68 (0x44)

    0000: 52 53 44 54 44 00 00 00 01 CB 49 4E 54 45 4C 20  // RSDTD.....INTEL 
    0010: 54 45 4D 50 4C 41 54 45 01 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 10 00 00 00 20 00 00 00 30 00 00 00  // ... .... ...0...
    0030: 40 00 00 00 50 00 00 00 60 00 00 00 70 00 00 00  // @...P...`...p...
    0040: 80 00 00 00                                      // ....
