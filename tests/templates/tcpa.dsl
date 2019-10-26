/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of tcpa.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [TCPA]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "TCPA"    [Trusted Computing Platform Alliance table]
[004h 0004   4]                 Table Length : 00000064
[008h 0008   1]                     Revision : 02
[009h 0009   1]                     Checksum : 10
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "Template"
[018h 0024   4]                 Oem Revision : 00003180
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   2]               Platform Class : 0001
[026h 0038   2]                     Reserved : 0000
[028h 0040   8]         Min Event Log Length : 0000000000000000
[030h 0048   8]            Event Log Address : AABBCCDDEEFF0011
[038h 0056   2]       Specification Revision : 0102
[03Ah 0058   1] Device Flags (decoded below) : 00
                                  Pci Device : 0
                                  Bus is Pnp : 0
                               Address Valid : 0
[03Bh 0059   1] Interrupt Flags (decoded below) : 00
                                        Mode : 0
                                    Polarity : 0
                           GPE SCI Triggered : 0
                     Global System Interrupt : 0
[03Ch 0060   1]                   Gpe Number : 01
[03Dh 0061   3]                     Reserved : 000000
[040h 0064   4]             Global Interrupt : 00000000

[044h 0068  12]                      Address : [Generic Address Structure]
[044h 0068   1]                     Space ID : 01 [SystemIO]
[045h 0069   1]                    Bit Width : 20
[046h 0070   1]                   Bit Offset : 00
[047h 0071   1]         Encoded Access Width : 03 [DWord Access:32]
[048h 0072   8]                      Address : 0000000000000001

[050h 0080   4]                     Reserved : 00000000
[054h 0084  12]        Configuration Address : [Generic Address Structure]
[054h 0084   1]                     Space ID : 01 [SystemIO]
[055h 0085   1]                    Bit Width : 20
[056h 0086   1]                   Bit Offset : 00
[057h 0087   1]         Encoded Access Width : 03 [DWord Access:32]
[058h 0088   8]                      Address : 0000000000000001

[060h 0096   1]                    Pci Group : 01
[061h 0097   1]                      Pci Bus : 01
[062h 0098   1]                   Pci Device : 01
[063h 0099   1]                 Pci Function : 01

Raw Table Data: Length 100 (0x64)

    0000: 54 43 50 41 64 00 00 00 02 10 49 4E 54 45 4C 20  // TCPAd.....INTEL 
    0010: 54 65 6D 70 6C 61 74 65 80 31 00 00 49 4E 54 4C  // Template.1..INTL
    0020: 03 07 19 20 01 00 00 00 00 00 00 00 00 00 00 00  // ... ............
    0030: 11 00 FF EE DD CC BB AA 02 01 00 00 01 00 00 00  // ................
    0040: 00 00 00 00 01 20 00 03 01 00 00 00 00 00 00 00  // ..... ..........
    0050: 00 00 00 00 01 20 00 03 01 00 00 00 00 00 00 00  // ..... ..........
    0060: 01 01 01 01                                      // ....
