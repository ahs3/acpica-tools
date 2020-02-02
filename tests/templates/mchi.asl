/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 *
 * Template for [MCHI] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "MCHI"    [Management Controller Host Interface table]
[0004]                       Table Length : 00000045
[0001]                           Revision : 01
[0001]                           Checksum : E4
[0006]                             Oem ID : "INTEL "
[0008]                       Oem Table ID : "TEMPLATE"
[0004]                       Oem Revision : 02000715
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20100528

[0001]                     Interface Type : 01
[0001]                           Protocol : 00
[0008]                      Protocol Data : 0000000000000000
[0001]                     Interrupt Type : 00
[0001]                                Gpe : 00
[0001]                    Pci Device Flag : 00
[0004]                   Global Interrupt : 00000000

[0012]                   Control Register : [Generic Address Structure]
[0001]                           Space ID : 02 [PCI_Config]
[0001]                          Bit Width : 08
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 00 [Undefined/Legacy]
[0008]                            Address : 0000000000000000

[0001]                        Pci Segment : 00
[0001]                            Pci Bus : 00
[0001]                         Pci Device : 00
[0001]                       Pci Function : 00
