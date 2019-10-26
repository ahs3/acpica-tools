/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of cpep.aml, Tue Aug  6 10:34:04 2019
 *
 * ACPI Data Table [CPEP]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "CPEP"    [Corrected Platform Error Polling table]
[004h 0004   4]                 Table Length : 00000034
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 29
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000000
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   8]                     Reserved : 0000000000000000

[02Ch 0044   1]                Subtable Type : 00
[02Dh 0045   1]                       Length : 08
[02Eh 0046   1]                 Processor ID : 00
[02Fh 0047   1]                Processor EID : 00
[030h 0048   4]             Polling Interval : 00000000

Raw Table Data: Length 52 (0x34)

    0000: 43 50 45 50 34 00 00 00 01 29 49 4E 54 45 4C 20  // CPEP4....)INTEL 
    0010: 54 45 4D 50 4C 41 54 45 00 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 00 00 00 00 00 00 00 00 00 08 00 00  // ... ............
    0030: 00 00 00 00                                      // ....
