/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of uefi.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [UEFI]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "UEFI"    [UEFI Boot Optimization Table]
[004h 0004   4]                 Table Length : 00000036
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 7F
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036  16]              UUID Identifier : 03020100-0504-0706-0809-0A0B0C0D0E0F
[034h 0052   2]                  Data Offset : 0036

Raw Table Data: Length 54 (0x36)

    0000: 55 45 46 49 36 00 00 00 01 7F 49 4E 54 45 4C 20  // UEFI6.....INTEL 
    0010: 54 45 4D 50 4C 41 54 45 01 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 00 01 02 03 04 05 06 07 08 09 0A 0B  // ... ............
    0030: 0C 0D 0E 0F 36 00                                // ....6.
