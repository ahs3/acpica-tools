/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 *
 * Template for [TCPA] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "TCPA"    [Trusted Computing Platform Alliance table]
[0004]                       Table Length : 00000064
[0001]                           Revision : 02
[0001]                           Checksum : FF
[0006]                             Oem ID : "INTEL "
[0008]                       Oem Table ID : "Template"
[0004]                       Oem Revision : 00003180
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20150619

[0002]                     Platform Class : 0001
[0002]                           Reserved : 0000
[0008]               Min Event Log Length : 0000000000000000
[0008]                  Event Log Address : AABBCCDDEEFF0011
[0002]             Specification Revision : 0102
[0001]       Device Flags (decoded below) : 00
                               Pci Device : 0
                               Bus is Pnp : 0
                            Address Valid : 0
[0001]    Interrupt Flags (decoded below) : 00
                                     Mode : 0
                                 Polarity : 0
                        GPE SCI Triggered : 0
                  Global System Interrupt : 0
[0001]                         Gpe Number : 01
[0003]                           Reserved : 000000
[0004]                   Global Interrupt : 00000000

[0012]                            Address : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 20
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 0000000000000001

[0004]                           Reserved : 00000000
[0012]              Configuration Address : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 20
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 0000000000000001

[0001]                          Pci Group : 01
[0001]                            Pci Bus : 01
[0001]                         Pci Device : 01
[0001]                       Pci Function : 01
