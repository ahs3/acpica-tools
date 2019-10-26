/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of xenv.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [XENV]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "XENV"    [Xen Environment table]
[004h 0004   4]                 Table Length : 00000039
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 40
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   8]          Grant Table Address : 0A00000010000000
[02Ch 0044   8]             Grant Table Size : 0B00000000002000
[034h 0052   4]              Event Interrupt : AABB0025
[038h 0056   1]                  Event Flags : 03

Raw Table Data: Length 57 (0x39)

    0000: 58 45 4E 56 39 00 00 00 01 40 49 4E 54 45 4C 20  // XENV9....@INTEL 
    0010: 54 45 4D 50 4C 41 54 45 01 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 00 00 00 10 00 00 00 0A 00 20 00 00  // ... ......... ..
    0030: 00 00 00 0B 25 00 BB AA 03                       // ....%....
