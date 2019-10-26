/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of wsmt.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [WSMT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "WSMT"    [Windows SMM Security Migrations Table]
[004h 0004   4]                 Table Length : 00000028
[008h 0008   1]                     Revision : 00
[009h 0009   1]                     Checksum : 16
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000000
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   4]             Protection Flags : 00000005
                          FIXED_COMM_BUFFERS : 1
           COMM_BUFFER_NESTED_PTR_PROTECTION : 0
                  SYSTEM_RESOURCE_PROTECTION : 1

Raw Table Data: Length 40 (0x28)

    0000: 57 53 4D 54 28 00 00 00 00 16 49 4E 54 45 4C 20  // WSMT(.....INTEL 
    0010: 54 45 4D 50 4C 41 54 45 00 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 05 00 00 00                          // ... ....
