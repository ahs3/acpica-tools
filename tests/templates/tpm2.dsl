/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of tpm2.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [TPM2]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "TPM2"    [Trusted Platform Module hardware interface table]
[004h 0004   4]                 Table Length : 0000004C
[008h 0008   1]                     Revision : 04
[009h 0009   1]                     Checksum : E5
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "Template"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   2]               Platform Class : 0001
[026h 0038   2]                     Reserved : 0000
[028h 0040   8]              Control Address : 0000000000000000
[030h 0048   4]                 Start Method : 08 [Command Response Buffer with ACPI Start Method]

[034h 0052  12]            Method Parameters : 01 02 03 04 05 06 07 08 09 0A 0B 0C
[040h 0064   4]           Minimum Log Length : 0000FFFF
[044h 0068   8]                  Log Address : 0000000000000000

Raw Table Data: Length 76 (0x4C)

    0000: 54 50 4D 32 4C 00 00 00 04 E5 49 4E 54 45 4C 20  // TPM2L.....INTEL 
    0010: 54 65 6D 70 6C 61 74 65 01 00 00 00 49 4E 54 4C  // Template....INTL
    0020: 03 07 19 20 01 00 00 00 00 00 00 00 00 00 00 00  // ... ............
    0030: 08 00 00 00 01 02 03 04 05 06 07 08 09 0A 0B 0C  // ................
    0040: FF FF 00 00 00 00 00 00 00 00 00 00              // ............
