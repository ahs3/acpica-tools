/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of sdev.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [SDEV]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "SDEV"    [Secure Devices table]
[004h 0004   4]                 Table Length : 00000072
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 5C
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "Template"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703


[024h 0036   1]                Subtable Type : 00 [Namespace Device]
[025h 0037   1]        Flags (decoded below) : 01
                Allow handoff to unsecure OS : 1
[026h 0038   2]                       Length : 002A

[028h 0040   2]             Device ID Offset : 000C
[02Ah 0042   2]             Device ID Length : 0016
[02Ch 0044   2]           Vendor Data Offset : 0022
[02Eh 0046   2]           Vendor Data Length : 0008
[000h 0000  22]                     Namepath : "\\_SB_.PCI0.USB1.SUB1"
[000h 0000   8]                  Vendor Data : 00 11 22 33 44 55 66 77 

[04Eh 0078   1]                Subtable Type : 01 [PCIe Endpoint Device]
[04Fh 0079   1]        Flags (decoded below) : 01
                Allow handoff to unsecure OS : 1
[050h 0080   2]                       Length : 0024

[052h 0082   2]                      Segment : 0010
[054h 0084   2]                    Start Bus : 0020
[056h 0086   2]                  Path Offset : 0010
[058h 0088   2]                  Path Length : 0004
[05Ah 0090   2]           Vendor Data Offset : 0014
[05Ch 0092   2]           Vendor Data Length : 0010
[05Eh 0094   1]                       Device : 11
[05Fh 0095   1]                     Function : 22
[060h 0096   1]                       Device : 33
[061h 0097   1]                     Function : 44
[000h 0000  16]                  Vendor Data : EE DD CC BB AA 55 66 77 88 99 AA BB CC DD EE FF 

Raw Table Data: Length 114 (0x72)

    0000: 53 44 45 56 72 00 00 00 01 5C 49 4E 54 45 4C 20  // SDEVr....\INTEL 
    0010: 54 65 6D 70 6C 61 74 65 01 00 00 00 49 4E 54 4C  // Template....INTL
    0020: 03 07 19 20 00 01 2A 00 0C 00 16 00 22 00 08 00  // ... ..*....."...
    0030: 5C 5C 5F 53 42 5F 2E 50 43 49 30 2E 55 53 42 31  // \\_SB_.PCI0.USB1
    0040: 2E 53 55 42 31 00 00 11 22 33 44 55 66 77 01 01  // .SUB1..."3DUfw..
    0050: 24 00 10 00 20 00 10 00 04 00 14 00 10 00 11 22  // $... .........."
    0060: 33 44 EE DD CC BB AA 55 66 77 88 99 AA BB CC DD  // 3D.....Ufw......
    0070: EE FF                                            // ..
