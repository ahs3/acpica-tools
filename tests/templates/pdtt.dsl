/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of pdtt.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [PDTT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "PDTT"    [Platform Debug Trigger Table]
[004h 0004   4]                 Table Length : 00000034
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : F8
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "Template"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   1]                Trigger Count : 04
[025h 0037   3]                     Reserved : 000000
[028h 0040   4]                 Array Offset : 0000002C

[02Ch 0044   1]                Subchannel Id : AA
[02Dh 0045   1]        Flags (Decoded Below) : 03
                             Runtime Trigger : 1
                         Wait for Completion : 1
                               Trigger Order : 0

[02Eh 0046   1]                Subchannel Id : BB
[02Fh 0047   1]        Flags (Decoded Below) : 02
                             Runtime Trigger : 0
                         Wait for Completion : 1
                               Trigger Order : 0

[030h 0048   1]                Subchannel Id : CC
[031h 0049   1]        Flags (Decoded Below) : 01
                             Runtime Trigger : 1
                         Wait for Completion : 0
                               Trigger Order : 0

[032h 0050   1]                Subchannel Id : DD
[033h 0051   1]        Flags (Decoded Below) : 00
                             Runtime Trigger : 0
                         Wait for Completion : 0
                               Trigger Order : 0

Raw Table Data: Length 52 (0x34)

    0000: 50 44 54 54 34 00 00 00 01 F8 49 4E 54 45 4C 20  // PDTT4.....INTEL 
    0010: 54 65 6D 70 6C 61 74 65 01 00 00 00 49 4E 54 4C  // Template....INTL
    0020: 03 07 19 20 04 00 00 00 2C 00 00 00 AA 03 BB 02  // ... ....,.......
    0030: CC 01 DD 00                                      // ....
