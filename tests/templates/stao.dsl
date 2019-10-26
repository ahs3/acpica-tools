/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of stao.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [STAO]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "STAO"    [Status Override table]
[004h 0004   4]                 Table Length : 0000007E
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 85
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000000
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   1]                  Ignore UART : 01
[025h 0037  16]                   Namestring : "\_SB0.BUS0.DEV1"
[035h 0053  16]                   Namestring : "\_SB0.BUS0.DEV2"
[045h 0069  21]                   Namestring : "\_SB0.BUS1.DEV1.DEV2"
[05Ah 0090  21]                   Namestring : "\_SB0.BUS1.DEV2.DEV2"
[06Fh 0111  15]                   Namestring : "\USB1.HUB1.PT1"

Raw Table Data: Length 126 (0x7E)

    0000: 53 54 41 4F 7E 00 00 00 01 85 49 4E 54 45 4C 20  // STAO~.....INTEL 
    0010: 54 45 4D 50 4C 41 54 45 00 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 01 5C 5F 53 42 30 2E 42 55 53 30 2E  // ... .\_SB0.BUS0.
    0030: 44 45 56 31 00 5C 5F 53 42 30 2E 42 55 53 30 2E  // DEV1.\_SB0.BUS0.
    0040: 44 45 56 32 00 5C 5F 53 42 30 2E 42 55 53 31 2E  // DEV2.\_SB0.BUS1.
    0050: 44 45 56 31 2E 44 45 56 32 00 5C 5F 53 42 30 2E  // DEV1.DEV2.\_SB0.
    0060: 42 55 53 31 2E 44 45 56 32 2E 44 45 56 32 00 5C  // BUS1.DEV2.DEV2.\
    0070: 55 53 42 31 2E 48 55 42 31 2E 50 54 31 00        // USB1.HUB1.PT1.
